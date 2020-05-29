import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:meta/meta.dart";
import "package:recase/recase.dart";

import "./common.dart";

/// Generates a class that implements [Built], along with its serializers
Class builtClass({
  @required String name,
  @required String serializersUrl,
  Iterable<Method> getters,
}) {
  final className = builtClassName(name);
  return Class(
    (b) => b
      ..abstract = true
      ..name = className
      ..implements.add(
        TypeReference(
          (b) => b
            ..url = "package:built_value/built_value.dart"
            ..symbol = "Built"
            ..types = ListBuilder(
              <Reference>[
                refer(className),
                refer("${className}Builder"),
              ],
            ),
        ),
      )
      ..constructors.addAll(
        [
          Constructor((b) => b..name = "_"),
          Constructor(
            (b) => b
              ..factory = true
              ..optionalParameters.add(
                Parameter(
                  (b) => b
                    ..name = "updates"
                    ..type = refer("Function(${className}Builder b)"),
                ),
              )
              ..redirect = refer("_\$${className}"),
          ),
        ],
      )
      ..methods = ListBuilder(<Method>[
        ...getters,
        // Serlialization methods
        Method(
          (b) => b
            ..static = true
            ..returns = TypeReference(
              (b) => b
                ..url = "package:built_value/serializer.dart"
                ..symbol = "Serializer"
                ..types.add(
                  refer(className),
                ),
            )
            ..type = MethodType.getter
            ..name = "serializer"
            ..lambda = true
            ..body = Code("_\$${className.camelCase}Serializer"),
        ),
        Method(
          (b) => b
            ..returns = refer("Map<String, dynamic>")
            ..name = "toJson"
            ..lambda = true
            ..body = refer("serializers", serializersUrl)
                .property("serializeWith")
                .call([
              refer(className).property("serializer"),
              refer("this"),
            ]).code,
        ),
        Method(
          (b) => b
            ..static = true
            ..returns = refer(className)
            ..name = "fromJson"
            ..requiredParameters.add(Parameter((b) => b
              ..type = refer("String")
              ..name = "json"))
            ..lambda = true
            ..body = refer("serializers", serializersUrl)
                .property("deserializeWith")
                .call([
              refer(className).property("serializer"),
              refer("json")
            ]).code,
        ),
      ]),
  );
}
