// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_subtyped_fragments.data.gql.dart'
    as _i1;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'hero_no_vars.data.gql.g.dart';

abstract class GHeroNoVarsData
    implements Built<GHeroNoVarsData, GHeroNoVarsDataBuilder> {
  GHeroNoVarsData._();

  factory GHeroNoVarsData([void Function(GHeroNoVarsDataBuilder b) updates]) =
      _$GHeroNoVarsData;

  static void _initializeBuilder(GHeroNoVarsDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  _i1.GheroFieldsFragmentData__base? get hero;
  static Serializer<GHeroNoVarsData> get serializer =>
      _$gHeroNoVarsDataSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GHeroNoVarsData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroNoVarsData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GHeroNoVarsData.serializer,
        json,
      );
}
