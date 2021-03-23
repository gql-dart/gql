import "package:code_builder/code_builder.dart";
import "package:gql/ast.dart";

/// Source node represents source file and it's imports
class SourceNode {
  final String url;
  final DocumentNode document;
  final Set<SourceNode> imports;

  const SourceNode({
    required this.url,
    required this.document,
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

  Set<Reference> getRefs() => {
        ...document.definitions.map(
          (definition) => Reference(
            _getName(definition),
            url,
          ),
        ),
        ...imports.expand(
          (import) => import.getRefs(),
        ),
      };
}

String _getName(DefinitionNode def) {
  if (def is DirectiveDefinitionNode) return def.name.value;
  if (def is TypeDefinitionNode) return def.name.value;
  if (def is FragmentDefinitionNode) return def.name.value;
  if (def is TypeExtensionNode) return def.name.value;

  if (def is SchemaDefinitionNode) return "schema";

  if (def is OperationDefinitionNode) {
    if (def.name != null) return def.name!.value;
    if (def.type == OperationType.query) return "query";
    if (def.type == OperationType.mutation) return "mutation";
    if (def.type == OperationType.subscription) return "subscription";
  }
  throw Exception("Unknown DefinitionNode type");
}
