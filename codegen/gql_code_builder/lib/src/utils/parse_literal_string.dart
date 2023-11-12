import "package:code_builder/code_builder.dart";

/// gets a string literal from a LiteralExpression
/// and returns it as a Dart String without the quotes
String parseLiteralString(LiteralExpression stringLiteral) =>
    stringLiteral.literal.substring(1, stringLiteral.literal.length - 1);
