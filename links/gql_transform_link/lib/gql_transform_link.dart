///  GQL Link to transform Requests and Responses.
///  May be used to update context, document, variables, data, errors, etc.
library gql_transform_link;

import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";

typedef RequestTransformer = Request Function(Request request);

typedef ResponseTransformer = Response Function(Response response);

/// A [Link] to transform [Request]s and [Response]s
class TransformLink extends Link {
  final RequestTransformer requestTransformer;
  final ResponseTransformer responseTransformer;

  TransformLink({
    this.requestTransformer,
    this.responseTransformer,
  }) : assert(requestTransformer != null || responseTransformer != null);

  @override
  Stream<Response> request(
    Request request, [
    NextLink forward,
  ]) {
    final req =
        requestTransformer != null ? requestTransformer(request) : request;

    if (responseTransformer == null) {
      return forward(req);
    }

    return forward(req).map(responseTransformer);
  }
}
