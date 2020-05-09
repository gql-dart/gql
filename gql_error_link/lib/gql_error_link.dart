/// GQL Link to handle execution errors and exceptions
library gql_error_link;

import "dart:async";
import "package:async/async.dart";
import "package:gql_link/gql_link.dart";
import "package:gql_exec/gql_exec.dart";

/// A handler of GraphQL errors.
typedef ErrorHandler = Stream<Response> Function(
  Request request,
  NextLink forward,
  Response response,
);

/// A handler of Link Exceptions.
typedef ExceptionHandler = Stream<Response> Function(
  Request request,
  NextLink forward,
  LinkException exception,
);

/// [ErrorLink] allows interception of GraphQL errors (using [onError])
/// and [LinkException]s (using [onException]).
///
/// In both cases [ErrorLink] transfers control over to the handler which is
/// then responsible for yielding [Response]s.
class ErrorLink extends Link {
  final ErrorHandler onError;
  final ExceptionHandler onException;

  const ErrorLink({
    this.onError,
    this.onException,
  });

  @override
  Stream<Response> request(
    Request request, [
    forward,
  ]) async* {
    await for (final result in Result.captureStream(forward(request))) {
      if (result.isError) {
        final error = result.asError.error;

        if (onException != null && error is LinkException) {
          final stream = onException(request, forward, error);

          if (stream != null) {
            yield* stream;

            return;
          }
        }

        yield* Stream.error(error);
      }

      if (result.isValue) {
        final response = result.asValue.value;
        final errors = response.errors;

        if (onError != null && errors != null && errors.isNotEmpty) {
          final stream = onError(request, forward, response);

          if (stream != null) {
            yield* stream;

            return;
          }
        }

        yield response;
      }
    }
  }
}
