/// AST-based GraphQL Executable Definitions (operations).
///
/// Adds type resolution and useful helper methods for working with executable graphql documents,
/// such as is useful for code generation.
///
/// The primary entrypoint is usually [ExecutableDocument]
/// which accepts an [gql.ast.DocumentNode],
/// a tearoff of [gql.schema.GraphQLSchema.getType()],
/// and an optional list of imported ASTs.
///
/// **NOTE**: This library is currently only for working with executable _definitions_.
@experimental
library operation;

import "package:meta/meta.dart";

export "package:gql/src/operation/definitions.dart";
export "package:gql/src/operation/executable.dart";
