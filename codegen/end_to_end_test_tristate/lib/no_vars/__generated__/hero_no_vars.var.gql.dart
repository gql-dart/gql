// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_no_vars.var.gql.g.dart';

abstract class GHeroNoVarsVars
    implements Built<GHeroNoVarsVars, GHeroNoVarsVarsBuilder> {
  GHeroNoVarsVars._();

  factory GHeroNoVarsVars([void Function(GHeroNoVarsVarsBuilder b) updates]) =
      _$GHeroNoVarsVars;

  factory GHeroNoVarsVars.create() => GHeroNoVarsVars();

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroNoVarsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroNoVarsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroNoVarsVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHeroNoVarsVars> get serializer =>
      GHeroNoVarsVarsSerializer();
}

final class GHeroNoVarsVarsSerializer
    extends StructuredSerializer<GHeroNoVarsVars> {
  final String wireName = 'GHeroNoVarsVars';

  final Iterable<Type> types = const [GHeroNoVarsVars, _$GHeroNoVarsVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHeroNoVarsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return const [];
  }

  GHeroNoVarsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return GHeroNoVarsVars();
  }
}
