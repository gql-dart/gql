import "package:source_span/source_span.dart";

enum TokenKind {
  sof,
  eof,
  bang,
  dollar,
  amp,
  parenL,
  parenR,
  spread,
  colon,
  equals,
  at,
  bracketL,
  bracketR,
  braceL,
  pipe,
  braceR,
  name,
  int,
  float,
  string,
  blockString,
  comment,
}

abstract class Token {
  FileSpan? get span;

  TokenKind get kind;

  String get value;

  @override
  bool operator ==(Object other) =>
      other is Token && other.kind == kind && other.span == span;
}

class _Token implements Token {
  @override
  final TokenKind kind;
  @override
  final FileSpan? span;

  const _Token({
    required this.kind,
    this.span,
  });

  String get _text => span!.text;

  String _getValue() {
    switch (kind) {
      case TokenKind.string:
        return _text.substring(1, _text.length - 1).replaceAllMapped(
          RegExp(r'\\[nrbtf\\/"]'),
          (match) {
            switch (match.group(0)!.codeUnitAt(1)) {
              case 34: // "
              case 47: // /
              case 92: // \
                return match.group(0)![1];
              case 98: // \b
                return "\b";
              case 102: // \f
                return "\f";
              case 110: // \n
                return "\n";
              case 114: // \r
                return "\r";
              case 116: // \t
                return "\t";
              default:
                return match.group(0)!;
            }
          },
        ).replaceAllMapped(
          RegExp(r"\\u[0-9A-Za-z]{4}"),
          (match) => String.fromCharCode(
            uniCharCode(
              match.group(0)!.codeUnitAt(2),
              match.group(0)!.codeUnitAt(3),
              match.group(0)!.codeUnitAt(4),
              match.group(0)!.codeUnitAt(5),
            ),
          ),
        );
      case TokenKind.blockString:
        return dedentBlockStringValue(
          _text.substring(3, _text.length - 3).replaceAll('\\"""', '"""'),
        );
      default:
        return span!.text;
    }
  }

  @override
  String get value => _getValue();

  @override
  String toString() => "<${kind} in $span \"${value}\">";
}

class Lexer {
  List<Token> tokenize(SourceFile src, {bool skipComments = true}) {
    final scanner = _Scanner(src);
    final tokens = <Token>[];

    Token token;
    do {
      token = scanner.scanToken();
      if (!skipComments || token.kind != TokenKind.comment) {
        tokens.add(token);
      }
    } while (token.kind != TokenKind.eof);

    return tokens;
  }
}

class _Scanner {
  final SourceFile src;
  int position = -1;
  int line = 1;
  int lineStart = 0;

  _Scanner(this.src);

  int? peek({
    int offset = 0,
  }) {
    if (position + offset >= src.length) {
      return null;
    }

    final start = position + offset;

    return src.getText(start, start + 1).codeUnitAt(0);
  }

  Token createToken(
    TokenKind kind, {
    int length = 1,
    bool value = false,
  }) {
    final token = _Token(
      kind: kind,
      span: src.span(position, position + length),
    );
    position += length;
    return token;
  }

  Token scanToken() {
    if (position == -1) {
      ++position;
      return _Token(
        kind: TokenKind.sof,
        span: src.span(0, 0),
      );
    }
    consumeWhitespace();

    final code = peek();

    if (code == null) {
      return _Token(
        kind: TokenKind.eof,
        span: src.span(src.length),
      );
    }

    if ((code >= 65 && code <= 90) ||
        code == 95 ||
        (code >= 97 && code <= 122)) {
      return scanName();
    }

    if ((code >= 48 && code <= 57) || code == 45) {
      return scanNumber();
    }

    switch (code) {
      case 33:
        return createToken(TokenKind.bang);
      case 35: // #
        return scanComment();
      case 36:
        return createToken(TokenKind.dollar);
      case 38:
        return createToken(TokenKind.amp);
      case 40:
        return createToken(TokenKind.parenL);
      case 41:
        return createToken(TokenKind.parenR);
      case 46: // .
        if (peek(offset: 1) == 46 && peek(offset: 2) == 46) {
          return createToken(
            TokenKind.spread,
            length: 3,
          );
        }
        break;
      case 58:
        return createToken(TokenKind.colon);
      case 61:
        return createToken(TokenKind.equals);
      case 64:
        return createToken(TokenKind.at);
      case 91:
        return createToken(TokenKind.bracketL);
      case 93:
        return createToken(TokenKind.bracketR);
      case 123:
        return createToken(TokenKind.braceL);
      case 124:
        return createToken(TokenKind.pipe);
      case 125:
        return createToken(TokenKind.braceR);
      case 34:
        if (peek(offset: 1) == 34 && peek(offset: 2) == 34) {
          return scanBlockString();
        }

        return scanString();
    }

    throw SourceSpanException(
      "Syntax Error",
      src.span(position, position),
    );
  }

