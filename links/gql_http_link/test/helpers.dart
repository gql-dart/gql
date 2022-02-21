import "dart:async";
import "dart:convert";

import "package:http/http.dart" as http;

http.StreamedResponse simpleResponse(
  String body, [
  int? status,
  Map<String, String> headers = const {},
]) {
  final List<int> bytes = utf8.encode(body);
  final Stream<List<int>> stream =
      Stream<List<int>>.fromIterable(<List<int>>[bytes]);

  final http.StreamedResponse r =
      http.StreamedResponse(stream, status ?? 200, headers: headers);

  return r;
}
