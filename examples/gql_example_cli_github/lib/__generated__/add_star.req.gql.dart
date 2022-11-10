// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli_github/__generated__/add_star.ast.gql.dart'
    as _i2;
import 'package:gql_example_cli_github/__generated__/add_star.var.gql.dart'
    as _i3;
import 'package:gql_example_cli_github/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'add_star.req.gql.g.dart';

abstract class GAddStar implements Built<GAddStar, GAddStarBuilder> {
  GAddStar._();

  factory GAddStar([Function(GAddStarBuilder b) updates]) = _$GAddStar;

  static void _initializeBuilder(GAddStarBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'AddStar',
    );
  _i3.GAddStarVars get vars;
  _i1.Operation get operation;
  static Serializer<GAddStar> get serializer => _$gAddStarSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GAddStar.serializer,
        this,
      ) as Map<String, dynamic>);
  static GAddStar? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GAddStar.serializer,
        json,
      );
}
