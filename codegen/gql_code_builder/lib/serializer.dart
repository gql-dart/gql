import "package:code_builder/code_builder.dart";
import "package:analyzer/dart/element/element.dart";

Expression withCustomSerializers(
  Expression serializersExpression,
  Set<Reference> customSerializers,
) =>
    customSerializers.fold(
      serializersExpression,
      (exp, ref) => exp.cascade("add").call([ref.call([])]),
    );

Library buildSerializerLibrary(
  Set<ClassElement> classes,
  String partDirectiveUrl,
  Set<Reference> customSerializers,
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
            customSerializers,
          ).cascade("addPlugin").call([
            refer("StandardJsonPlugin",
                    "package:built_value/standard_json_plugin.dart")
                .call([])
          ]).statement,
          refer("@SerializersFor", "package:built_value/serializer.dart").call([
            literalList(
              classes.map<Reference>(
                (c) => refer(c.name, c.source.uri.toString()),
              ),
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
