import "package:analyzer/dart/element/element.dart";
import "package:code_builder/code_builder.dart";

Expression withCustomSerializers(
  Expression serializersExpression,
  Set<Expression> customSerializers,
) =>
    customSerializers.fold(
      serializersExpression,
      (exp, serializer) => exp.cascade("add").call([serializer]),
    );

Library buildSerializerLibrary(
  Set<ClassElement> builtClasses,
  String partDirectiveUrl,
  Set<Expression> additionalSerializers,
) =>
    Library(
      (b) => b
        ..directives.add(Directive.part(partDirectiveUrl))
        ..body.addAll([
          withCustomSerializers(
            refer(r"_$serializers")
                .assignFinal(
                  "_serializersBuilder",
                  refer("SerializersBuilder",
                      "package:built_value/serializer.dart"),
                )
                .property("toBuilder")
                .call([]),
            additionalSerializers,
          ).cascade("addPlugin").call([
            refer(
              "StandardJsonPlugin",
              "package:built_value/standard_json_plugin.dart",
            ).call([])
          ]).statement,
          refer("@SerializersFor", "package:built_value/serializer.dart").call([
            literalList(
              builtClasses
                  .map<Reference>(
                    (c) => refer(c.name, c.source.uri.toString()),
                  )
                  .toList()
                ..sort((a, b) => a.symbol!.compareTo(b.symbol!)),
            )
          ]),
          refer("_serializersBuilder")
              .assignFinal(
                "serializers",
                refer("Serializers", "package:built_value/serializer.dart"),
              )
              .property("build")
              .call([]).statement,
        ]),
    );
