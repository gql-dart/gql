// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'create_custom_field.var.gql.g.dart';

abstract class GCreateCustomFieldVars
    implements Built<GCreateCustomFieldVars, GCreateCustomFieldVarsBuilder> {
  GCreateCustomFieldVars._();

  factory GCreateCustomFieldVars(
          [void Function(GCreateCustomFieldVarsBuilder b) updates]) =
      _$GCreateCustomFieldVars;

  factory GCreateCustomFieldVars.create(
          {required _i1.GCustomFieldInput input}) =>
      GCreateCustomFieldVars((b) => b..input = input.toBuilder());

  _i1.GCustomFieldInput get input;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GCreateCustomFieldVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCreateCustomFieldVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GCreateCustomFieldVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GCreateCustomFieldVars> get serializer =>
      GCreateCustomFieldVarsSerializer();
}

final class GCreateCustomFieldVarsSerializer
    extends StructuredSerializer<GCreateCustomFieldVars> {
  final String wireName = 'GCreateCustomFieldVars';

  final Iterable<Type> types = const [
    GCreateCustomFieldVars,
    _$GCreateCustomFieldVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GCreateCustomFieldVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('input');
    result.add(serializers.serialize(object.input,
        specifiedType: const FullType(_i1.GCustomFieldInput)));
    return result;
  }

  GCreateCustomFieldVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GCreateCustomFieldVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'input':
          var _$fieldValue = serializers.deserialize(value,
                  specifiedType: const FullType(_i1.GCustomFieldInput))
              as _i1.GCustomFieldInput;
          builder.input.replace(_$fieldValue);
          break;
      }
    }
    return builder.build();
  }
}
