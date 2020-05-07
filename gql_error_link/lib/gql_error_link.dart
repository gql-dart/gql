/// GQL Link to handle execution errors and exceptions
library gql_error_link;

import "dart:async";
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

  ErrorLink({
    this.onError,
    this.onException,
  });

  @override
  Stream<Response> request(Request request, [forward]) async* {
    try {
      await for (final response in forward(request)) {
        final errors = response.errors;

        if (onError != null && errors != null && errors.isNotEmpty) {
          yield* onError(
            request,
            forward,
            response,
          );

          return;
        }

        yield response;
      }
    } catch (error) {
      if (onException != null && error is LinkException) {
        yield* onException(
          request,
          forward,
          error,
        );

        return;
      }

      rethrow;
    }
  }
}
