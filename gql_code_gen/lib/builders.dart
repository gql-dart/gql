import "package:build/build.dart";

import "package:gql_code_gen/src/builders/ast_builder.dart";
import "package:gql_code_gen/src/builders/data_builder.dart";
import "package:gql_code_gen/src/builders/enum_builder.dart";
import "package:gql_code_gen/src/builders/input_builder.dart";
import "package:gql_code_gen/src/builders/op_builder.dart";
import "package:gql_code_gen/src/builders/req_builder.dart";
import "package:gql_code_gen/src/builders/scalar_builder.dart";
import "package:gql_code_gen/src/builders/schema_builder.dart";

Builder astBuilder(
  BuilderOptions options,
) =>
    AstBuilder();

Builder dataBuilder(
  BuilderOptions options,
) =>
    DataBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

Builder enumBuilder(
  BuilderOptions options,
) =>
    EnumBuilder();

Builder inputBuilder(
  BuilderOptions options,
) =>
    InputBuilder();

Builder opBuilder(
  BuilderOptions options,
) =>
    OpBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

Builder reqBuilder(
  BuilderOptions options,
) =>
    ReqBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
    );

Builder scalarBuilder(
  BuilderOptions options,
) =>
    ScalarBuilder();

Builder schemaBuilder(
  BuilderOptions options,
) =>
    SchemaBuilder();
