import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";
import "package:meta/meta.dart";
import "package:recase/recase.dart";

import "./common.dart";

/// Generates a class that implements [Built], along with its serializers
Class builtClass({
  @required String name,
  Iterable<Method> getters,
  Map<String, Expression> initializers,
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
        if (initializers != null && initializers.isNotEmpty)
          Method(
            (b) => b
              ..static = true
              ..returns = refer("void")
              ..name = "_initializeBuilder"
              ..requiredParameters.add(
                Parameter(
                  (b) => b
                    ..type = refer("${className}Builder")
                    ..name = "b",
                ),
              )
              ..lambda = true
              ..body = _applyInitializers(
                refer("b"),
                initializers,
              ).code,
          ),
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
            ..body = refer("serializers", "#serializer")
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
              ..type = refer("Map<String, dynamic>")
              ..name = "json"))
            ..lambda = true
            ..body = refer("serializers", "#serializer")
                .property("deserializeWith")
                .call([
              refer(className).property("serializer"),
              refer("json")
            ]).code,
        ),
      ]),
  );
}

Expression _applyInitializers(
  Expression builderExpression,
  Map<String, Expression> initializers,
) =>
    initializers.entries.fold(
      builderExpression,
      (exp, initializerEntry) =>
          exp.cascade(initializerEntry.key).assign(initializerEntry.value),
    );
