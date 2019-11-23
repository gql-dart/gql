import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

Class buildScalarClass(
  ScalarTypeDefinitionNode node,
) =>
    Class(
      (b) => b
        ..name = "${node.name.value}"
        ..extend = Reference("Scalar", "package:gql/execution.dart")
        ..constructors = ListBuilder<Constructor>(<Constructor>[
          Constructor(
            (b) => b
              ..requiredParameters = ListBuilder<Parameter>(<Parameter>[
                Parameter((b) => b
                  ..type = Reference("String")
                  ..name = "value")
              ])
              ..constant = true
              ..initializers = ListBuilder<Code>(<Code>[
                Code("super(value)"),
              ]),
          ),
        ]),
    );
