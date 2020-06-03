[![MIT License][license-badge]][license-link]
[![PRs Welcome][prs-badge]][prs-link]
[![Watch on GitHub][github-watch-badge]][github-watch-link]
[![Star on GitHub][github-star-badge]][github-star-link]
[![Watch on GitHub][github-forks-badge]][github-forks-link]
[![Discord][discord-badge]][discord-link]

[license-badge]: https://img.shields.io/github/license/gql-dart/gql.svg?style=for-the-badge
[license-link]: https://github.com/gql-dart/gql/blob/master/LICENSE
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge
[prs-link]: https://github.com/gql-dart/gql/issues

[github-watch-badge]: https://img.shields.io/github/watchers/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-watch-link]: https://github.com/gql-dart/gql/watchers
[github-star-badge]: https://img.shields.io/github/stars/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-star-link]: https://github.com/gql-dart/gql/stargazers
[github-forks-badge]: https://img.shields.io/github/forks/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-forks-link]: https://github.com/gql-dart/gql/network/members

[discord-badge]: https://img.shields.io/discord/559455668810153989.svg?style=for-the-badge&logo=discord&logoColor=ffffff
[discord-link]: https://discord.gg/NryjpVa

GQL Link to handle execution errors and exceptions.

## Usage

An example using `ErrorLink` to act on auth exceptions.

_Note that this example is very inefficient because it not only updates token
on every request, it does so only after the request has failed first.
A more feature complete example of an auth link can be found [here](../gql_example_http_auth_link)._

```dart
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
    yield Response(
      data: <String, String>{
        "magic": token.token,
      },
    );
  },
);

// In this case [AuthToken] is a simple container of a [String] token.
class AuthToken extends ContextEntry {
  final String token;

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

```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
