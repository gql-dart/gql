// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_build/__generated__/serializers.gql.dart' as _i4;
import 'package:gql_example_build/fragments/__generated__/shape.ast.gql.dart'
    as _i2;
import 'package:gql_example_build/fragments/__generated__/shape.var.gql.dart'
    as _i3;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'shape.req.gql.g.dart';

abstract class GShape implements Built<GShape, GShapeBuilder> {
  GShape._();

  factory GShape([Function(GShapeBuilder b) updates]) = _$GShape;

  static void _initializeBuilder(GShapeBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'Shape',
    );
  _i3.GShapeVars get vars;
  _i1.Operation get operation;
  static Serializer<GShape> get serializer => _$gShapeSerializer;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GShape.serializer,
        this,
      ) as Map<String, dynamic>);
  static GShape? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GShape.serializer,
        json,
      );
}
