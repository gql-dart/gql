import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:gql/ast.dart";
import "package:gql/language.dart" as lang;
import "package:gql_code_gen/src/operation.dart";

void main() {
  final document = lang.parseString(r"""
  query FooBar($foo: Foo, $bar: String!){}
  """);

  final operations = document.definitions.whereType<OperationDefinitionNode>();

  final Spec schemaLib = buildOperationArgsClass(
    operations.first,
  );

  final formatted = DartFormatter().format(
    "${schemaLib.accept(
      DartEmitter.scoped(),
    )}",
  );

  print(formatted);
}
