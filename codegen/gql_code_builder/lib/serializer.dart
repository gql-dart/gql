import "package:analyzer/dart/element/element2.dart";
import "package:code_builder/code_builder.dart";

Library buildSerializerLibrary(
  Set<ClassElement2> builtClasses,
  String partDirectiveUrl,
  Set<Expression> additionalSerializers, {
  Expression? externalSerializers,
}) =>
    Library(
      (b) => b
        ..directives.add(Directive.part(partDirectiveUrl))
        ..body.addAll([
          declareFinal(
            "_serializersBuilder",
            type: refer(
                "SerializersBuilder", "package:built_value/serializer.dart"),
          )
              .assign(
                refer(r"_$serializers"),
              )
              .property("toBuilder")
              .call([])
              .withCustomSerializers(additionalSerializers)
              .applyIf(
                externalSerializers != null,
                (expr) => expr.cascade("addAll").call([externalSerializers!]),
              )
              .cascade("addPlugin")
              .call([
                refer(
                  "StandardJsonPlugin",
                  "package:built_value/standard_json_plugin.dart",
                ).call([])
              ])
              .statement,
          refer("@SerializersFor", "package:built_value/serializer.dart").call([
            literalList(
              builtClasses
                  .map<Reference>(
                    (c) => refer(c.name3!, c.library2.uri.toString()),
                  )
                  .toList()
                ..sort((a, b) => a.symbol!.compareTo(b.symbol!)),
            )
          ]),
          declareFinal("serializers",
                  type: refer(
                      "Serializers", "package:built_value/serializer.dart"))
              .assign(refer("_serializersBuilder"))
              .property("build")
              .call([]).statement,
        ]),
    );

extension on Expression {
  Expression applyIf(
    bool condition,
    Expression Function(Expression) wrap,
  ) =>
      condition ? wrap(this) : this;

  Expression withCustomSerializers(
    Set<Expression> customSerializers,
  ) =>
      customSerializers.fold(
        this,
        (exp, serializer) => exp.cascade("add").call([serializer]),
      );
}
