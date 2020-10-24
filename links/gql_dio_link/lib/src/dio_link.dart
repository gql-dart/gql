import "package:dio/dio.dart" as dio;
import "package:gql_dio_link/src/dio_gql_client.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_http_link/gql_http_link.dart";
import "package:gql_link/gql_link.dart";

class DioLink extends Link {
  final HttpLink _link;

  DioLink(
    String uri, {
    Map<String, String> defaultHeaders = const {},
    bool useGETForQueries = false,
    dio.Dio client,
    RequestSerializer serializer = const RequestSerializer(),
    ResponseParser parser = const ResponseParser(),
  }) : _link = HttpLink.customClient(
          uri,
          client: DioGqlClient(client),
          defaultHeaders: defaultHeaders,
          serializer: serializer,
          parser: parser,
          useGETForQueries: useGETForQueries,
        );

  @override
  Stream<Response> request(Request request, [forward]) =>
      _link.request(request, forward);

  /// Closes the underlining [http.Client]
  void dispose() {
    _link?.dispose();
  }
}