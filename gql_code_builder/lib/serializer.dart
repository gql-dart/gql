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
          refer("@SerializersFor", "package:built_value/serializer.dart").call([
            literalList(
              classes.map<Reference>(
                (c) => refer(c.name, c.source.uri.toString()),
              ),
            )
          ]),
          refer(r"_$serializers")
              .assignFinal(
                "serializers",
                refer("Serializers", "package:built_value/serializer.dart"),
              )
              .statement,
        ]),
    );
