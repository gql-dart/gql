import "package:gql/src/language/parser.dart";
import "package:source_span/source_span.dart";
import "package:test/test.dart";

final Matcher Function(String, int, int, [int, int]) throwsSourceSpanException =
    (
  String message,
  int startLine,
  int startColumn, [
  int? endLine,
  int? endColumn,
]) =>
        throwsA(
          allOf(
            TypeMatcher<SourceSpanException>(),
            predicate(
              (SourceSpanException e) => e.message == message,
              "error messages match",
            ),
            predicate(
              (SourceSpanException e) =>
                  e.span!.start.line == startLine - 1 &&
                  e.span!.start.column == startColumn - 1 &&
                  e.span!.end.line == (endLine ?? startLine) - 1 &&
                  e.span!.end.column == (endColumn ?? startColumn + 1) - 1,
              "span matches",
            ),
          ),
        );

void main() {
  group("Parser", () {
    test("Variable in a const context", () {
      expect(
        () => parseString("scalar Scalar @a(b: \$c)"),
        throwsSourceSpanException(
          "Cannot use variable in a constant context",
          1,
          21,
        ),
      );
    });

    test("Unexpected token when parsing a value", () {
      expect(
        () => parseString("type Scalar @a(a: @)"),
        throwsSourceSpanException(
          "Unexpected token found when parsing a value",
          1,
          19,
        ),
      );
    });

    test("Unknown definition type", () {
      expect(
        () => parseString("foobar {}"),
        throwsSourceSpanException(
          "Unknown definition type 'foobar'",
          1,
          1,
          1,
          7,
        ),
      );
    });

    test("Invalid fragment name", () {
      expect(
        () => parseString("fragment on {}"),
        throwsSourceSpanException(
          "Invalid fragment name 'on'",
          1,
          10,
          1,
          12,
        ),
      );
    });

    test("fragment without on", () {
      expect(
        () => parseString("fragment frag {}"),
        throwsSourceSpanException(
          "Expected keyword 'on'",
          1,
          15,
        ),
      );
    });

    test("Unknown directive location", () {
      expect(
        () => parseString("directive @dir on FOO_BAR"),
        throwsSourceSpanException(
          "Unknown directive location 'FOO_BAR'",
          1,
          19,
          1,
          26,
        ),
      );
    });

    test("Incomplete schema type extension", () {
      expect(
        () => parseString("extend schema"),
        throwsSourceSpanException(
          "Schema extension must have either directives or operation types defined",
          1,
          1,
          1,
          14,
        ),
      );
    });

    test("Incomplete input type extension", () {
      expect(
        () => parseString("extend input"),
        throwsSourceSpanException(
          "Expected an input object type name",
          1,
          13,
          1,
          13,
        ),
      );
    });

    test("Incomplete enum type extension", () {
      expect(
        () => parseString("extend enum"),
        throwsSourceSpanException(
          "Expected an enum name",
          1,
          12,
          1,
          12,
        ),
      );
    });

    test("Incomplete union type extension", () {
      expect(
        () => parseString("extend union"),
        throwsSourceSpanException(
          "Expected a union name",
          1,
          13,
          1,
          13,
        ),
      );
    });

    test("Incomplete interface type extension", () {
      expect(
        () => parseString("extend interface"),
        throwsSourceSpanException(
          "Expected an interface name",
          1,
          17,
          1,
          17,
        ),
      );
    });

    test("Missing colon before variable type", () {
      expect(
        () => parseString("query(\$foo) {}"),
        throwsSourceSpanException(
          "Expected ':' followed by variable type",
          1,
          11,
        ),
      );
    });

    test("Missing variable type", () {
      expect(
        () => parseString("query(\$foo:) {}"),
        throwsSourceSpanException(
          "Expected a named type",
          1,
          12,
        ),
      );
    });

    test("Missing \$ in variable name", () {
      expect(
        () => parseString("query(foo) {}"),
        throwsSourceSpanException(
          "Variable name must be start with '\$'",
          1,
          7,
          1,
          10,
        ),
      );
    });

    test("Unclosed list type", () {
      expect(
        () => parseString("query(\$foo: [Foo) {}"),
        throwsSourceSpanException(
          "Expected ']'",
          1,
          17,
        ),
      );
    });

    test("Missing colon before field type", () {
      expect(
        () => parseString("type Foo { bar }"),
        throwsSourceSpanException(
          "Expected ':' followed by field type",
          1,
          16,
        ),
      );
    });

    test("Missing field type", () {
      expect(
        () => parseString("type Foo { bar: }"),
        throwsSourceSpanException(
          "Expected a named type",
          1,
          17,
        ),
      );
    });

    test("Missing @ in directive name", () {
      expect(
        () => parseString("directive dir on FIELD"),
        throwsSourceSpanException(
          "Directive name must be start with '@'",
          1,
          11,
          1,
          14,
        ),
      );
    });

    test("Missing selection set", () {
      expect(
        () => parseString("query"),
        throwsSourceSpanException(
          "Expected a selection set starting with '{'",
          1,
          6,
          1,
          6,
        ),
      );
    });

    test("Missing operation types", () {
      expect(
        () => parseString("schema"),
        throwsSourceSpanException(
          "Expected a operation type definitions starting with '{'",
          1,
          7,
          1,
          7,
        ),
      );
    });

    test("Missing operation type name", () {
      expect(
        () => parseString("schema {"),
        throwsSourceSpanException(
          "Expected operation name",
          1,
          9,
          1,
          9,
        ),
      );
    });

    test("Missing colon before object field value", () {
      expect(
        () => parseString("query { foo(a: {b}) }"),
        throwsSourceSpanException(
          "Missing ':' before object field value",
          1,
          18,
        ),
      );
    });

    test("Missing object field value", () {
      expect(
        () => parseString("query { foo(a: {b:}) }"),
        throwsSourceSpanException(
          "Unexpected token found when parsing a value",
          1,
          19,
        ),
      );
    });

    test("Missing colon before argument value", () {
      expect(
        () => parseString("query { foo(a) }"),
        throwsSourceSpanException(
          "Expected ':' followed by argument value",
          1,
          14,
        ),
      );
    });

    test("Missing argument value", () {
      expect(
        () => parseString("query { foo(a:) }"),
        throwsSourceSpanException(
          "Unexpected token found when parsing a value",
          1,
          15,
        ),
      );
    });

    test("Missing colon before operation type", () {
      expect(
        () => parseString("schema { query }"),
        throwsSourceSpanException(
          "Expected ':' before operation type",
          1,
          16,
        ),
      );
    });

    test("Missing operation type", () {
      expect(
        () => parseString("schema { query: }"),
        throwsSourceSpanException(
          "Expected a named type",
          1,
          17,
        ),
      );
    });

    test("Invalid scalar extension", () {
      expect(
        () => parseString("extend scalar Foo"),
        throwsSourceSpanException(
          "Scalar extension must have either directives defined",
          1,
          1,
          1,
          18,
        ),
      );
    });

    test("Invalid type extension", () {
      expect(
        () => parseString("extend type Foo"),
        throwsSourceSpanException(
          "Object type extension must define at least one directive or field, or implement at lease one interface",
          1,
          1,
          1,
          16,
        ),
      );
    });

    test("Invalid interface extension", () {
      expect(
        () => parseString("extend interface Foo"),
        throwsSourceSpanException(
          "Interface type extension must define at least one directive or field",
          1,
          1,
          1,
          21,
        ),
      );
    });

    test("Invalid union extension", () {
      expect(
        () => parseString("extend union Foo"),
        throwsSourceSpanException(
          "Union type extension must define at least one directive or type",
          1,
          1,
          1,
          17,
        ),
      );
    });

    test("Invalid enum extension", () {
      expect(
        () => parseString("extend enum Foo"),
        throwsSourceSpanException(
          "Enum type extension must define at least one directive or value",
          1,
          1,
          1,
          16,
        ),
      );
    });

    test("Invalid input extension", () {
      expect(
        () => parseString("extend input Foo"),
        throwsSourceSpanException(
          "Input type extension must define at least one directive or field, or implement at lease one interface",
          1,
          1,
          1,
          17,
        ),
      );
    });

    test("Invalid extension", () {
      expect(
        () => parseString("extend foo"),
        throwsSourceSpanException(
          "Unknown type system extension type 'foo'",
          1,
          8,
          1,
          11,
        ),
      );
    });

    test("Type system documentation", () {
      expect(
        () => parseString(
          '''
          """"
          Type documentation
          """
          unrecognized
          ''',
        ),
        throwsSourceSpanException(
          "Unknown type system definition type 'unrecognized'",
          4,
          11,
          4,
          23,
        ),
      );
    });
  });
}
