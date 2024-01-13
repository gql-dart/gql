// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i3;
import 'package:gql_tristate_value/gql_tristate_value.dart' as _i1;

part 'fragment_with_scalar_var.var.gql.g.dart';

abstract class GPostsWithFixedVariableVars
    implements
        Built<GPostsWithFixedVariableVars, GPostsWithFixedVariableVarsBuilder> {
  GPostsWithFixedVariableVars._();

  factory GPostsWithFixedVariableVars(
          [void Function(GPostsWithFixedVariableVarsBuilder b) updates]) =
      _$GPostsWithFixedVariableVars;

  factory GPostsWithFixedVariableVars.create(
          {required _i1.Value<_i2.GJson> filter}) =>
      GPostsWithFixedVariableVars((b) => b..filter = filter);

  static void _initializeBuilder(GPostsWithFixedVariableVarsBuilder b) =>
      b..filter = const _i1.AbsentValue();

  _i1.Value<_i2.GJson> get filter;
  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GPostsWithFixedVariableVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostsWithFixedVariableVars? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GPostsWithFixedVariableVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GPostsWithFixedVariableVars> get serializer =>
      GPostsWithFixedVariableVarsSerializer();
}

abstract class GPostFragmentForUser1Vars
    implements
        Built<GPostFragmentForUser1Vars, GPostFragmentForUser1VarsBuilder> {
  GPostFragmentForUser1Vars._();

  factory GPostFragmentForUser1Vars(
          [void Function(GPostFragmentForUser1VarsBuilder b) updates]) =
      _$GPostFragmentForUser1Vars;

  factory GPostFragmentForUser1Vars.create() => GPostFragmentForUser1Vars();

  Map<String, dynamic> toJson() => (_i3.serializers.serializeWith(
        GPostFragmentForUser1Vars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostFragmentForUser1Vars? fromJson(Map<String, dynamic> json) =>
      _i3.serializers.deserializeWith(
        GPostFragmentForUser1Vars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GPostFragmentForUser1Vars> get serializer =>
      GPostFragmentForUser1VarsSerializer();
}

final class GPostsWithFixedVariableVarsSerializer
    extends StructuredSerializer<GPostsWithFixedVariableVars> {
  final String wireName = 'GPostsWithFixedVariableVars';

  final Iterable<Type> types = const [
    GPostsWithFixedVariableVars,
    _$GPostsWithFixedVariableVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GPostsWithFixedVariableVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    final _$filtervalue = object.filter;
    if (_$filtervalue case _i1.PresentValue(value: final _$value)) {
      result.add('filter');
      result.add(serializers.serialize(_$value,
          specifiedType: const FullType(_i2.GJson)));
    }
    return result;
  }

  GPostsWithFixedVariableVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GPostsWithFixedVariableVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'filter':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GJson)) as _i2.GJson;
          builder.filter = _i1.PresentValue(_$fieldValue);
          break;
      }
    }
    return builder.build();
  }
}

final class GPostFragmentForUser1VarsSerializer
    extends StructuredSerializer<GPostFragmentForUser1Vars> {
  final String wireName = 'GPostFragmentForUser1Vars';

  final Iterable<Type> types = const [
    GPostFragmentForUser1Vars,
    _$GPostFragmentForUser1Vars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GPostFragmentForUser1Vars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return const [];
  }

  GPostFragmentForUser1Vars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return GPostFragmentForUser1Vars();
  }
}
