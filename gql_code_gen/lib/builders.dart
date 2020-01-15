import "package:build/build.dart";

import "package:gql_code_gen/src/builders/ast_builder.dart";
import "package:gql_code_gen/src/builders/data_builder.dart";
import "package:gql_code_gen/src/builders/enum_builder.dart";
import "package:gql_code_gen/src/builders/input_builder.dart";
import "package:gql_code_gen/src/builders/op_builder.dart";
import "package:gql_code_gen/src/builders/req_builder.dart";
import "package:gql_code_gen/src/builders/scalar_builder.dart";
import "package:gql_code_gen/src/builders/schema_builder.dart";

// Builds AST of a GraphQL document
Builder astBuilder(
  BuilderOptions options,
) =>
    AstBuilder();

// Builds type-safe data viewer
Builder dataBuilder(
  BuilderOptions options,
) =>
    DataBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

// Builds enums from GraphQL schema
Builder enumBuilder(
  BuilderOptions options,
) =>
    EnumBuilder();

// Builds inputs from GraphQL schema
Builder inputBuilder(
  BuilderOptions options,
) =>
    InputBuilder();

// Builds operation containing AST and operation name
Builder opBuilder(
  BuilderOptions options,
) =>
    OpBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

// Builds GraphQL type-safe request builder
Builder reqBuilder(
  BuilderOptions options,
) =>
    ReqBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

// Builds scalars from GraphQL schema
Builder scalarBuilder(
  BuilderOptions options,
) =>
    ScalarBuilder();

// Builds GraphQL schema types
Builder schemaBuilder(
  BuilderOptions options,
) =>
    SchemaBuilder();
