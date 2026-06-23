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

abstract class GAuthorPersonFragmentVars
    implements
        Built<GAuthorPersonFragmentVars, GAuthorPersonFragmentVarsBuilder> {
  GAuthorPersonFragmentVars._();

  factory GAuthorPersonFragmentVars(
          [void Function(GAuthorPersonFragmentVarsBuilder b) updates]) =
      _$GAuthorPersonFragmentVars;

  factory GAuthorPersonFragmentVars.create() => GAuthorPersonFragmentVars();

  static Serializer<GAuthorPersonFragmentVars> get serializer =>
      _$gAuthorPersonFragmentVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorPersonFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorPersonFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorPersonFragmentVars.serializer,
        json,
      );
}

abstract class GAuthorCompanyFragmentVars
    implements
        Built<GAuthorCompanyFragmentVars, GAuthorCompanyFragmentVarsBuilder> {
  GAuthorCompanyFragmentVars._();

  factory GAuthorCompanyFragmentVars(
          [void Function(GAuthorCompanyFragmentVarsBuilder b) updates]) =
      _$GAuthorCompanyFragmentVars;

  factory GAuthorCompanyFragmentVars.create() => GAuthorCompanyFragmentVars();

  static Serializer<GAuthorCompanyFragmentVars> get serializer =>
      _$gAuthorCompanyFragmentVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorCompanyFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorCompanyFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorCompanyFragmentVars.serializer,
        json,
      );
}

abstract class GAuthorGroupFragmentVars
    implements
        Built<GAuthorGroupFragmentVars, GAuthorGroupFragmentVarsBuilder> {
  GAuthorGroupFragmentVars._();

  factory GAuthorGroupFragmentVars(
          [void Function(GAuthorGroupFragmentVarsBuilder b) updates]) =
      _$GAuthorGroupFragmentVars;

  factory GAuthorGroupFragmentVars.create() => GAuthorGroupFragmentVars();

  static Serializer<GAuthorGroupFragmentVars> get serializer =>
      _$gAuthorGroupFragmentVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorGroupFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorGroupFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorGroupFragmentVars.serializer,
        json,
      );
}
