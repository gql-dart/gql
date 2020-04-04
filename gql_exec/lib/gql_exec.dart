/// Basis for GraphQL execution layer to support Link and Client.
///
///
///
/// ### `Operation`
///
/// Parsing a GraphQL file will give you a `DocumentNode`, which may contain
/// multiple operation definitions. In such case GraphQL requires you to
/// explicitly define the name of the operation to be executed. It can be
/// done by passing `operationName` to the `Operation` constructor.
///
///
/// ### `Request`
///
/// While `Operation` only carries the document and the operation name,
/// `Request` respresents the invocation of an operation. Alongside the operation,
/// it also carries the variables.
///
/// To execute a `Request` you must pass it to some execution layer.
///
///
/// ### `Response`
///
/// When some execution layer has processed the `Request` it returns `Response`
/// possibly carrying a list of errors and/or data.
///
///
/// ### `Context`
///
/// Both `Request` and `Response` may carry additional context. Context is used
/// by the execution layer.
///
/// Context is a collection of context entries. A Context may only appear once
/// per type.
///
/// ```dart
/// // Create a context entry
/// final entry = FooBarContextEntry(
///   foo: 1,
///   bar: 2,
/// );
///
/// // Create a context with an entry
/// final context = Context().withEntry(entry);
///
/// // Update context somewhere in the execution layer
/// final context2 = context.updateEntry(
///   (FooBarContextEntry entry) => FooBarContextEntry(
///     foo: entry.foo,
///     bar: entry.bar * 2,
///   ),
/// );
///
/// // Retrieve context entry somewhere else in the execution layer
/// final fooBarEntry = context.entry<FooBarContextEntry>();
/// ```
///
/// `Request` and `Response` also exposes helper methods to work with the context.
library execution;

export "src/context.dart";
export "src/error.dart";
export "src/operation.dart";
export "src/request.dart";
export "src/response.dart";
