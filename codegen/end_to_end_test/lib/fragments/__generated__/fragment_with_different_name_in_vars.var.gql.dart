// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'fragment_with_different_name_in_vars.var.gql.g.dart';

abstract class GDifferentNameVars
    implements Built<GDifferentNameVars, GDifferentNameVarsBuilder> {
  GDifferentNameVars._();

  factory GDifferentNameVars(
          [void Function(GDifferentNameVarsBuilder b) updates]) =
      _$GDifferentNameVars;

  factory GDifferentNameVars.create({int? start}) =>
      GDifferentNameVars((b) => b..start = start);

  int? get start;
  static Serializer<GDifferentNameVars> get serializer =>
      _$gDifferentNameVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDifferentNameVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDifferentNameVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDifferentNameVars.serializer,
        json,
      );
}
