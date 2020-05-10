import "package:gql_exec/gql_exec.dart";

/// Type of the `forward` function
typedef NextLink = Stream<Response> Function(
  Request request,
);

/// A function which returns a [Link] based on contents [Request]
///
/// Used in [Link.route]
typedef LinkRouter = Link Function(
  Request request,
);

/// [Link] as a function
///
/// Used by [Link.function]
typedef LinkFunction = Stream<Response> Function(
  Request request, [
  NextLink forward,
]);

/// [DocumentNode]-based GraphQL execution interface
abstract class Link {
  /// Create a [Link]
  const Link();

  /// Create a [Link] from a [LinkFunction]
  factory Link.function(
    LinkFunction function,
  ) =>
      _FunctionLink(function);

  /// Create a [Link] by chaining multiple [links]
  factory Link.from(
    List<Link> links,
  ) =>
      _LinkChain(links);

  /// Create a [Link] by chaining two [links]
  factory Link.concat(
    Link first,
    Link second,
  ) =>
      Link.from([first, second]);

  /// Creates a [Link] which routes [Request] to whichever link is returned from
  /// the [route] function
  factory Link.route(
    LinkRouter route,
  ) =>
      _RouterLink(route);

  /// Create a [Link] which routes to the [left] link if [test] returns `true`.
  /// Otherwise it routes to the [right] link, which defaults to passthrough.
  factory Link.split(
    bool Function(Request request) test,
    Link left, [
    Link right = const _PassthroughLink(),
  ]) =>
      _RouterLink((Request request) => test(request) ? left : right);

  /// Adds [next] after this link
  Link concat(
    Link next,
  ) =>
      Link.concat(this, next);

  /// Route requests after this link
  Link route(
    LinkRouter route,
  ) =>
      concat(_RouterLink(route));

  /// Split requests after this link
  Link split(
    bool Function(Request request) test,
    Link left, [
    Link right = const _PassthroughLink(),
  ]) =>
      concat(
        _RouterLink(
          (Request request) => test(request) ? left : right,
        ),
      );

  /// A function called when a [request] reaches this [Link]
  Stream<Response> request(
    /// An incoming [Request]
    Request request, [

    /// Function that invokes the [request] function of
    ///   the next [Link]
    ///
    /// Terminating [Link]s do not call this function.
    NextLink forward,
  ]);
}

class _FunctionLink extends Link {
  final LinkFunction function;

  const _FunctionLink(this.function);

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) =>
      function(request, forward);
}

class _LinkChain extends Link {
  final List<Link> links;

  const _LinkChain(this.links);

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) =>
      links.reversed.fold<NextLink>(
        forward,
        (fw, link) => (op) => link.request(op, fw),
      )(request);
}

class _PassthroughLink extends Link {
  const _PassthroughLink();

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) =>
      forward(request);
}

class _RouterLink extends Link {
  final LinkRouter routeFn;

  const _RouterLink(
    this.routeFn,
  ) : assert(routeFn != null);

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) async* {
    final link = routeFn(request);

    yield* link.request(
      request,
      forward,
    );
  }
}
