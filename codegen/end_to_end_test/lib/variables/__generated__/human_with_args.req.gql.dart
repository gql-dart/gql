// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:end_to_end_test/variables/__generated__/human_with_args.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/variables/__generated__/human_with_args.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'human_with_args.req.gql.g.dart';

abstract class GHumanWithArgs
    implements Built<GHumanWithArgs, GHumanWithArgsBuilder> {
  GHumanWithArgs._();

  factory GHumanWithArgs([Function(GHumanWithArgsBuilder b) updates]) =
      _$GHumanWithArgs;

  static void _initializeBuilder(GHumanWithArgsBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'HumanWithArgs',
    );
  _i3.GHumanWithArgsVars get vars;
  _i1.Operation get operation;
  static Serializer<GHumanWithArgs> get serializer =>
      _$gHumanWithArgsSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GHumanWithArgs.serializer,
        this,
      ) as Map<String, dynamic>);
  static GHumanWithArgs? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GHumanWithArgs.serializer,
        json,
      );
}
