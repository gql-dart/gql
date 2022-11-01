// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/__generated__/serializers.gql.dart'
    as _i2;
import 'package:gql_example_flutter/src/pokemon_card/graphql/__generated__/nested_fragment.data.gql.dart'
    as _i1;

part 'pokemon_card_fragment.data.gql.g.dart';

abstract class GPokemonCard implements _i1.GNestedFragment {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String? get name;
  int? get maxHP;
  String? get image;
  @override
  Map<String, dynamic> toJson();
}

abstract class GPokemonCardData
    implements
        Built<GPokemonCardData, GPokemonCardDataBuilder>,
        GPokemonCard,
        _i1.GNestedFragment {
  GPokemonCardData._();

  factory GPokemonCardData([Function(GPokemonCardDataBuilder b) updates]) =
      _$GPokemonCardData;

  static void _initializeBuilder(GPokemonCardDataBuilder b) =>
      b..G__typename = 'Pokemon';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String? get name;
  @override
  int? get maxHP;
  @override
  String? get image;
  static Serializer<GPokemonCardData> get serializer =>
      _$gPokemonCardDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GPokemonCardData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPokemonCardData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GPokemonCardData.serializer,
        json,
      );
}
