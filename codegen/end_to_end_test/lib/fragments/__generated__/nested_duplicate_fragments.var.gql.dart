// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'nested_duplicate_fragments.var.gql.g.dart';

abstract class GSearchResultsQueryVars
    implements Built<GSearchResultsQueryVars, GSearchResultsQueryVarsBuilder> {
  GSearchResultsQueryVars._();

  factory GSearchResultsQueryVars([
    void Function(GSearchResultsQueryVarsBuilder b) updates,
  ]) = _$GSearchResultsQueryVars;

  factory GSearchResultsQueryVars.create() => GSearchResultsQueryVars();

  static Serializer<GSearchResultsQueryVars> get serializer =>
      _$gSearchResultsQueryVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GSearchResultsQueryVars.serializer, this)
          as Map<String, dynamic>);

  static GSearchResultsQueryVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GSearchResultsQueryVars.serializer, json);
}

abstract class GCharacterDetailsVars
    implements Built<GCharacterDetailsVars, GCharacterDetailsVarsBuilder> {
  GCharacterDetailsVars._();

  factory GCharacterDetailsVars([
    void Function(GCharacterDetailsVarsBuilder b) updates,
  ]) = _$GCharacterDetailsVars;

  factory GCharacterDetailsVars.create() => GCharacterDetailsVars();

  static Serializer<GCharacterDetailsVars> get serializer =>
      _$gCharacterDetailsVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCharacterDetailsVars.serializer, this)
          as Map<String, dynamic>);

  static GCharacterDetailsVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCharacterDetailsVars.serializer, json);
}

abstract class GFriendInfoVars
    implements Built<GFriendInfoVars, GFriendInfoVarsBuilder> {
  GFriendInfoVars._();

  factory GFriendInfoVars([void Function(GFriendInfoVarsBuilder b) updates]) =
      _$GFriendInfoVars;

  factory GFriendInfoVars.create() => GFriendInfoVars();

  static Serializer<GFriendInfoVars> get serializer =>
      _$gFriendInfoVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GFriendInfoVars.serializer, this)
          as Map<String, dynamic>);

  static GFriendInfoVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFriendInfoVars.serializer, json);
}

abstract class GCharacterBasicVars
    implements Built<GCharacterBasicVars, GCharacterBasicVarsBuilder> {
  GCharacterBasicVars._();

  factory GCharacterBasicVars([
    void Function(GCharacterBasicVarsBuilder b) updates,
  ]) = _$GCharacterBasicVars;

  factory GCharacterBasicVars.create() => GCharacterBasicVars();

  static Serializer<GCharacterBasicVars> get serializer =>
      _$gCharacterBasicVarsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCharacterBasicVars.serializer, this)
          as Map<String, dynamic>);

  static GCharacterBasicVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCharacterBasicVars.serializer, json);
}
