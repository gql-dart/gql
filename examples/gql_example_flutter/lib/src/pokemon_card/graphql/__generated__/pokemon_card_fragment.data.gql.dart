// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/__generated__/serializers.gql.dart' as _i2;
import 'package:gql_example_flutter/src/pokemon_card/graphql/__generated__/nested_fragment.data.gql.dart'
    as _i1;

part 'pokemon_card_fragment.data.gql.g.dart';

abstract class GPokemonCard implements _i1.GNestedFragment {
  String get G__typename;
  String get id;
  String? get name;
  int? get maxHP;
  String? get image;
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
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String? get name;
  int? get maxHP;
  String? get image;
  static Serializer<GPokemonCardData> get serializer =>
      _$gPokemonCardDataSerializer;
  Map<String, dynamic> toJson() =>
      (_i2.serializers.serializeWith(GPokemonCardData.serializer, this)
          as Map<String, dynamic>);
  static GPokemonCardData? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GPokemonCardData.serializer, json);
}
