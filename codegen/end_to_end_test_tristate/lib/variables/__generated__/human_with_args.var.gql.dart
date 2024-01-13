// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'human_with_args.var.gql.g.dart';

abstract class GHumanWithArgsVars
    implements Built<GHumanWithArgsVars, GHumanWithArgsVarsBuilder> {
  GHumanWithArgsVars._();

  factory GHumanWithArgsVars(
          [void Function(GHumanWithArgsVarsBuilder b) updates]) =
      _$GHumanWithArgsVars;

  factory GHumanWithArgsVars.create({required String id}) =>
      GHumanWithArgsVars((b) => b..id = id);

  String get id;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHumanWithArgsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHumanWithArgsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHumanWithArgsVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHumanWithArgsVars> get serializer =>
      GHumanWithArgsVarsSerializer();
}

final class GHumanWithArgsVarsSerializer
    extends StructuredSerializer<GHumanWithArgsVars> {
  final String wireName = 'GHumanWithArgsVars';

  final Iterable<Type> types = const [GHumanWithArgsVars, _$GHumanWithArgsVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHumanWithArgsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('id');
    result.add(serializers.serialize(object.id,
        specifiedType: const FullType(String)));
    return result;
  }

  GHumanWithArgsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GHumanWithArgsVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          builder.id = _$fieldValue;
          break;
      }
    }
    return builder.build();
  }
}
