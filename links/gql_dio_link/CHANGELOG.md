## [0.1.0-nullsafety.1]

* Migrate to null-safety.

## 0.0.5

- Pass original exception inside `DioLinkServerException` also if http request fails with error status and improve `DioLinkServerException.toString` to print part of plain response (even if it was not valid graphQL json). These should be helpful for debugging.
