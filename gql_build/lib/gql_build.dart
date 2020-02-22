import "package:build/build.dart";
import "package:gql_build/src/ast_builder.dart";
import "package:gql_build/src/data_builder.dart";
import "package:gql_build/src/op_builder.dart";
import "package:gql_build/src/req_builder.dart";
import "package:gql_build/src/schema_builder.dart";
import "package:gql_build/src/var_builder.dart";

/// Builds AST of a GraphQL document
Builder astBuilder(
  BuilderOptions options,
) =>
    AstBuilder();

/// Builds type-safe data viewer
Builder dataBuilder(
  BuilderOptions options,
) =>
    DataBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

/// Builds operation containing AST and operation name
Builder opBuilder(
  BuilderOptions options,
) =>
    OpBuilder();

/// Builds GraphQL type-safe request builder
Builder reqBuilder(
  BuilderOptions options,
) =>
    ReqBuilder();

/// Builds GraphQL type-safe variables builder
Builder varBuilder(
  BuilderOptions options,
) =>
    VarBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

/// Builds GraphQL schema types
Builder schemaBuilder(
  BuilderOptions options,
) =>
    SchemaBuilder();
