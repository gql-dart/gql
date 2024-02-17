// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:end_to_end_test/variables/__generated__/list_argument.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/variables/__generated__/list_argument.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'list_argument.req.gql.g.dart';

abstract class GreviewsWithListArgument
    implements
        Built<GreviewsWithListArgument, GreviewsWithListArgumentBuilder> {
  GreviewsWithListArgument._();

  factory GreviewsWithListArgument(
          [void Function(GreviewsWithListArgumentBuilder b) updates]) =
      _$GreviewsWithListArgument;

  static void _initializeBuilder(GreviewsWithListArgumentBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'reviewsWithListArgument',
    );

  _i3.GreviewsWithListArgumentVars get vars;
  _i1.Operation get operation;
  static Serializer<GreviewsWithListArgument> get serializer =>
      _$greviewsWithListArgumentSerializer;

  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GreviewsWithListArgument.serializer,
        this,
      ) as Map<String, dynamic>);

  static GreviewsWithListArgument? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GreviewsWithListArgument.serializer,
        json,
      );
}
