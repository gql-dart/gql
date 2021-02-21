import "dart:collection";

import "package:collection/collection.dart" show IterableExtension;
import "package:meta/meta.dart";
import "package:gql/ast.dart";

import "package:gql/src/schema/defaults.dart";

import "package:gql/src/schema/definitions.dart";

//// A GraphQL Schema definition __without__ field resolution capacities.
///
/// A [schema]https://spec.graphql.org/draft/#sec-Schema)
/// represents a GraphQL service’s collective type system capabilities.
///
/// A schema is defined in terms of the types and directives it supports
/// as well as the root operation types for each kind of operation ([OperationTypeDefinition]):
/// `query`, `mutation`, and `subscription`;
/// this determines the place in the type system where those operations begin.
@immutable
class GraphQLSchema extends TypeSystemDefinition {
  const GraphQLSchema(
    this.astNode, {
    this.fullDocumentAst,
    Map<String?, TypeDefinition?>? typeMap,
    this.directives,
  }) : _typeMap = typeMap;

  @override
  final SchemaDefinitionNode? astNode;

  @override
  String? get name => null;

  final DocumentNode? fullDocumentAst;

  final List<DirectiveDefinition>? directives;

  /// Definition for the given directive [name], if any exists
  DirectiveDefinition? getDirective(String name) =>
      directives!.firstWhereOrNull(
        (d) => d.name == name,
      );

  List<OperationTypeDefinition> get operationTypes => astNode!.operationTypes
      .map(
        (o) => OperationTypeDefinition(o),
      )
      .toList();

  /// Map of all type names to their respective [TypeDefinition]s
  final Map<String?, TypeDefinition?>? _typeMap;

  /// Map of all type names to their respective [TypeDefinition]s,
  /// with type resolution enabled (if applicable)
  Map<String?, TypeDefinition?> get typeMap => _typeMap!.map(
        (name, definition) => MapEntry(
          name,
          _withAwareness(definition),
        ),
      );

  /// Adds [getType] to the given [definition] if applicable.
  ///
  /// [EnumTypeDefinition] and [ScalarTypeDefinition] do not accept [getType]
  /// because they cannot include references
  TypeDefinition? _withAwareness(TypeDefinition? definition) =>
      TypeResolver.addedTo(definition, getType) ?? definition;

  /// Resolve the given [name] into a [TypeDefinition] defined within the schema
  TypeDefinition? getType(String name) => _withAwareness(_typeMap![name]);

  ObjectTypeDefinition? _getObjectType(String name) =>
      _withAwareness(_typeMap![name]) as ObjectTypeDefinition?;

  Iterable<TypeDefinition?> get _allTypeDefinitions =>
      LinkedHashSet<TypeDefinition>.from(_typeMap!.values).map(_withAwareness);

  ObjectTypeDefinition? get query => _getObjectType("query");
  ObjectTypeDefinition? get mutation => _getObjectType("mutation");
  ObjectTypeDefinition? get subscription => _getObjectType("subscription");

  List<InterfaceTypeDefinition> get interaces =>
      _getAll<InterfaceTypeDefinition>();

  List<EnumTypeDefinition> get enums => _getAll<EnumTypeDefinition>();

  List<ObjectTypeDefinition> get objectTypes => _getAll<ObjectTypeDefinition>();

  List<UnionTypeDefinition> get unions => _getAll<UnionTypeDefinition>();

  List<InputObjectTypeDefinition> get inputObjectTypes =>
      _getAll<InputObjectTypeDefinition>();

  /// Collect all definitions of a given subtype.
  List<T> _getAll<T extends TypeDefinition>() =>
      _allTypeDefinitions.whereType<T>().toList();

  /// Get the possible [ObjectTypeDefinition]s that the given [abstractType] could be resolved into
  List<ObjectTypeDefinition> getPossibleTypes(AbstractType? abstractType) {
    if (abstractType is UnionTypeDefinition) {
      return abstractType.types;
    }
    if (abstractType is InterfaceTypeDefinition) {
      return objectTypes.where(abstractType.isImplementedBy).toList();
    }
    throw ArgumentError("$abstractType is unsupported");
  }

  /// Determine whether [objectType] is a acceptable as the given [abstractType]
  bool isSubType(
    AbstractType abstractType,
    ObjectTypeDefinition objectType,
  ) =>
      AbstractType.isSubType(abstractType, objectType);

  /// Build a schema from [documentNode]
  static GraphQLSchema fromNode(DocumentNode documentNode) =>
      buildSchema(documentNode);
}

/// Build a [GraphQLSchema] from [documentNode].
///
// TODO this is based off of the buildASTSchema.js implementation here:
//      https://github.com/graphql/graphql-js/blob/49d86bbc810d1203aa3f7d93252e51f257d9460f/src/utilities/buildASTSchema.js#L114
//      but is missing a number of options, such as validation and commentDescriptions
GraphQLSchema buildSchema(
  DocumentNode documentAST,
) {
  /*
  if (!options || !(options.assumeValid || options.assumeValidSDL)) {
    assertValidSDL(documentAST);
  }
  */
  SchemaDefinitionNode? schemaDef;
  final _typeDefs = <TypeDefinitionNode>[];
  final _directiveDefs = <DirectiveDefinitionNode>[];

  for (final def in documentAST.definitions) {
    if (def is SchemaDefinitionNode) {
      schemaDef = def;
    } else if (def is TypeDefinitionNode) {
      _typeDefs.add(def);
    } else if (def is DirectiveDefinitionNode) {
      _directiveDefs.add(def);
    }
  }

  final _typeMap = Map.fromEntries(
    _typeDefs
        .map(TypeDefinition.fromNode)
        .map((type) => MapEntry(type.name, type)),
  );

  final directives = _directiveDefs.map((d) => DirectiveDefinition(d)).toList();

  // If specified directives were not explicitly declared, add them.
  directives.addAll(missingBuiltinDirectives(directives));

  final typeMap = {
    ..._typeMap,
    ..._operationTypeMap(_typeMap, schemaDef),
  };

  return GraphQLSchema(
    schemaDef,
    typeMap: typeMap,
    directives: directives,
  );
}

Map<String, ObjectTypeDefinition?> _operationTypeMap(
  Map<String?, TypeDefinition> typeMap,
  SchemaDefinitionNode? schemaDef,
) {
  final operationTypeNames = _getOperationTypeNames(schemaDef);
  return Map.fromEntries(
    operationTypeNames.entries
        .map((e) => MapEntry(
              e.key.name,
              typeMap[e.value] as ObjectTypeDefinition?,
            ))
        .where((e) => e.value != null),
  );
}

/// Resolve a map of { [OperationType]: [String] typeName }
Map<OperationType, String> _getOperationTypeNames(
    [SchemaDefinitionNode? schema]) {
  if (schema == null) {
    return {
      OperationType.query: "Query",
      OperationType.mutation: "Mutation",
      OperationType.subscription: "Subscription",
    };
  }

  return Map.fromEntries(
    schema.operationTypes.map(
      (operationType) => MapEntry(
        operationType.operation,
        operationType.type.name.value,
      ),
    ),
  );
}
