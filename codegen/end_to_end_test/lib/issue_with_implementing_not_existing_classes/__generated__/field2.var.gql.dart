// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'field2.var.gql.g.dart';

abstract class GField2Vars implements Built<GField2Vars, GField2VarsBuilder> {
  GField2Vars._();

  factory GField2Vars([void Function(GField2VarsBuilder b) updates]) =
      _$GField2Vars;

  static Serializer<GField2Vars> get serializer => _$gField2VarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GField2Vars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GField2Vars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GField2Vars.serializer,
        json,
      );
}
