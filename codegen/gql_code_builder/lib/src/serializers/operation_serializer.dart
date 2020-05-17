import "package:built_value/serializer.dart";
import "package:gql/ast.dart";
import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";

class OperationSerializer implements StructuredSerializer<Operation> {
  @override
  Operation deserialize(
    Serializers serializers,
    Iterable serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    DocumentNode document;
    String operationName;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final keyValueInterator = iterator.current.iterator as Iterator;
      while (keyValueInterator.moveNext()) {
        final key = keyValueInterator.current as String;
        keyValueInterator.moveNext();
        final dynamic value = keyValueInterator.current;
        switch (key) {
          case "document":
            document = parseString(value as String);
            break;
          case "operationName":
            operationName = value as String;
            break;
        }
      }
    }
    return Operation(
      document: document,
      operationName: operationName,
    );
  }

  @override
  Iterable<Object> serialize(
    Serializers serializers,
    Operation operation, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      [
        ["document", printNode(operation.document)],
        if (operation.operationName != null)
          ["operationName", operation.operationName],
      ];

  @override
  Iterable<Type> get types => [Operation];

  @override
  String get wireName => "GQL_Operation";
}
