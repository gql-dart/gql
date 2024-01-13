// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'field1.var.gql.g.dart';

abstract class GField1Vars implements Built<GField1Vars, GField1VarsBuilder> {
  GField1Vars._();

  factory GField1Vars([void Function(GField1VarsBuilder b) updates]) =
      _$GField1Vars;

  static Serializer<GField1Vars> get serializer => _$gField1VarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GField1Vars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GField1Vars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GField1Vars.serializer,
        json,
      );
}
