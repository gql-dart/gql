import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "package:gql_code_builder/src/operation/data.dart";

Library buildFragmentLibrary(
  Map<String, FragmentDefinitionNode> fragmentMap,
  String fragmentsDocUrl,
  DocumentNode schema,
  String schemaUrl,
) =>
    Library(
      (b) => b.body
        ..addAll(
          fragmentMap.values.expand((def) => buildSelectionSetDataClasses(
              "\$${def.name.value}",
              def.selectionSet,
              fragmentMap,
              {},
              fragmentsDocUrl,
              schema,
              schemaUrl,
              def.typeCondition.on.name.value)),
        ),
    );
