// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/fragments/__generated__/fragment_with_scalar_var.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/fragments/__generated__/fragment_with_scalar_var.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'fragment_with_scalar_var.req.gql.g.dart';

abstract class GPostsWithFixedVariable
    implements Built<GPostsWithFixedVariable, GPostsWithFixedVariableBuilder> {
  GPostsWithFixedVariable._();

  factory GPostsWithFixedVariable(
          [Function(GPostsWithFixedVariableBuilder b) updates]) =
      _$GPostsWithFixedVariable;

  static void _initializeBuilder(GPostsWithFixedVariableBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'PostsWithFixedVariable',
    );
  _i3.GPostsWithFixedVariableVars get vars;
  _i1.Operation get operation;
  static Serializer<GPostsWithFixedVariable> get serializer =>
      _$gPostsWithFixedVariableSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GPostsWithFixedVariable.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostsWithFixedVariable? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GPostsWithFixedVariable.serializer,
        json,
      );
}
