import "package:build/build.dart";
import "package:gql_build/src/ast_builder.dart";
import "package:gql_build/src/data_builder.dart";
import "package:gql_build/src/fragment_builder.dart";
import "package:gql_build/src/enum_builder.dart";
import "package:gql_build/src/input_builder.dart";
import "package:gql_build/src/op_builder.dart";
import "package:gql_build/src/req_builder.dart";
import "package:gql_build/src/scalar_builder.dart";
import "package:gql_build/src/schema_builder.dart";
import "package:gql_build/src/var_builder.dart";

/// Builds AST of a GraphQL document
Builder astBuilder(
  BuilderOptions options,
) =>
    AstBuilder();

// Builds a single file with dart classes for any fragments
Builder fragmentBuilder(
  BuilderOptions options,
) =>
    FragmentBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

// Builds type-safe data viewer
Builder dataBuilder(
  BuilderOptions options,
) =>
    DataBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

/// Builds enums from GraphQL schema
Builder enumBuilder(
  BuilderOptions options,
) =>
    EnumBuilder();

/// Builds inputs from GraphQL schema
Builder inputBuilder(
  BuilderOptions options,
) =>
    InputBuilder();

/// Builds operation containing AST and operation name
Builder opBuilder(
  BuilderOptions options,
) =>
    OpBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

/// Builds GraphQL type-safe request builder
Builder reqBuilder(
  BuilderOptions options,
) =>
    ReqBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

/// Builds GraphQL type-safe variables builder
Builder varBuilder(
  BuilderOptions options,
) =>
    VarBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

/// Builds scalars from GraphQL schema
Builder scalarBuilder(
  BuilderOptions options,
) =>
    ScalarBuilder();

/// Builds GraphQL schema types
Builder schemaBuilder(
  BuilderOptions options,
) =>
    SchemaBuilder();
