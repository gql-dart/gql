import "package:meta/meta.dart";
import "package:gql/ast.dart";
import "package:gql/src/schema/definitions.dart";

import "./definitions.dart";

/// An executable [document](https://spec.graphql.org/draft/#sec-Document)
/// containing only [ExecutableDefinition]s.
///
/// If a Document contains only one operation, that operation may be unnamed or represented
/// in the shorthand form, which omits both the query keyword and operation name.
///
/// Otherwise, if a GraphQL Document contains multiple operations, each operation must be named.
/// When submitting a Document with multiple operations to a GraphQL service,
/// the name of the desired operation to be executed must also be provided.
///
/// NOTE: the spec states that
/// "Documents are only executable by a GraphQL service if they contain an [OperationDefinition]",
/// however [FragmentDefinition]-only documents are currently treated as valid here.
@immutable
class ExecutableDocument extends ExecutableWithResolver {
  ExecutableDocument(
    this.astNode, [
    this.getSchemaType,
    Iterable<DocumentNode> imports = const [],
  ])  : _fragmentNodeMap = _collectImportedFragmentNodes([astNode, ...imports]),
        super();

  final ResolveType? getSchemaType;
  final Map<String, FragmentDefinitionNode> _fragmentNodeMap;

  @override
  GetExecutableType get getType =>
      GetExecutableType(getSchemaType, getFragment);

  @override
  final DocumentNode astNode;

  FragmentDefinition? getFragment(String name) {
    final node = _fragmentNodeMap[name];
    if (node == null) {
      return null;
    }
    return FragmentDefinition(node, getType);
  }

  List<ExecutableDefinition> get definitions => astNode.definitions
      .cast<ExecutableDefinitionNode>()
      .map((def) => ExecutableDefinition.fromNode(def, getType))
      .toList();

  List<FragmentDefinition> get fragments =>
      definitions.whereType<FragmentDefinition>().toList();

  List<OperationDefinition> get operations =>
      definitions.whereType<OperationDefinition>().toList();
}

Map<String, FragmentDefinitionNode> _collectImportedFragmentNodes(
  Iterable<DocumentNode> documents,
) =>
    Map.fromEntries(
      documents
          .expand((doc) => doc.definitions)
          .whereType<FragmentDefinitionNode>()
          .map(
            (fragmentNode) => MapEntry(
              fragmentNode.name.value,
              fragmentNode,
            ),
          ),
    );
