import "package:collection/collection.dart";
import "package:gql_exec/src/context.dart";
import "package:gql_exec/src/error.dart";
import "package:meta/meta.dart";

/// Execution response
@immutable
class Response {
  /// Error returned executing the [Request]
  final List<GraphQLError> errors;

  /// Data returned executing the [Request]
  ///
  /// Follows the shape of requested document.
  final Map<String, dynamic> data;

  /// A [Context] to be returned along with a [Response]
  final Context context;

  const Response({
    this.errors,
    this.data,
    this.context = const Context(),
  }) : assert(context != null);

  /// Clone this response adding an [entry] to [context]
  Response withContextEntry<T extends ContextEntry>(T entry) => Response(
        errors: errors,
        data: data,
        context: context.withEntry<T>(entry),
      );

  /// Clone this response updating an [entry] to [context]
  Response updateContextEntry<T extends ContextEntry>(
    ContextUpdater<T> update,
  ) =>
      Response(
        errors: errors,
        data: data,
        context: context.updateEntry<T>(update),
      );

  List<Object> _getChildren() => [
        errors,
        data,
        context,
      ];

  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
      (o is Response &&
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

/// Extensions returned with the response
@immutable
class ResponseExtensions extends ContextEntry {
  /// [Response] extensions
  final dynamic extensions;

  const ResponseExtensions(
    this.extensions,
  );

  @override
  List<Object> get fieldsForEquality => [
        extensions,
      ];
}
