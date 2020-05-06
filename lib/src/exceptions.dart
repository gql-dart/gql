import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:meta/meta.dart";
import "package:dio/dio.dart" as dio;

/// Exception occurring when parsing fails.
@immutable
class DioLinkParserException extends ResponseFormatException {
  /// Response which caused the exception
  final dio.Response response;

  const DioLinkParserException({
    @required dynamic originalException,
    @required this.response,
  }) : super(
          originalException: originalException,
        );
}

/// Exception occurring when network fails
/// or parsed response is missing both `data` and `errors`.
@immutable
class DioLinkServerException extends ServerException {
  /// Response which caused the exception
  final dio.Response response;

  const DioLinkServerException({
    @required this.response,
    @required Response parsedResponse,
  }) : super(
          parsedResponse: parsedResponse,
        );
}

@immutable
class DioLinkUnkownException extends LinkException {
  const DioLinkUnkownException({
    @required dynamic originalException,
  }) : super(originalException);
}

@immutable
class DioLinkTimeoutException extends LinkException {
  /// Either a CONNECT_TIMEOUT, RECEIVE_TIMEOUT, or SEND_TIMEOUT
  final dio.DioErrorType type;

  const DioLinkTimeoutException({
    @required this.type,
    @required dynamic originalException,
  }) : super(originalException);
}

@immutable
class DioLinkCanceledException extends LinkException {
  const DioLinkCanceledException({
    @required dynamic originalException,
  }) : super(originalException);
}
