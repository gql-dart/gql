import "package:build/build.dart";

import "./src/ast_builder.dart";
import "./src/data_builder.dart";
import "./src/req_builder.dart";
import "./src/schema_builder.dart";
import "./src/serializer_builder.dart";
import "./src/utils/config.dart";
import "./src/var_builder.dart";

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
        (options.config["add_typenames"] ?? true) as bool,
        typeOverrideMap(options.config["type_overrides"]),
        whenExtensionConfig: whenExtensionConfig(options.config));

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
      typeOverrideMap(options.config["type_overrides"]),
    );

/// Builds GraphQL schema types
Builder schemaBuilder(
  BuilderOptions options,
) =>
    SchemaBuilder(
      typeOverrideMap(options.config["type_overrides"]),
      enumFallbackConfig(options.config),
      generatePossibleTypesConfig(options.config),
    );

/// Builds an aggregate Serlializers object for [built_value]s
///
/// Builds to the same directory as the passed schema.
Builder serializerBuilder(
  BuilderOptions options,
) =>
    SerializerBuilder(
      AssetId.parse(
        options.config["schema"] as String,
      ),
      customSerializers(options.config["custom_serializers"]),
      typeOverrideMap(options.config["type_overrides"]),
    );
