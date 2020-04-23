import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:gql/ast.dart';

import './defaults.dart';

import './definitions.dart';
export './definitions.dart';

@immutable
class GraphQLSchema extends TypeSystemDefinition {
  const GraphQLSchema(
    this.astNode, {
    this.fullDocumentAst,
    this.typeMap,
    this.directives,
  });

  @override
  final SchemaDefinitionNode astNode;

  final DocumentNode fullDocumentAst;

  final List<DirectiveDefinition> directives;

  DirectiveDefinition getDirective(String name) => directives.firstWhere(
        (d) => d.name == name,
        orElse: () => null,
      );

  List<OperationTypeDefinition> get operationTypes =>
      astNode.operationTypes.map(OperationTypeDefinition.fromNode).toList();

  /// Map of name => [TypeDefinition]
  /// TODO saturating types with awareness before they make it to the end user is important
  final BuiltMap<String, TypeDefinition> typeMap;

  /// Adds a type resolver to top-level
  TypeDefinition _withAwareness(TypeDefinition definition) =>
      TypeResolver.addedTo(definition, getType) ?? definition;

  TypeDefinition getType(String name) => _withAwareness(typeMap[name]);

  ObjectTypeDefinition _getObjectType(String name) =>
      _withAwareness(typeMap[name]) as ObjectTypeDefinition;

  Iterable<TypeDefinition> get _allTypeDefinitions =>
      BuiltSet<TypeDefinition>(typeMap.values).map(_withAwareness);

  ObjectTypeDefinition get query => _getObjectType('query');
  ObjectTypeDefinition get mutation => _getObjectType('mutation');
  ObjectTypeDefinition get subscription => _getObjectType('subscription');

  List<InterfaceTypeDefinition> get interaces =>
      _getAll<InterfaceTypeDefinition>();

  List<EnumTypeDefinition> get enums => _getAll<EnumTypeDefinition>();

  List<ObjectTypeDefinition> get objectTypes => _getAll<ObjectTypeDefinition>();

  List<UnionTypeDefinition> get unions => _getAll<UnionTypeDefinition>();

  List<InputObjectTypeDefinition> get inputObjectTypes =>
      _getAll<InputObjectTypeDefinition>();

  /// Collect all definitions of a given subtype.
  ///
  /// We use `BuiltSet` for uniqueness and ordering properties
  List<T> _getAll<T extends TypeDefinition>() =>
      _allTypeDefinitions.whereType<T>().toList();

  List<ObjectTypeDefinition> getPossibleTypes(AbstractType abstractType) {
    if (abstractType is UnionTypeDefinition) {
      return abstractType.types;
    }
    if (abstractType is InterfaceTypeDefinition) {
      return objectTypes.where(abstractType.isImplementedBy).toList();
    }
    throw ArgumentError('$abstractType is unsupported');
  }

  final isPossibleType = AbstractType.isPossibleType;

  static GraphQLSchema fromNode(DocumentNode documentNode) =>
      buildSchema(documentNode);
}

/*
 * https://github.com/graphql/graphql-js/blob/49d86bbc810d1203aa3f7d93252e51f257d9460f/src/utilities/buildASTSchema.js#L114
 * 
 * This takes the ast of a schema document produced by the parse function in
 * src/language/parser.js.
 *
 * If no schema definition is provided, then it will look for types named Query
 * and Mutation.
 *
 * Given that AST it constructs a GraphQLSchema. The resulting schema
 * has no resolve methods, so execution will use default resolvers.
 *
 * Accepts options as a second argument:
 *
 *    - commentDescriptions:
 *        Provide true to use preceding comments as the description.
 *
 */
GraphQLSchema buildSchema(
  DocumentNode documentAST,
  //options?: BuildSchemaOptions,
) {
  /*
  if (!options || !(options.assumeValid || options.assumeValidSDL)) {
    assertValidSDL(documentAST);
  }
  */
  SchemaDefinitionNode schemaDef;
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

  final typeMap = Map.fromEntries(
    _typeDefs
        .map(TypeDefinition.fromNode)
        .map((type) => MapEntry(type.name, type)),
  );

  final directives = _directiveDefs.map(DirectiveDefinition.fromNode).toList();

  // If specified directives were not explicitly declared, add them.
  directives.addAll(missingBuiltinDirectives(directives));

  return GraphQLSchema(
    schemaDef,
    typeMap: {
      ...typeMap,
      ..._operationTypeMap(typeMap, schemaDef),
    }.build(),
    directives: directives,
  );
}

Map<String, ObjectTypeDefinition> _operationTypeMap(
  Map<String, TypeDefinition> typeMap,
  SchemaDefinitionNode schemaDef,
) {
  final operationTypeNames = _getOperationTypeNames(schemaDef);
  return Map.fromEntries(
    operationTypeNames.entries
        .map((e) => MapEntry(
              e.key.name,
              typeMap[e.value] as ObjectTypeDefinition,
            ))
        .where((e) => e.value != null),
  );
}

/// Resolve a map of { [OperationType]: [String] typeName }
Map<OperationType, String> _getOperationTypeNames(
    [SchemaDefinitionNode schema]) {
  if (schema == null) {
    return {
      OperationType.query: 'Query',
      OperationType.mutation: 'Mutation',
      OperationType.subscription: 'Subscription',
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
