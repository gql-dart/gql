import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";
import "package:gql_code_builder/src/schema.dart";
import "package:gql_code_builder/src/utils/possible_types.dart";

Library buildSchemaLibrary(
  SourceNode schemaSource,
  String partUrl,
  Map<String, Reference> typeOverrides,
  EnumFallbackConfig enumFallbackConfig, {
  bool generatePossibleTypesMap = false,
}) {
  final lib = buildSchema(
    schemaSource,
    typeOverrides,
    enumFallbackConfig,
  ) as Library;

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
  return possibleTypesLiteral.assignConst("possibleTypesMap").statement;
}

class EnumFallbackConfig {
  final bool generateFallbackValuesGlobally;
  final String? globalEnumFallbackName;
  final Map<String, String> fallbackValueMap;

  const EnumFallbackConfig({
    required this.generateFallbackValuesGlobally,
    this.globalEnumFallbackName,
    required this.fallbackValueMap,
  }) : assert(
            !generateFallbackValuesGlobally || globalEnumFallbackName != null);
}
