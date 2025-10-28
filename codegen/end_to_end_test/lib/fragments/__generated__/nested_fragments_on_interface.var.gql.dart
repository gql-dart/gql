// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'nested_fragments_on_interface.var.gql.g.dart';

abstract class GGetBooksVars
    implements Built<GGetBooksVars, GGetBooksVarsBuilder> {
  GGetBooksVars._();

  factory GGetBooksVars([void Function(GGetBooksVarsBuilder b) updates]) =
      _$GGetBooksVars;

  factory GGetBooksVars.create() => GGetBooksVars();

  static Serializer<GGetBooksVars> get serializer => _$gGetBooksVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksVars.serializer,
        json,
      );
}

abstract class GAuthorFragmentVars
    implements Built<GAuthorFragmentVars, GAuthorFragmentVarsBuilder> {
  GAuthorFragmentVars._();

  factory GAuthorFragmentVars(
          [void Function(GAuthorFragmentVarsBuilder b) updates]) =
      _$GAuthorFragmentVars;

  factory GAuthorFragmentVars.create() => GAuthorFragmentVars();

  static Serializer<GAuthorFragmentVars> get serializer =>
      _$gAuthorFragmentVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorFragmentVars.serializer,
        json,
      );
}

abstract class GBookFragmentVars
    implements Built<GBookFragmentVars, GBookFragmentVarsBuilder> {
  GBookFragmentVars._();

  factory GBookFragmentVars(
          [void Function(GBookFragmentVarsBuilder b) updates]) =
      _$GBookFragmentVars;

  factory GBookFragmentVars.create() => GBookFragmentVars();

  static Serializer<GBookFragmentVars> get serializer =>
      _$gBookFragmentVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentVars.serializer,
        json,
      );
}
