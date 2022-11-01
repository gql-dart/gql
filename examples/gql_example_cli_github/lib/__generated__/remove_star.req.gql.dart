// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli_github/__generated__/remove_star.ast.gql.dart'
    as _i2;
import 'package:gql_example_cli_github/__generated__/remove_star.var.gql.dart'
    as _i3;
import 'package:gql_example_cli_github/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'remove_star.req.gql.g.dart';

abstract class GRemoveStar implements Built<GRemoveStar, GRemoveStarBuilder> {
  GRemoveStar._();

  factory GRemoveStar([Function(GRemoveStarBuilder b) updates]) = _$GRemoveStar;

  static void _initializeBuilder(GRemoveStarBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'RemoveStar',
    );
  _i3.GRemoveStarVars get vars;
  _i1.Operation get operation;
  static Serializer<GRemoveStar> get serializer => _$gRemoveStarSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GRemoveStar.serializer,
        this,
      ) as Map<String, dynamic>);
  static GRemoveStar? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GRemoveStar.serializer,
        json,
      );
}
