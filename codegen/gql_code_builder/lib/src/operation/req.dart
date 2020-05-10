import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

List<Class> buildOperationReqClasses(
  DocumentNode doc,
) =>
    doc.definitions
        .whereType<OperationDefinitionNode>()
        .map(_buildOperationReqClass)
        .toList();

Class _buildOperationReqClass(
  OperationDefinitionNode node,
) {
  final name = node.name.value;
  final varBuilderRef = refer("${name}VarBuilder", "#var");

  return Class(
    (b) => b
      ..name = name
      ..extend = refer(
        "Request",
        "package:gql_exec/gql_exec.dart",
      )
      ..constructors = ListBuilder<Constructor>(
        <Constructor>[
          Constructor(
            (b) => b
              ..requiredParameters = ListBuilder<Parameter>(
                <Parameter>[
                  Parameter(
                    (b) => b
                      ..name = "buildVars"
                      ..type = FunctionType(
                        (b) => b
                          ..returnType = varBuilderRef
                          ..requiredParameters = ListBuilder<Reference>(
                            <Reference>[
                              varBuilderRef,
                            ],
                          ),
                      ),
                  ),
                ],
              )
              ..initializers = ListBuilder<Code>(
                <Code>[
                  refer(
                    "super",
                  ).call(
                    [],
                    {
                      "operation": refer(name, "#op"),
                      "variables": refer("buildVars").call(
                        <Expression>[
                          varBuilderRef.call([]),
                        ],
                      ).property("variables"),
                    },
                  ).code,
                ],
              ),
          ),
        ],
      ),
  );
}
