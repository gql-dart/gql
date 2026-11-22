import "package:gql_exec/gql_exec.dart";

/// Per-request send/receive timeouts for the underlying Dio call, e.g. for
/// a single long-running GraphQL operation. Fields left `null` keep the
/// timeouts configured on the Dio client.
class DioLinkTimeoutContextEntry extends ContextEntry {
  final Duration? sendTimeout;
  final Duration? receiveTimeout;

  const DioLinkTimeoutContextEntry({this.sendTimeout, this.receiveTimeout});

  @override
  List<Object?> get fieldsForEquality => [sendTimeout, receiveTimeout];
}
