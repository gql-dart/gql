import "package:gql/src/language/lexer.dart";
import "package:source_span/source_span.dart";
import "package:test/test.dart";

Matcher token({
  TokenKind? kind,
  int? start,
  int? end,
  int? line,
  int? column,
  String? value,
}) =>
    predicate(
      (Token token) =>
          token.kind == kind &&
          token.span!.start.offset == start &&
          token.span!.end.offset == end &&
          token.span!.start.line == line! - 1 &&
          token.span!.start.column == column! - 1 &&
          (value == null || token.value == value),
      "token of ${kind} at $line:$column($start-$end) $value",
    );

void main() {
  group("Lexer", () {
    late Lexer lexer;

    List<Token> tokenize(String text, {bool skipComments = true}) =>
        lexer.tokenize(
          SourceFile.fromString(text, url: "source"),
          skipComments: skipComments,
        );

    setUp(() {
      lexer = Lexer();
    });

    test("accepts BOM header", () {
      expect(
        tokenize("\uFEFF foo"),
        contains(token(
          kind: TokenKind.name,
          start: 2,
          end: 5,
          line: 1,
          column: 3,
          value: "foo",
        )),
      );
    });

    test("records line and column", () {
      expect(
        tokenize("\n \r\n \r  foo\n"),
        contains(token(
          kind: TokenKind.name,
          start: 8,
          end: 11,
          line: 4,
          column: 3,
          value: "foo",
        )),
      );
    });

    test("skips whitespaces and comments", () {
      expect(
        tokenize("\n\n    foo\n\n\n\n"),
        contains(token(
          kind: TokenKind.name,
          start: 6,
          end: 9,
          line: 3,
          column: 5,
          value: "foo",
        )),
      );

      expect(
        tokenize("\n  #comment\n  foo#comment"),
        contains(token(
          kind: TokenKind.name,
          start: 14,
          end: 17,
          line: 3,
          column: 3,
          value: "foo",
        )),
      );

      expect(
        tokenize("#comment\n#\nfoo", skipComments: false),
        allOf([
          contains(token(
            kind: TokenKind.comment,
            start: 0,
            end: 8,
            line: 1,
            column: 1,
            value: "#comment",
          )),
          contains(token(
            kind: TokenKind.comment,
            start: 9,
            end: 10,
            line: 2,
            column: 1,
            value: "#",
          )),
          contains(token(
            kind: TokenKind.name,
            start: 11,
            end: 14,
            line: 3,
            column: 1,
            value: "foo",
          )),
        ]),
      );

      expect(
        tokenize(",,,foo,,,"),
        contains(token(
          kind: TokenKind.name,
          start: 3,
          end: 6,
          line: 1,
          column: 4,
          value: "foo",
        )),
      );
    });

    test("lexes strings", () {
      expect(
        tokenize('"simple"'),
        contains(token(
          kind: TokenKind.string,
          start: 0,
          end: 8,
          line: 1,
          column: 1,
          value: "simple",
        )),
      );

      expect(
        tokenize('" white space "'),
        contains(token(
          kind: TokenKind.string,
          start: 0,
          end: 15,
          line: 1,
          column: 1,
          value: " white space ",
        )),
      );

      expect(
        tokenize('"quote \\""'),
        contains(token(
          kind: TokenKind.string,
          start: 0,
          end: 10,
          line: 1,
          column: 1,
          value: 'quote "',
        )),
      );

      expect(
        tokenize('"escaped \\n\\r\\b\\t\\f"'),
        contains(token(
          kind: TokenKind.string,
          start: 0,
          end: 20,
          line: 1,
          column: 1,
          value: "escaped \n\r\b\t\f",
        )),
      );

      expect(
        tokenize('"slashes \\\\ \\/"'),
        contains(token(
          kind: TokenKind.string,
          start: 0,
          end: 15,
          line: 1,
          column: 1,
          value: "slashes \\ /",
        )),
      );

      expect(
        tokenize('"unicode \\u1234\\u5678\\u90AB\\uCDEF"'),
        contains(token(
          kind: TokenKind.string,
          start: 0,
          end: 34,
          line: 1,
          column: 1,
          value: "unicode \u1234\u5678\u90AB\uCDEF",
        )),
      );
    });

    test("lexes block string", () {
      expect(
        tokenize('"""simple"""'),
        contains(token(
          kind: TokenKind.blockString,
          start: 0,
          end: 12,
          line: 1,
          column: 1,
          value: "simple",
        )),
      );

      expect(
        tokenize('""" white space """'),
        contains(token(
          kind: TokenKind.blockString,
          start: 0,
          end: 19,
          line: 1,
          column: 1,
          value: " white space ",
        )),
      );

      expect(
        tokenize('"""contains " quote"""'),
        contains(token(
          kind: TokenKind.blockString,
          start: 0,
          end: 22,
          line: 1,
          column: 1,
          value: 'contains " quote',
        )),
      );

      expect(
        tokenize('"""contains \\""" triplequote"""'),
        contains(token(
          kind: TokenKind.blockString,
          start: 0,
          end: 31,
          line: 1,
          column: 1,
          value: 'contains """ triplequote',
        )),
      );

      expect(
        tokenize('"""multi\nline"""'),
        contains(token(
          kind: TokenKind.blockString,
          start: 0,
          end: 16,
          line: 1,
          column: 1,
          value: "multi\nline",
        )),
      );

      expect(
        tokenize('"""multi\rline\r\nnormalized"""'),
        contains(token(
          kind: TokenKind.blockString,
          start: 0,
          end: 28,
          line: 1,
          column: 1,
          value: "multi\nline\nnormalized",
        )),
      );

      expect(
        tokenize('"""unescaped \\n\\r\\b\\t\\f\\u1234"""'),
        contains(token(
          kind: TokenKind.blockString,
          start: 0,
          end: 32,
          line: 1,
          column: 1,
          value: "unescaped \\n\\r\\b\\t\\f\\u1234",
        )),
      );

      expect(
        tokenize('"""slashes \\\\ \\/"""'),
        contains(token(
          kind: TokenKind.blockString,
          start: 0,
          end: 19,
          line: 1,
          column: 1,
          value: "slashes \\\\ \\/",
        )),
      );

      expect(
        tokenize('"""\n spans\n   multiple\n     lines\n\n"""'),
        contains(token(
          kind: TokenKind.blockString,
          start: 0,
          end: 38,
          line: 1,
          column: 1,
          value: "spans\n  multiple\n    lines",
        )),
      );
    });

    test("advance line after lexing multiline block string", () {
      expect(
        tokenize('""" \n'
            "spans \r\n"
            "multiple \n\r"
            "lines \n\n"
            '"""\n second_token'),
        contains(token(
          kind: TokenKind.name,
          start: 37,
          end: 49,
          line: 8,
          column: 2,
          value: "second_token",
        )),
      );
    });

    test("lexes numbers", () {
      expect(
        tokenize("4"),
        contains(token(
          kind: TokenKind.int,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
          value: "4",
        )),
      );

      expect(
        tokenize("4.123"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 5,
          line: 1,
          column: 1,
          value: "4.123",
        )),
      );

      expect(
        tokenize("-4"),
        contains(token(
          kind: TokenKind.int,
          start: 0,
          end: 2,
          line: 1,
          column: 1,
          value: "-4",
        )),
      );

      expect(
        tokenize("9"),
        contains(token(
          kind: TokenKind.int,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
          value: "9",
        )),
      );

      expect(
        tokenize("0"),
        contains(token(
          kind: TokenKind.int,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
          value: "0",
        )),
      );

      expect(
        tokenize("-4.123"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 6,
          line: 1,
          column: 1,
          value: "-4.123",
        )),
      );

      expect(
        tokenize("0.123"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 5,
          line: 1,
          column: 1,
          value: "0.123",
        )),
      );

      expect(
        tokenize("123e4"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 5,
          line: 1,
          column: 1,
          value: "123e4",
        )),
      );

      expect(
        tokenize("123E4"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 5,
          line: 1,
          column: 1,
          value: "123E4",
        )),
      );

      expect(
        tokenize("123e-4"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 6,
          line: 1,
          column: 1,
          value: "123e-4",
        )),
      );

      expect(
        tokenize("123e+4"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 6,
          line: 1,
          column: 1,
          value: "123e+4",
        )),
      );

      expect(
        tokenize("-1.123e4"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 8,
          line: 1,
          column: 1,
          value: "-1.123e4",
        )),
      );

      expect(
        tokenize("-1.123E4"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 8,
          line: 1,
          column: 1,
          value: "-1.123E4",
        )),
      );

      expect(
        tokenize("-1.123e-4"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 9,
          line: 1,
          column: 1,
          value: "-1.123e-4",
        )),
      );

      expect(
        tokenize("-1.123e+4"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 9,
          line: 1,
          column: 1,
          value: "-1.123e+4",
        )),
      );

      expect(
        tokenize("-1.123e4567"),
        contains(token(
          kind: TokenKind.float,
          start: 0,
          end: 11,
          line: 1,
          column: 1,
          value: "-1.123e4567",
        )),
      );
    });

    test("lexes punctuation", () {
      expect(
        tokenize("!"),
        contains(token(
          kind: TokenKind.bang,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize("\$"),
        contains(token(
          kind: TokenKind.dollar,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize("&"),
        contains(token(
          kind: TokenKind.amp,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize("("),
        contains(token(
          kind: TokenKind.parenL,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize(")"),
        contains(token(
          kind: TokenKind.parenR,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize("..."),
        contains(token(
          kind: TokenKind.spread,
          start: 0,
          end: 3,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize(":"),
        contains(token(
          kind: TokenKind.colon,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize("="),
        contains(token(
          kind: TokenKind.equals,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize("@"),
        contains(token(
          kind: TokenKind.at,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize("["),
        contains(token(
          kind: TokenKind.bracketL,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize("]"),
        contains(token(
          kind: TokenKind.bracketR,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize("{"),
        contains(token(
          kind: TokenKind.braceL,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize("|"),
        contains(token(
          kind: TokenKind.pipe,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );

      expect(
        tokenize("}"),
        contains(token(
          kind: TokenKind.braceR,
          start: 0,
          end: 1,
          line: 1,
          column: 1,
        )),
      );
    });
  });
}
