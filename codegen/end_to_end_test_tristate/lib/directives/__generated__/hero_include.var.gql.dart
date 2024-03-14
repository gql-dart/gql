// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_include.var.gql.g.dart';

abstract class GHeroIncludeVars
    implements Built<GHeroIncludeVars, GHeroIncludeVarsBuilder> {
  GHeroIncludeVars._();

  factory GHeroIncludeVars([void Function(GHeroIncludeVarsBuilder b) updates]) =
      _$GHeroIncludeVars;

  bool get includeId;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroIncludeVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroIncludeVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroIncludeVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHeroIncludeVars> get serializer =>
      GHeroIncludeVarsSerializer();
}

final class GHeroIncludeVarsSerializer
    extends StructuredSerializer<GHeroIncludeVars> {
  final String wireName = 'GHeroIncludeVars';

  final Iterable<Type> types = const [GHeroIncludeVars, _$GHeroIncludeVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHeroIncludeVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('includeId');
    result.add(serializers.serialize(object.includeId,
        specifiedType: const FullType(bool)));
    return result;
  }

  GHeroIncludeVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GHeroIncludeVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'includeId':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          builder.includeId = _$fieldValue;
          break;
      }
    }
    return builder.build();
  }
}
