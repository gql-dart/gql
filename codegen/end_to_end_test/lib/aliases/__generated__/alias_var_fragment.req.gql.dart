// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/aliases/__generated__/alias_var_fragment.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/aliases/__generated__/alias_var_fragment.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'alias_var_fragment.req.gql.g.dart';

abstract class GPosts implements Built<GPosts, GPostsBuilder> {
  GPosts._();

  factory GPosts([Function(GPostsBuilder b) updates]) = _$GPosts;

  static void _initializeBuilder(GPostsBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'Posts',
    );
  _i3.GPostsVars get vars;
  _i1.Operation get operation;
  static Serializer<GPosts> get serializer => _$gPostsSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GPosts.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPosts? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GPosts.serializer,
        json,
      );
}
