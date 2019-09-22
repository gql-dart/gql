/// Defines types related to Operation execution.
@experimental
library execution;

import "package:collection/collection.dart";
import "package:gql/ast.dart";
import "package:meta/meta.dart";

/// GraphQL Error returned if execution fails
@immutable
class GraphQLError {
  /// Error message
  final String message;

  /// Locations of the nodes in document which caused the error
  final List<ErrorLocation> locations;

  /// Path of the error node in the query
  final List<dynamic /* String | int */ > path;

  /// Implementation-specific extensions to this error
  final Map<String, dynamic> extensions;

  const GraphQLError({
    @required this.message,
    this.locations,
    this.path,
    this.extensions,
  }) : assert(message != null);

  List<Object> _getChildren() => [
        message,
        locations,
        path,
        extensions,
      ];

  @override
  String toString() => message;

  @override
  bool operator ==(Object o) =>
      o is GraphQLError &&
      const DeepCollectionEquality().equals(
        o._getChildren(),
        _getChildren(),
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        _getChildren(),
      );
}

/// Location of a GraphQL error in the request document
@immutable
class ErrorLocation {
  final int line;
  final int column;

  const ErrorLocation({
    @required this.line,
    @required this.column,
  })  : assert(line != null),
        assert(column != null);

  List<Object> _getChildren() => [
        line,
        column,
      ];

  @override
  bool operator ==(Object o) =>
      o is ErrorLocation &&
      const DeepCollectionEquality().equals(
        o._getChildren(),
        _getChildren(),
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        _getChildren(),
      );
}

/// Execution response
@immutable
class Response {
  /// Error returned executing the [Request]
  final List<GraphQLError> errors;

  /// Data returned executing the [Request]
  ///
  /// Follows the shape of requested document.
  final Map<String, dynamic> data;

  const Response({
    this.errors,
    this.data,
  });

  List<Object> _getChildren() => [
        errors,
        data,
      ];

  @override
  bool operator ==(Object o) =>
      o is Response &&
      const DeepCollectionEquality().equals(
        o._getChildren(),
        _getChildren(),
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        _getChildren(),
      );
}

/// Container of a [document] and it's [variables]
///
/// Optionally defines the [operationName]
@immutable
class Operation {
  /// Document containing at least one [OperationDefinitionNode]
  final DocumentNode document;

  /// Name of the executable definition
  ///
  /// Must be specified if [document] contains more than one [OperationDefinitionNode]
  final String operationName;

  /// Variables for the operation
  final Map<String, dynamic> variables;

  const Operation({
    @required this.document,
    this.operationName,
    this.variables = const <String, dynamic>{},
  }) : assert(document != null);

  List<Object> _getChildren() => [
        document,
        operationName,
        variables,
      ];

  @override
  bool operator ==(Object o) =>
      o is Operation &&
      const DeepCollectionEquality().equals(
        o._getChildren(),
        _getChildren(),
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        _getChildren(),
      );
}

/// Execution request
@immutable
class Request {
  /// [Operation] to be executed
  final Operation operation;

  const Request({
    @required this.operation,
  }) : assert(operation != null);

  List<Object> _getChildren() => [
        operation,
      ];

  @override
  bool operator ==(Object o) =>
      o is Request &&
      const DeepCollectionEquality().equals(
        o._getChildren(),
        _getChildren(),
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        _getChildren(),
      );
}
