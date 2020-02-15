import "package:gql/ast.dart";

/// Source node represents source file and it's imports
class SourceNode {
  final String url;
  final DocumentNode document;
  final Set<SourceNode> imports;

  const SourceNode({
    this.url,
    this.document,
    this.imports = const {},
  });

  /// Returns flattened Document as a temporary solution before existing
  /// builders have adopted [SourceNode]
  DocumentNode get flatDocument => DocumentNode(
        definitions: <DefinitionNode>[
          ...document.definitions,
          ...imports.expand(
            (import) => import.flatDocument.definitions,
          ),
        ],
      );
}
