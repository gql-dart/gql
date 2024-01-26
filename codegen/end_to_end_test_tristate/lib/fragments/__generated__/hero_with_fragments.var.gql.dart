// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i2;
import 'package:gql_tristate_value/gql_tristate_value.dart' as _i1;

part 'hero_with_fragments.var.gql.g.dart';

abstract class GHeroWithFragmentsVars
    implements Built<GHeroWithFragmentsVars, GHeroWithFragmentsVarsBuilder> {
  GHeroWithFragmentsVars._();

  factory GHeroWithFragmentsVars(
          [void Function(GHeroWithFragmentsVarsBuilder b) updates]) =
      _$GHeroWithFragmentsVars;

  factory GHeroWithFragmentsVars.create({required _i1.Value<int> first}) =>
      GHeroWithFragmentsVars((b) => b..first = first);

  static void _initializeBuilder(GHeroWithFragmentsVarsBuilder b) =>
      b..first = const _i1.AbsentValue();

  _i1.Value<int> get first;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GHeroWithFragmentsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithFragmentsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GHeroWithFragmentsVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHeroWithFragmentsVars> get serializer =>
      GHeroWithFragmentsVarsSerializer();
}

abstract class GheroDataVars
    implements Built<GheroDataVars, GheroDataVarsBuilder> {
  GheroDataVars._();

  factory GheroDataVars([void Function(GheroDataVarsBuilder b) updates]) =
      _$GheroDataVars;

  factory GheroDataVars.create() => GheroDataVars();

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GheroDataVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroDataVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GheroDataVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GheroDataVars> get serializer => GheroDataVarsSerializer();
}

abstract class GcomparisonFieldsVars
    implements Built<GcomparisonFieldsVars, GcomparisonFieldsVarsBuilder> {
  GcomparisonFieldsVars._();

  factory GcomparisonFieldsVars(
          [void Function(GcomparisonFieldsVarsBuilder b) updates]) =
      _$GcomparisonFieldsVars;

  factory GcomparisonFieldsVars.create({int? first}) =>
      GcomparisonFieldsVars((b) => b..first = first);

  int? get first;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GcomparisonFieldsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GcomparisonFieldsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GcomparisonFieldsVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GcomparisonFieldsVars> get serializer =>
      GcomparisonFieldsVarsSerializer();
}

final class GHeroWithFragmentsVarsSerializer
    extends StructuredSerializer<GHeroWithFragmentsVars> {
  final String wireName = 'GHeroWithFragmentsVars';

  final Iterable<Type> types = const [
    GHeroWithFragmentsVars,
    _$GHeroWithFragmentsVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHeroWithFragmentsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    final _$firstvalue = object.first;
    if (_$firstvalue case _i1.PresentValue(value: final _$value)) {
      result.add('first');
      result.add(
          serializers.serialize(_$value, specifiedType: const FullType(int)));
    }
    return result;
  }

  GHeroWithFragmentsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GHeroWithFragmentsVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.first = _i1.PresentValue(_$fieldValue);
          break;
      }
    }
    return builder.build();
  }
}

final class GheroDataVarsSerializer
    extends StructuredSerializer<GheroDataVars> {
  final String wireName = 'GheroDataVars';

  final Iterable<Type> types = const [GheroDataVars, _$GheroDataVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GheroDataVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return const [];
  }

  GheroDataVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return GheroDataVars();
  }
}

final class GcomparisonFieldsVarsSerializer
    extends StructuredSerializer<GcomparisonFieldsVars> {
  final String wireName = 'GcomparisonFieldsVars';

  final Iterable<Type> types = const [
    GcomparisonFieldsVars,
    _$GcomparisonFieldsVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GcomparisonFieldsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('first');
    result.add(serializers.serialize(object.first,
        specifiedType: const FullType(int)));
    return result;
  }

  GcomparisonFieldsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GcomparisonFieldsVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.first = _$fieldValue;
          break;
      }
    }
    return builder.build();
  }
}
