/// GQL Link to deduplicate identical requests
library gql_dedupe_link;

import "package:async/async.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";

/// A [Link] to deduplicate [Request]s
class DedupeLink extends Link {
  final Map<Request, StreamSplitter<Response>> _inFlight = {};

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) {
    if (_inFlight.containsKey(request)) {
      return _inFlight[request].split();
    }

    final splitter = StreamSplitter(forward(request));

    _inFlight[request] = splitter;

    final closeSplitter = () {
      _inFlight.remove(request);

      splitter.close();
    };

    splitter.split().first.then(
          (e) => closeSplitter(),
          onError: (dynamic e) => closeSplitter(),
        );

    return splitter.split();
  }
}
