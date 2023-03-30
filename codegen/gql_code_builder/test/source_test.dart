import "package:gql/ast.dart";
import "package:gql_code_builder/source.dart";
import "package:test/test.dart";

void main() {
  test("escapes directives with reserved names", () {
    final node = SourceNode(
      url: "package:gql/test.dart",
      document: DocumentNode(
        definitions: const [
          DirectiveDefinitionNode(
            name: NameNode(value: "extends"),
          ),
        ],
      ),
    );

    expect(node.getRefs().first.symbol, "Gextends");
  });

  test("preserves directives with valid dart names", () {
    final node = SourceNode(
      url: "package:gql/test.dart",
      document: DocumentNode(
        definitions: const [
          DirectiveDefinitionNode(
            name: NameNode(value: "info"),
          ),
        ],
      ),
    );

    expect(node.getRefs().first.symbol, "info");
  });
}
