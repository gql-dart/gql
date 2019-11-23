import "package:collection/collection.dart";
import "package:gql_exec/exec/context.dart";
import "package:gql_exec/exec/operation.dart";
import "package:meta/meta.dart";

/// Execution request
@immutable
class Request {
  /// [Operation] to be executed
  final Operation operation;

  /// A [Context] to be passed along with a [Request]
  final Context context;

  const Request({
    @required this.operation,
    this.context = const Context(),
  })  : assert(operation != null),
        assert(context != null);

  /// Clone this request adding an [entry] to [context]
  Request withContextEntry<T extends ContextEntry>(T entry) => Request(
        operation: operation,
        context: context.withEntry<T>(entry),
      );

  /// Clone this request updating an [entry] in the [context]
  Request updateContextEntry<T extends ContextEntry>(
    ContextUpdater<T> update,
  ) =>
      Request(
        operation: operation,
        context: context.updateEntry<T>(update),
      );

  List<Object> _getChildren() => [
        operation,
        context,
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
