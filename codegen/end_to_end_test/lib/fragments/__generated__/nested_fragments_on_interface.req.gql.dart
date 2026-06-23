// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/fragments/__generated__/nested_fragments_on_interface.ast.gql.dart'
    as _i2;
import 'package:end_to_end_test/fragments/__generated__/nested_fragments_on_interface.var.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_exec/gql_exec.dart' as _i1;

part 'nested_fragments_on_interface.req.gql.g.dart';

abstract class GGetBooks implements Built<GGetBooks, GGetBooksBuilder> {
  GGetBooks._();

  factory GGetBooks([void Function(GGetBooksBuilder b) updates]) = _$GGetBooks;

  static void _initializeBuilder(GGetBooksBuilder b) => b
    ..operation = _i1.Operation(
      document: _i2.document,
      operationName: 'GetBooks',
    );

  _i3.GGetBooksVars get vars;
  _i1.Operation get operation;
  static Serializer<GGetBooks> get serializer => _$gGetBooksSerializer;

  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GGetBooks.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooks? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GGetBooks.serializer,
        json,
      );
}
