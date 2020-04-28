/// AST-based GraphQL Schema Type Definitions.
///
/// Adds type resolution and useful helper methods for working with graphql schema definitions,
/// such as is useful for code generation.
///
/// The primary entrypoint is usually [GraphQLSchema.fromNode()], which accepts an [gql.ast.DocumentNode]
///
/// **NOTE**: This library is currently only for working with schema _definitions_,
/// and is not a package for implementing servers like [`graphql_server`](https://pub.dev/packages/graphql_server).
@experimental
library schema;

import "package:meta/meta.dart";

export "package:gql/src/schema/definitions.dart";
export "package:gql/src/schema/schema.dart";
