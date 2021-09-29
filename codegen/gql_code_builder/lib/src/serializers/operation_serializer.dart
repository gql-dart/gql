import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";

import "./json_serializer.dart";

class OperationSerializer extends JsonSerializer<Operation> {
  @override
  Operation fromJson(Map<String, dynamic> json) => Operation(
        document: parseString(json["document"] as String),
        operationName: json["operationName"] as String?,
      );

  @override
  Map<String, dynamic> toJson(Operation operation) => <String, dynamic>{
        "document": printNode(operation.document),
        if (operation.operationName != null)
          "operationName": operation.operationName,
      };
}
