import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";
import "package:gql_code_builder/src/config/enum_fallback_config.dart";
import "package:gql_code_builder/src/config/tristate_optionals_config.dart";
import "package:gql_code_builder/src/schema.dart";
import "package:gql_code_builder/src/utils/possible_types.dart";

export "package:gql_code_builder/src/config/enum_fallback_config.dart";
export "./src/config/tristate_optionals_config.dart";

Library buildSchemaLibrary(SourceNode schemaSource, String partUrl,
    Map<String, Reference> typeOverrides, EnumFallbackConfig enumFallbackConfig,
    {bool generatePossibleTypesMap = false,
    Allocator? allocator,
    TriStateValueConfig triStateValueConfig = TriStateValueConfig.never,
    bool generateVarsCreateFactories = false}) {
  final lib = buildSchema(
      schemaSource,
      typeOverrides,
      enumFallbackConfig,
      allocator ?? Allocator(),
      triStateValueConfig,
      generateVarsCreateFactories) as Library;

  final Code? possibleTypes;
  if (generatePossibleTypesMap && lib.body.isNotEmpty) {
    possibleTypes = buildPossibleTypes(schemaSource.document);
  } else {
    possibleTypes = null;
  }
  return lib.rebuild(
    (b) {
      b.directives.add(
        Directive.part(partUrl),
      );
      if (possibleTypes != null) {
        b.body.add(possibleTypes);
      }
      return b;
    },
  );
}

Code buildPossibleTypes(DocumentNode document) {
  // generate the map of possible types
  final possibleTypesMap = document.possibleTypesMap();
  // wrap the map in a literal for codegen
  final possibleTypesLiteral = literalMap(possibleTypesMap);
  // assign the literal to a const variable named "possibleTypes"
  return declareConst("possibleTypesMap",
          type: Reference("Map<String, Set<String>>"))
      .assign(possibleTypesLiteral)
      .statement;
}
