import "package:gql/language.dart";
import "package:gql_error_link/gql_error_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";

// Let's imagine we have some terminating [Link]
final terminatingLink = Link.function(
  (request, [forward]) async* {
    // It expects [AuthToken] to be present in the context.
    final token = request.context.entry<AuthToken>();

    // If token is not present, it throws [AuthException].
    if (token == null) {
      throw AuthException();
    }

    // Otherwise, yield some [Response].
    final data = <String, String?>{
      "magic": token.token,
    };
    yield Response(
      data: data,
      response: <String, dynamic>{
        "data": data,
      },
    );
  },
);

// In this case [AuthToken] is a simple container of a [String] token.
class AuthToken extends ContextEntry {
  final String? token;

  const AuthToken({this.token});

  @override
  List<Object> get fieldsForEquality => [];
}

// Our terminating link defines it's own [AuthException]
class AuthException extends ServerException {}

// We have some means of getting a new valid token
Future<String> getNewToken() => Future.delayed(
      Duration(milliseconds: 10),
      () => "Valid token",
    );

// We'll want to handle [LinkException]s
Stream<Response> handleException(
  Request request,
  NextLink forward,
  LinkException exception,
) async* {
  // If the exception is [AuthException]
  if (exception is AuthException) {
    // We fetch a new token
    final token = await getNewToken();

    // Update the request with the new token
    final updatedRequest = request.withContextEntry(
      AuthToken(token: token),
    );

    // And try the request again
    yield* forward(updatedRequest);

    return;
  }

  // Otherwise, we rethrow the previous exception
  throw exception;
}

void main() async {
  // We use the [ErrorLink] by prepending it before the terminating link
  final link = Link.from([
    ErrorLink(onException: handleException),
    terminatingLink,
  ]);

  try {
    // Let's fetch the first Response
    final response = await link
        .request(
          Request(
            operation: Operation(
              document: parseString("{}"),
            ),
          ),
        )
        .first;

    // Internally the first response was an exception, but [ErrorLink] caught
    // it and retried the request with a valid token
    print(response.data);
  } catch (e) {
    // This was not even called
    print(e);
  }
}
