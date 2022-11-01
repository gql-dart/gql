// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_flutter/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_example_flutter/src/pokemon_detail/graphql/__generated__/pokemon_detail.ast.gql.dart'
    as _i2;
import 'package:gql_example_flutter/src/pokemon_detail/graphql/__generated__/pokemon_detail.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'pokemon_detail.req.gql.g.dart';

abstract class GPokemonDetail
    implements Built<GPokemonDetail, GPokemonDetailBuilder> {
  GPokemonDetail._();

  factory GPokemonDetail([Function(GPokemonDetailBuilder b) updates]) =
      _$GPokemonDetail;

  static void _initializeBuilder(GPokemonDetailBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'PokemonDetail',
    );
  _i3.GPokemonDetailVars get vars;
  _i1.Operation get operation;
  static Serializer<GPokemonDetail> get serializer =>
      _$gPokemonDetailSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GPokemonDetail.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPokemonDetail? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GPokemonDetail.serializer,
        json,
      );
}
