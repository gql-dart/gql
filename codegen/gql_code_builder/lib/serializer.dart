import "package:code_builder/code_builder.dart";
import "package:analyzer/dart/element/element.dart";

Library buildSerializerLibrary(
  Set<ClassElement> classes,
  String partDirectiveUrl,
) =>
    Library(
      (b) => b
        ..directives.add(Directive.part(partDirectiveUrl))
        ..body.addAll([
          refer(r"_$serializers")
              .assignFinal(
                "_serializersBuilder",
                refer("SerializersBuilder",
                    "package:built_value/serializer.dart"),
              )
              .property("toBuilder")
              .call([])
              .cascade("add")
              .call([
                refer("OperationSerializer",
                        "package:gql_code_builder/src/serializers/operation_serializer.dart")
                    .call([])
              ])
              .cascade("addPlugin")
              .call([
                refer("StandardJsonPlugin",
                        "package:built_value/standard_json_plugin.dart")
                    .call([])
              ])
              .statement,
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
