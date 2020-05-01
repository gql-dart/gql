import "package:collection/collection.dart";
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
      identical(this, o) ||
      (o is GraphQLError &&
          const ListEquality<Object>(
            DeepCollectionEquality(),
          ).equals(
            o._getChildren(),
            _getChildren(),
          ));

  @override
  int get hashCode => const ListEquality<Object>(
        DeepCollectionEquality(),
      ).hash(
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
      identical(this, o) ||
      (o is ErrorLocation &&
          const ListEquality<Object>(
            DeepCollectionEquality(),
          ).equals(
            o._getChildren(),
            _getChildren(),
          ));

  @override
  int get hashCode => const ListEquality<Object>(
        DeepCollectionEquality(),
      ).hash(
        _getChildren(),
      );
}
