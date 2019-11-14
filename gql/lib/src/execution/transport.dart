import "package:collection/collection.dart";
import "package:gql/src/execution/context.dart";
import "package:gql/src/execution/error.dart";
import "package:gql/src/execution/operation.dart";
import "package:meta/meta.dart";

/// Execution response
@immutable
class BaseResponse<D> {
  /// Error returned executing the [BaseRequest]
  final List<GraphQLError> errors;

  /// Data returned executing the [BaseRequest]
  ///
  /// Follows the shape of requested document.
  final D data;

  /// A [Context] to be returned along with a [Response]
  final Context context;

  const BaseResponse({
    this.errors,
    this.data,
    this.context = const Context(),
  }) : assert(context != null);

  /// Clone this response adding an [entry] to [context]
  BaseResponse withContextEntry<T extends ContextEntry>(T entry) =>
      BaseResponse<D>(
        errors: errors,
        data: data,
        context: context.withEntry<T>(entry),
      );

  /// Clone this response updating an [entry] to [context]
  BaseResponse updateContextEntry<T extends ContextEntry>(
    ContextUpdater<T> update,
  ) =>
      BaseResponse<D>(
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
      o is BaseResponse &&
      const DeepCollectionEquality().equals(
        o._getChildren(),
        _getChildren(),
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        _getChildren(),
      );
}

@immutable
class Response extends BaseResponse<Map<String, dynamic>> {
  const Response({
    List<GraphQLError> errors,
    Map<String, dynamic> data = const <String, dynamic>{},
    Context context = const Context(),
  })  : assert(context != null),
        assert(context != null),
        super(
          errors: errors,
          data: data,
          context: context,
        );
}

/// Execution request
@immutable
class BaseRequest<V> {
  /// [Operation] to be executed
  final Operation operation;

  /// Variables for the operation
  final V variables;

  /// A [Context] to be passed along with a [BaseRequest]
  final Context context;

  const BaseRequest({
    @required this.operation,
    this.variables,
    this.context = const Context(),
  })  : assert(operation != null),
        assert(context != null);

  /// Clone this request adding an [entry] to [context]
  BaseRequest withContextEntry<T extends ContextEntry>(T entry) =>
      BaseRequest<V>(
        operation: operation,
        variables: variables,
        context: context.withEntry<T>(entry),
      );

  /// Clone this request updating an [entry] in the [context]
  BaseRequest updateContextEntry<T extends ContextEntry>(
    ContextUpdater<T> update,
  ) =>
      BaseRequest<V>(
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
      o is BaseRequest &&
      const DeepCollectionEquality().equals(
        o._getChildren(),
        _getChildren(),
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        _getChildren(),
      );
}

@immutable
class Request extends BaseRequest<Map<String, dynamic>> {
  const Request({
    Operation operation,
    Map<String, dynamic> variables = const <String, dynamic>{},
    Context context = const Context(),
  })  : assert(context != null),
        assert(context != null),
        super(
          operation: operation,
          variables: variables,
          context: context,
        );
}