  Token scanComment() {
    var length = 0;
    int? code;

    do {
      code = peek(offset: ++length);
    } while (code != null && (code > 0x001f || code == 0x0009));

    return createToken(
      TokenKind.comment,
      length: length,
      value: true,
    );
  }

  Token scanNumber() {
    var length = 0;
    var code = peek();
    var isFloat = false;

    if (code == 45) {
      // -
      code = peek(offset: ++length);
    }

    if (code == 48) {
      // 0
      code = peek(offset: ++length);

      if (code != null && code >= 48 && code <= 57) {
        throw SourceSpanException(
          "Syntax Error",
          src.span(position, position),
        );
      }
    } else {
      length = _scanDigits(length);
      code = peek(offset: length);
    }

    if (code == 46) {
      isFloat = true;

      code = peek(offset: ++length);
      length = _scanDigits(length);
      code = peek(offset: length);
    }

    if (code == 69 || code == 101) {
      isFloat = true;

      code = peek(offset: ++length);
      if (code == 43 || code == 45) {
        code = peek(offset: ++length);
      }
      length = _scanDigits(length);
    }

    return createToken(
      isFloat ? TokenKind.float : TokenKind.int,
      length: length,
      value: true,
    );
  }

  int _scanDigits(int offset) {
    var digitOffset = offset;
    var code = peek(offset: digitOffset);

    if (code != null && code >= 48 && code <= 57) {
      do {
        code = peek(offset: ++digitOffset);
      } while (code != null && code >= 48 && code <= 57);

      return digitOffset;
    }

    throw SourceSpanException(
      "Expected a digit",
      src.span(position, position),
    );
  }

  Token scanName() {
    var length = 0;
    var code = peek();

    while (position + length != src.length &&
        code != null &&
        (code == 95 ||
            (code >= 48 && code <= 57) ||
            (code >= 65 && code <= 90) ||
            (code >= 97 && code <= 122))) {
      code = peek(offset: ++length);
    }

    return createToken(
      TokenKind.name,
      length: length,
      value: true,
    );
  }

  Token scanString() {
    final start = position;
    ++position;
    var code = peek();

    while (position < src.length &&
        code != null &&
        code != 0x000a &&
        code != 0x000d) {
      if (code == 34) {
        // "
        return _Token(
          kind: TokenKind.string,
          span: src.span(start, ++position),
        );
      }

      if (code < 0x0020 && code != 0x0009) {
        throw SourceSpanException(
          "Unexpected character in a string literal",
          src.span(
            position,
            position,
          ),
        );
      }

      ++position;
      if (code == 92) {
        // \
        code = peek();

        switch (code) {
          case 34: // "
          case 47: // /
          case 92: // \
          case 98: // \b
          case 102: // \f
          case 110: // \n
          case 114: // \r
          case 116: // \t
            break;
          case 117: // \u
            final next1 = peek(offset: 1);
            final next2 = peek(offset: 2);
            final next3 = peek(offset: 3);
            final next4 = peek(offset: 4);

            final isUnicode = next1 != null &&
                isHex(next1) &&
                next2 != null &&
                isHex(next2) &&
                next3 != null &&
                isHex(next3) &&
                next4 != null &&
                isHex(next4);

            if (!isUnicode) {
              throw SourceSpanException(
                "Expected hexadecimal number",
                src.span(
                  position + 1,
                  position + 4,
                ),
              );
            }

            position += 4;
            break;
          default:
            throw SourceSpanException(
              "Unknown escape character",
              src.span(position, position),
            );
        }

        ++position;
      }

      code = peek();
    }

    throw SourceSpanException(
      "Unexpected character in a string literal",
      src.span(position, position),
    );
  }

