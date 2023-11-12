// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'alias_var_fragment.var.gql.g.dart';

abstract class GPostsVars implements Built<GPostsVars, GPostsVarsBuilder> {
  GPostsVars._();

  factory GPostsVars([Function(GPostsVarsBuilder b) updates]) = _$GPostsVars;

  String get userId;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostsVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GPostsVars> get serializer => GPostsVarsSerializer();
}

abstract class GPostFragmentVars
    implements Built<GPostFragmentVars, GPostFragmentVarsBuilder> {
  GPostFragmentVars._();

  factory GPostFragmentVars([Function(GPostFragmentVarsBuilder b) updates]) =
      _$GPostFragmentVars;

  String get userId;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostFragmentVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GPostFragmentVars> get serializer =>
      GPostFragmentVarsSerializer();
}

class GPostsVarsSerializer extends StructuredSerializer<GPostsVars> {
  final String wireName = 'GPostsVars';

  final Iterable<Type> types = const [GPostsVars, _$GPostsVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GPostsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('userId');
    result.add(serializers.serialize(object.userId,
        specifiedType: const FullType(String)));
    return result;
  }

  GPostsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GPostsVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          builder.userId = fieldValue;
          break;
      }
    }
    return builder.build();
  }
}

class GPostFragmentVarsSerializer
    extends StructuredSerializer<GPostFragmentVars> {
  final String wireName = 'GPostFragmentVars';

  final Iterable<Type> types = const [GPostFragmentVars, _$GPostFragmentVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GPostFragmentVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('userId');
    result.add(serializers.serialize(object.userId,
        specifiedType: const FullType(String)));
    return result;
  }

  GPostFragmentVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GPostFragmentVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'userId':
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          builder.userId = fieldValue;
          break;
      }
    }
    return builder.build();
  }
}
