/// GQL Link to deduplicate identical requests
library gql_dedupe_link;

import "package:async/async.dart";
import "package:gql/ast.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";

/// A [Link] to deduplicate [Request]s
class DedupeLink extends Link {
  final List<OperationType> _nonDedupeOperationTypes;
  final Map<Request, StreamSplitter<Response>> _inFlight = {};

  DedupeLink({List<OperationType> nonDedupeOperationTypes = const []})
      : _nonDedupeOperationTypes = nonDedupeOperationTypes;

  @override
  Stream<Response> request(
    Request request, [
    NextLink? forward,
  ]) {
    final shouldDedupe = !_nonDedupeOperationTypes.contains(
      request.operation.getOperationType(),
    );

    if (shouldDedupe && _inFlight.containsKey(request)) {
      return _inFlight[request]!.split();
    }

    final splitter = StreamSplitter(forward!(request));

    if (shouldDedupe) _inFlight[request] = splitter;

    final closeSplitter = () {
      if (shouldDedupe) _inFlight.remove(request);

      splitter.close();
    };

    splitter.split().first.then(
          (e) => closeSplitter(),
          onError: (dynamic e) => closeSplitter(),
        );

    return splitter.split();
  }
}
