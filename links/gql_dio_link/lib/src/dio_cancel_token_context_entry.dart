import "package:dio/dio.dart";
import "package:gql_exec/gql_exec.dart";

class DioLinkCancelTokenContextEntry extends ContextEntry {
  final CancelToken? token;

  const DioLinkCancelTokenContextEntry(this.token);

  @override
  List<Object?> get fieldsForEquality => [token];
}
