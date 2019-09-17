@experimental
library execution;

import "package:gql/ast.dart";
import "package:meta/meta.dart";

@immutable
class GraphQLError {
  final String message;
  final Iterable<ErrorLocation> locations;
  final Iterable<dynamic /* String | int */ > path;
  final Map<String, dynamic> extensions;

  const GraphQLError({
    @required this.message,
    this.locations,
    this.path,
    this.extensions,
  }) : assert(message != null);
}

@immutable
class ErrorLocation {
  final int line;
  final int column;

  const ErrorLocation({
    @required this.line,
    @required this.column,
  })  : assert(line != null),
        assert(column != null);
}

@immutable
class Response {
  final Iterable<GraphQLError> errors;
  final Map<String, dynamic> data;

  const Response({
    this.errors,
    this.data,
  });
}

@immutable
class Operation {
  final DocumentNode document;
  final String operationName;
  final Map<String, dynamic> variables;

  const Operation({
    @required this.document,
    this.operationName,
    this.variables = const <String, dynamic>{},
  }) : assert(document != null);
}

@immutable
class Request {
  final Operation operation;

  const Request({
    @required this.operation,
  }) : assert(operation != null);
}
