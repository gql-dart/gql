/// Defines types related to Operation execution.
@experimental
library execution;

import "package:collection/collection.dart";
import "package:gql/ast.dart";
import "package:meta/meta.dart";

typedef ContextUpdater<T> = T Function(T entry);

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

/// Entry in the [Context].
///
/// Any class extending [ContextEntry] may be added to the [Context].
///
/// Context entries are a subject to [Request] and [Response] equality comparisons.
/// Only the values returned by [fieldsForEquality] will be treated as significant.
@immutable
abstract class ContextEntry {
  const ContextEntry();

  /// List of values to be used for equality.
  List<Object> get fieldsForEquality;

  @override
  bool operator ==(Object o) =>
      o is ContextEntry &&
      o.runtimeType == runtimeType &&
      const DeepCollectionEquality().equals(
        o.fieldsForEquality,
        fieldsForEquality,
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        fieldsForEquality,
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

/// A [Context] to be passed along with a [Request].
///
/// This implementation relies on [Object.runtimeType].
/// Context entries appear only once per type.
@immutable
class Context {
  final Map<Type, ContextEntry> _context;

  /// Create an empty context.
  ///
  /// Entries may be added later using [set].
  const Context() : _context = const <Type, ContextEntry>{};

  const Context._fromMap(Map<Type, ContextEntry> context)
      : _context = context,
        assert(context != null);

  /// Creates a context from initial values represented as a map
  ///
  /// Every values runtime [Type] must be exactly the [Type] defined by the key.
  factory Context.fromMap(Map<Type, ContextEntry> context) {
    assert(
      context.entries.every(
        (entry) => entry.value == null || entry.value.runtimeType == entry.key,
      ),
      "Every values runtime type must be exactly the key",
    );

    return Context._fromMap(context);
  }

  /// Creates a context from a list of [entries].
  ///
  /// If more then one entry per type is provided, the last one is used.
  Context.fromList(List<ContextEntry> entries)
      : assert(entries != null),
        _context = entries.fold(
          <Type, ContextEntry>{},
          (ctx, e) => <Type, ContextEntry>{
            ...ctx,
            e.runtimeType: e,
          },
        );

  /// Create a [Context] with [entry] added to the existing entries.
  Context withEntry<T extends ContextEntry>(T entry) {
    if (entry != null && T != entry.runtimeType) {
      throw ArgumentError.value(
        entry,
        "entry",
        "must be exactly of type '${T}'",
      );
    }

    return Context.fromMap(
      <Type, ContextEntry>{
        ..._context,
        T: entry,
      },
    );
  }

  /// Create a [Context] by updating entry of type [T]
  Context updateEntry<T extends ContextEntry>(
    ContextUpdater<T> update,
  ) =>
      withEntry<T>(
        update(
          entry<T>(),
        ),
      );

  /// Retrieves an entry from [Context] by type [T].
  ///
  /// If entry is not present in the [Context],
  /// the [defaultValue] is returned.
  ///
  /// If provided, [defaultValue] must exactly match the return type [T].
  T entry<T extends ContextEntry>([T defaultValue]) {
    if (defaultValue != null && T != defaultValue.runtimeType) {
      throw ArgumentError.value(
        defaultValue,
        "defaultValue",
        "does not match the expected return type '${T}'",
      );
    }
    return _context.containsKey(T) ? _context[T] as T : defaultValue;
  }

  List<Object> _getChildren() => [
        _context,
      ];

  @override
  bool operator ==(Object o) =>
      o is Context &&
      const DeepCollectionEquality().equals(
        o._getChildren(),
        _getChildren(),
      );

  @override
  int get hashCode => const DeepCollectionEquality().hash(
        _getChildren(),
      );
}
