import "package:collection/collection.dart";
import "package:gql_exec/src/context.dart";
import "package:gql_exec/src/operation.dart";
import "package:meta/meta.dart";

/// Execution request of an [operation] with [variables].
@immutable
class Request {
  /// [Operation] to be executed
  final Operation operation;

  /// Variables of the operation for this request
  final Map<String, dynamic> variables;

  /// A [Context] to be passed along with a [Request]
  final Context context;

  const Request({
    @required this.operation,
    this.variables = const <String, dynamic>{},
    this.context = const Context(),
  })  : assert(operation != null),
        assert(context != null);

  /// Clone this request adding an [entry] to [context]
  Request withContextEntry<T extends ContextEntry>(T entry) => Request(
        operation: operation,
        variables: variables,
        context: context.withEntry<T>(entry),
      );

  /// Clone this request updating an [entry] in the [context]
  Request updateContextEntry<T extends ContextEntry>(
    ContextUpdater<T> update,
  ) =>
      Request(
        operation: operation,
        variables: variables,
        context: context.updateEntry<T>(update),
      );

  List<Object> _getChildren() => [
        operation,
        variables,
        context,
      ];

  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
      (o is Request &&
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

typedef GetRequestExtensions = dynamic Function(Request request);

/// Exposes [Request] extensions
@immutable
class RequestExtensionsThunk extends ContextEntry {
  /// Gets extensions of the [Request]
  final GetRequestExtensions getRequestExtensions;

  const RequestExtensionsThunk(
    this.getRequestExtensions,
  );

  @override
  List<Object> get fieldsForEquality => [
        getRequestExtensions,
      ];
}
