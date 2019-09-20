@experimental
library link;

import "package:gql/execution.dart";
import "package:meta/meta.dart";

typedef NextLink = Stream<Response> Function(
  Request request,
);

abstract class Link {
  factory Link.from(
    Iterable<Link> links,
  ) =>
      _LinkChain(links);

  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]);
}

class _LinkChain implements Link {
  final Iterable<Link> links;

  _LinkChain(this.links);

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) =>
      links.toList(growable: false).reversed.fold<NextLink>(
            forward,
            (fw, link) => (op) => link.request(op, fw),
          )(request);
}
