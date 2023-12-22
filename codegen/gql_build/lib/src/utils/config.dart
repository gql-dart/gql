import "package:code_builder/code_builder.dart";
import "package:gql_code_builder/data.dart";
import "package:gql_code_builder/schema.dart";
import "package:yaml/yaml.dart";

Map<String, Reference> typeOverrideMap(dynamic typeOverrideConfig) {
  if (typeOverrideConfig is YamlMap) {
    return Map.fromEntries(
      typeOverrideConfig.entries.map(
        (entry) => MapEntry(
          entry.key as String,
          Reference(
            entry.value["name"] as String,
            entry.value["import"] as String?,
          ),
        ),
      ),
    );
  }
  return {};
}

Set<Reference> customSerializers(dynamic customSerializersConfig) {
  if (customSerializersConfig is YamlList) {
    return customSerializersConfig
        .map(
          (dynamic configMap) => Reference(
            configMap["name"] as String,
            configMap["import"] as String,
          ),
        )
        .toSet();
  }
  return {};
}

EnumFallbackConfig enumFallbackConfig(Map<String, dynamic> config) =>
    EnumFallbackConfig(
      globalEnumFallbackName: (config["global_enum_fallback_name"] ??
          "gUnknownEnumValue") as String,
      generateFallbackValuesGlobally: config["global_enum_fallbacks"] == true,
      fallbackValueMap: enumFallbackMap(config["enum_fallbacks"]),
    );

DataClassConfig dataClassConfig(Map<String, dynamic> config) => DataClassConfig(
      reuseFragments: config["reuse_fragments"] == true,
    );

InlineFragmentSpreadWhenExtensionConfig whenExtensionConfig(
    Map<String, dynamic> config) {
  final whenYamlConfig = config["when_extensions"] as YamlMap?;

  return InlineFragmentSpreadWhenExtensionConfig(
    generateMaybeWhenExtensionMethod: whenYamlConfig?["maybeWhen"] == true,
    generateWhenExtensionMethod: whenYamlConfig?["when"] == true,
  );
}

bool generatePossibleTypesConfig(Map<String, dynamic> config) =>
    config["generate_possible_types_map"] as bool? ?? true;

Map<String, String> enumFallbackMap(final dynamic enumFallbacks) {
  if (enumFallbacks is YamlMap) {
    return Map.fromEntries(
      enumFallbacks.entries.map(
        (entry) => MapEntry(
          entry.key as String,
          entry.value as String,
        ),
      ),
    );
  }
  return {};
}

TriStateValueConfig triStateOptionalsConfig(Map<String, dynamic> config) {
  final Object? configValue = config["tristate_optionals"];

  if (configValue is bool) {
    return configValue
        ? TriStateValueConfig.onAllNullableFields
        : TriStateValueConfig.never;
  }

  return TriStateValueConfig.never;
}

bool varsCreateFactoriesConfig(Map<String, dynamic> config) =>
    config["vars_create_factories"] as bool? ?? false;
