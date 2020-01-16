import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "package:gql_code_builder/src/operation/data.dart";

Library buildFragmentLibrary(
  List<FragmentDefinitionNode> fragmentDefinitions,
  String fragmentsDocUrl,
  DocumentNode schema,
  String schemaUrl,
) =>
    Library(
      (b) => b.body
        ..addAll(
          fragmentDefinitions.expand((def) => buildSelectionSetDataClasses(
              "\$${def.name.value}",
              def.selectionSet,
              fragmentsDocUrl,
              schema,
              schemaUrl,
              def.typeCondition.on.name.value)),
        ),
    );
