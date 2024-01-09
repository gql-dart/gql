// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'connection.var.gql.g.dart';

abstract class GConnectionVars
    implements Built<GConnectionVars, GConnectionVarsBuilder> {
  GConnectionVars._();

  factory GConnectionVars([void Function(GConnectionVarsBuilder b) updates]) =
      _$GConnectionVars;

  static Serializer<GConnectionVars> get serializer =>
      _$gConnectionVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GConnectionVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GConnectionVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GConnectionVars.serializer,
        json,
      );
}
