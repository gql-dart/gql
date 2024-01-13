// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'field11.var.gql.g.dart';

abstract class GField11Vars
    implements Built<GField11Vars, GField11VarsBuilder> {
  GField11Vars._();

  factory GField11Vars([void Function(GField11VarsBuilder b) updates]) =
      _$GField11Vars;

  static Serializer<GField11Vars> get serializer => _$gField11VarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GField11Vars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GField11Vars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GField11Vars.serializer,
        json,
      );
}
