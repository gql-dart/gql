/// AST-based GraphQL Schema Type Definitions. Adds type dereferencing
///
/// The primary entrypoint is
///
/// **NOTE**: This library is currently only for working with schema _definitions_,
/// and is not a package for implementing servers like [`graphql_server`](https://pub.dev/packages/graphql_server).
///
/// It is useful for code generation use-cases
library schema;

export "package:gql/src/schema/definitions.dart";
export "package:gql/src/schema/schema.dart";
