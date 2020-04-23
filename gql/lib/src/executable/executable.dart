import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:gql/ast.dart';
import 'package:major_graphql_generator/src/schema/definitions/definitions.dart';

import './definitions.dart';

export './definitions.dart';

@immutable
class ExecutableDocument extends ExecutableWithResolver {
  ExecutableDocument(
    this.astNode, [
    this.getSchemaType,
    Iterable<DocumentNode> imports = const [],
  ])  : _fragmentNodeMap = _collectImportedFragmentNodes([astNode, ...imports]),
        super();

  final ResolveType getSchemaType;
  final BuiltMap<String, FragmentDefinitionNode> _fragmentNodeMap;

  @override
  GetExecutableType get getType =>
      GetExecutableType(getSchemaType, getFragment);

  @override
  final DocumentNode astNode;

  FragmentDefinition getFragment(String name) {
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

BuiltMap<String, FragmentDefinitionNode> _collectImportedFragmentNodes(
        Iterable<DocumentNode> documents) =>
    BuiltMap.of(
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
      ),
    );
