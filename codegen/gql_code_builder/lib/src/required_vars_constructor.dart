import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";
import "package:gql_code_builder/src/common.dart";

Constructor builtCreateConstructor({
  required String name,
  required Iterable<Method> getters,
  required SourceNode schemaSource,
}) {
  final className = builtClassName(name);

  /// Getters that are excluded from the create constructor
  /// because they are system getters that are not part of the data
  final excludedGettersFromCreateConstructor = ["G__typename"];

  // Filter out excluded getters
  final filteredGetters = getters.where(
    (g) => !excludedGettersFromCreateConstructor.contains(g.name),
  );

  // Create parameters for the factory constructor
  final factoryParameters = filteredGetters.map(
    (g) => Parameter(
      (b) => b
        ..name = g.name!
        ..named = true
        ..required = true
        ..type = g.returns,
    ),
  );

  final assignments = filteredGetters.map((g) {
    final typeDefinitionNode = getTypeDefinitionNode(
        schemaSource.document, g.returns!.symbol!.replaceFirst("G", ""));
    final isBuiltType = typeDefinitionNode is InputObjectTypeDefinitionNode ||
        typeDefinitionNode is ScalarTypeDefinitionNode;

    // Check if the type is nullable
    final isNullable = (g.returns! as TypeReference).isNullable ?? false;
    final assignment = isBuiltType
        ? "${g.name} = ${g.name}${isNullable ? '?' : ''}.toBuilder()"
        : "${g.name} = ${g.name}";

    return assignment;
  });

  // Construct the factory method
  return Constructor(
    (b) => b
      ..factory = true
      ..name = "create"
      ..lambda = true
      ..optionalParameters = ListBuilder(factoryParameters)
      ..body = assignments.isEmpty
          ? refer(className).call([]).code
          : Code("${className}((b) => b..${assignments.join('..')})"),
  );
}