  Token scanBlockString() {
    final start = position;
    position += 3;
    var code = peek();

    while (position < src.length && code != null) {
      if (code == 34 && peek(offset: 1) == 34 && peek(offset: 2) == 34) {
        position += 3;

        return _Token(
          kind: TokenKind.blockString,
          span: src.span(start, position),
        );
      }

      if (code < 0x0020 && code != 0x0009 && code != 0x000a && code != 0x000d) {
        throw SourceSpanException(
          "Unexpected character in a string literal",
          src.span(position, position),
        );
      }

      if (code == 10) {
        // new line
        ++position;
        ++line;
        lineStart = position;
      } else if (code == 13) {
        if (peek(offset: 1) == 10) {
          position += 2;
        } else {
          ++position;
        }
        ++line;
        lineStart = position;
      } else if (code == 92 &&
          peek(offset: 1) == 34 &&
          peek(offset: 2) == 34 &&
          peek(offset: 3) == 34) {
        position += 4;
      } else {
        ++position;
      }

      code = peek();
    }

    throw SourceSpanException(
      "Unexpected character in a string literal",
      src.span(position, position),
    );
  }

  void consumeWhitespace() {
    while (position < src.length) {
      final next = peek();
      if (next == 9 || // tab
              next == 32 || // space
              next == 44 || // comma
              next == 0xfeff // BOM
          ) {
        ++position;
      } else if (next == 10) {
        ++position;
        ++line;
        lineStart = position;
      } else if (next == 13) {
        if (peek(offset: 1) == 10) {
          position += 2;
        } else {
          ++position;
        }
        ++line;
        lineStart = position;
      } else {
        break;
      }
    }
  }
}

bool isHex(int a) =>
    (a >= 0x30 && a <= 0x39) ||
    (a >= 0x41 && a <= 0x46) ||
    (a >= 0x61 && a <= 0x66);

int uniCharCode(int a, int b, int c, int d) =>
    char2Hex(a) << 12 | char2Hex(b) << 8 | char2Hex(c) << 4 | char2Hex(d);

int char2Hex(int a) {
  if (a >= 48 && a <= 57) {
    return a - 48;
  }

  if (a >= 65 && a <= 70) {
    return a - 55;
  }

  if (a >= 97 && a <= 102) {
    return a - 87;
  }

  return -1;
}

String dedentBlockStringValue(String value) {
  var lines = value.split(RegExp(r"\r\n|[\n\r]"));

  int? commonIndent;
  for (var i = 1; i < lines.length; i++) {
    final line = lines[i];
    final indent = leadingWhitespace(line);

    if (indent < line.length &&
        (commonIndent == null || indent < commonIndent)) {
      commonIndent = indent;
      if (commonIndent == 0) {
        break;
      }
    }
  }

  if (commonIndent != null && commonIndent != 0) {
    lines = lines.map((line) {
      if (line.length < commonIndent!) {
        return "";
      } else {
        return line.substring(commonIndent);
      }
    }).toList();
  }

  lines.skipWhile(isBlank);

  while (lines.isNotEmpty && isBlank(lines.first)) {
    lines.removeAt(0);
  }

  while (lines.isNotEmpty && isBlank(lines.last)) {
    lines.removeLast();
  }

  return lines.join("\n");
}

int leadingWhitespace(String str) {
  var i = 0;
  while (i < str.length && (str[i] == " " || str[i] == "\t")) {
    i++;
  }
  return i;
}

bool isBlank(String str) => leadingWhitespace(str) == str.length;
