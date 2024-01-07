// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'fragment_activities.var.gql.g.dart';

abstract class GActivityAVars
    implements Built<GActivityAVars, GActivityAVarsBuilder> {
  GActivityAVars._();

  factory GActivityAVars([void Function(GActivityAVarsBuilder b) updates]) =
      _$GActivityAVars;

  static Serializer<GActivityAVars> get serializer =>
      _$gActivityAVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GActivityAVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GActivityAVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GActivityAVars.serializer,
        json,
      );
}

abstract class GActivityBVars
    implements Built<GActivityBVars, GActivityBVarsBuilder> {
  GActivityBVars._();

  factory GActivityBVars([void Function(GActivityBVarsBuilder b) updates]) =
      _$GActivityBVars;

  static Serializer<GActivityBVars> get serializer =>
      _$gActivityBVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GActivityBVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GActivityBVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GActivityBVars.serializer,
        json,
      );
}

abstract class GItemVars implements Built<GItemVars, GItemVarsBuilder> {
  GItemVars._();

  factory GItemVars([void Function(GItemVarsBuilder b) updates]) = _$GItemVars;

  static Serializer<GItemVars> get serializer => _$gItemVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GItemVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GItemVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GItemVars.serializer,
        json,
      );
}

abstract class GItemConnectionVars
    implements Built<GItemConnectionVars, GItemConnectionVarsBuilder> {
  GItemConnectionVars._();

  factory GItemConnectionVars(
          [void Function(GItemConnectionVarsBuilder b) updates]) =
      _$GItemConnectionVars;

  static Serializer<GItemConnectionVars> get serializer =>
      _$gItemConnectionVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GItemConnectionVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GItemConnectionVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GItemConnectionVars.serializer,
        json,
      );
}

abstract class GItemEdgeVars
    implements Built<GItemEdgeVars, GItemEdgeVarsBuilder> {
  GItemEdgeVars._();

  factory GItemEdgeVars([void Function(GItemEdgeVarsBuilder b) updates]) =
      _$GItemEdgeVars;

  static Serializer<GItemEdgeVars> get serializer => _$gItemEdgeVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GItemEdgeVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GItemEdgeVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GItemEdgeVars.serializer,
        json,
      );
}
