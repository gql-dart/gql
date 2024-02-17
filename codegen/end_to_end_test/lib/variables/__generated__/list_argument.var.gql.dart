// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'list_argument.var.gql.g.dart';

abstract class GreviewsWithListArgumentVars
    implements
        Built<GreviewsWithListArgumentVars,
            GreviewsWithListArgumentVarsBuilder> {
  GreviewsWithListArgumentVars._();

  factory GreviewsWithListArgumentVars(
          [void Function(GreviewsWithListArgumentVarsBuilder b) updates]) =
      _$GreviewsWithListArgumentVars;

  factory GreviewsWithListArgumentVars.create({
    required _i1.GEpisode episode,
    BuiltList<int>? stars,
  }) =>
      GreviewsWithListArgumentVars((b) => b
        ..episode = episode
        ..stars = stars?.toBuilder());

  _i1.GEpisode get episode;
  BuiltList<int>? get stars;
  static Serializer<GreviewsWithListArgumentVars> get serializer =>
      _$greviewsWithListArgumentVarsSerializer;

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GreviewsWithListArgumentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GreviewsWithListArgumentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GreviewsWithListArgumentVars.serializer,
        json,
      );
}
