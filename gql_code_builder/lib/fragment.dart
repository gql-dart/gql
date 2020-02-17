import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

import "package:gql_code_builder/src/operation/data.dart";
import "package:gql_code_builder/source.dart";

Library buildFragmentLibrary(
  Map<String, FragmentDefinitionNode> fragmentMap,
  String fragmentsDocUrl,
  SourceNode schemaSource,
  String schemaUrl,
) =>
    Library(
      (b) => b.body
        ..addAll(
          fragmentMap.values.expand(
            (def) => buildSelectionSetDataClasses(
              name: "\$${def.name.value}",
              selections: def.selectionSet.selections,
              fragmentMap: fragmentMap,
              fragmentsDocUrl: fragmentsDocUrl,
              schema: schemaSource.flatDocument,
              schemaUrl: schemaUrl,
              type: def.typeCondition.on.name.value,
            ),
          ),
        ),
    );
