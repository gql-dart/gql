## 1.0.1+1

- add topics

## 1.0.1

- Update to dio 5.2.0, migrate from DioError to DioException (the symbol `DioError`
  is still exported from dio as typedef so this should not be a breaking change).

## 1.0.0

- Mark the package as stable with a `1.0.0` release.

## 0.3.0

* migrate to dio 5.0.0

## 0.2.5

* add statusCode to DioLinkServerException

## 0.2.4

* use HttpLinkResponseContext from gql_exec

## 0.2.3

* add support for useGETForQueries
* allow uploading Multipartfiles

## 0.2.2

* Upgrade `gql_exec`.

## 0.2.1

* Upgrade `gql_exec`.

## 0.2

* Add support for file upload

## [0.1.0-nullsafety.1]

* Migrate to null-safety.

## 0.0.5

- Pass original exception inside `DioLinkServerException` also if http request fails with error status and improve `DioLinkServerException.toString` to print part of plain response (even if it was not valid graphQL json). These should be helpful for debugging.
