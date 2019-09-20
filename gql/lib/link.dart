/// [DocumentNode]-based GraphQL execution interface.
@experimental
library link;

import "package:gql/execution.dart";
import "package:meta/meta.dart";

/// Type of the `forward` function
typedef NextLink = Stream<Response> Function(
  Request request,
);

/// [DocumentNode]-based GraphQL execution interface
abstract class Link {
  /// Create `Link` by chaining multiple [links]
  factory Link.from(
    List<Link> links,
  ) =>
      _LinkChain(links);

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

class _LinkChain implements Link {
  final List<Link> links;

  _LinkChain(this.links);

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
