import "package:built_collection/built_collection.dart";
import "package:code_builder/code_builder.dart";

import "./common.dart";
import "./utils/to_camel_case.dart";

/// Generates a class that implements [Built], along with its serializers
Class builtClass({
  required String name,
  Iterable<Constructor>? constructors,
  Iterable<Method>? getters,
  Map<String, Expression>? initializers,
  Map<String, SourceSelections> superclassSelections = const {},
  List<Method> methods = const [],
  Map<String, Reference>? dataClassAliasMap,
  bool hasCustomSerializer = false,
}) {
  final className = builtClassName(name);
  return Class(
    (b) => b
      ..abstract = true
      ..name = className
      ..implements.addAll(
        [
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
          ...superclassSelections.keys
              .where((superName) =>
                  dataClassAliasMap?.containsKey(builtClassName(superName)) !=
                  true)
              .map<Reference>(
                (superName) => refer(
                  builtClassName(superName),
                  (superclassSelections[superName]?.url ?? "") + "#data",
                ),
              )
        ],
      )
      ..constructors.addAll(
        [
          Constructor((b) => b..name = "_"),
          Constructor(
            (b) => b
              ..factory = true
              ..optionalParameters.add(
                Parameter((b) => b
                  ..name = "updates"
                  ..type = FunctionType((b) => b
                    ..requiredParameters.add(
                      refer("${className}Builder b"),
                    )
                    ..returnType = refer("void"))),
              )
              ..redirect = refer("_\$${className}"),
          ),
          if (constructors != null && constructors.isNotEmpty) ...constructors
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
        if (getters != null) ...getters,
        // Serialization methods
        if (!hasCustomSerializer)
          buildSerializerGetter(className).rebuild(
            (b) => b..body = Code("_\$${toCamelCase(className)}Serializer"),
          ),
        buildToJsonGetter(
          className,
          isOverride:
              false, // toJson in built_value classes never overrides a superclass/interface method here
        ),
        buildFromJsonGetter(className),
        ...methods
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
