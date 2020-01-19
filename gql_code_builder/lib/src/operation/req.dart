import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

List<Class> buildOperationReqClasses(
  DocumentNode doc,
  DocumentNode schema,
  String opDocUrl,
  String varDocUrl,
) =>
    doc.definitions
        .whereType<OperationDefinitionNode>()
        .map(
          (op) => _buildOperationReqClass(
            op,
            schema,
            opDocUrl,
            varDocUrl,
          ),
        )
        .toList();

Class _buildOperationReqClass(
  OperationDefinitionNode node,
  DocumentNode schema,
  String opDocUrl,
  String varDocUrl,
) {
  final name = node.name.value;
  final varBuilderRef = refer("${name}VarBuilder", varDocUrl);

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
                      "operation": refer(
                        name,
                        opDocUrl,
                      ),
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
