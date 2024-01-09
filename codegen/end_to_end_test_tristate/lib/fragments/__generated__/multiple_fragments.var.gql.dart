// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i2;
import 'package:gql_tristate_value/gql_tristate_value.dart' as _i1;

part 'multiple_fragments.var.gql.g.dart';

abstract class GHeroWith2FragmentsVars
    implements Built<GHeroWith2FragmentsVars, GHeroWith2FragmentsVarsBuilder> {
  GHeroWith2FragmentsVars._();

  factory GHeroWith2FragmentsVars(
          [void Function(GHeroWith2FragmentsVarsBuilder b) updates]) =
      _$GHeroWith2FragmentsVars;

  factory GHeroWith2FragmentsVars.create({required _i1.Value<int> first}) =>
      GHeroWith2FragmentsVars((b) => b..first = first);

  static void _initializeBuilder(GHeroWith2FragmentsVarsBuilder b) =>
      b..first = const _i1.AbsentValue();

  _i1.Value<int> get first;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GHeroWith2FragmentsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWith2FragmentsVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GHeroWith2FragmentsVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHeroWith2FragmentsVars> get serializer =>
      GHeroWith2FragmentsVarsSerializer();
}

abstract class GheroNameVars
    implements Built<GheroNameVars, GheroNameVarsBuilder> {
  GheroNameVars._();

  factory GheroNameVars([void Function(GheroNameVarsBuilder b) updates]) =
      _$GheroNameVars;

  factory GheroNameVars.create() => GheroNameVars();

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GheroNameVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroNameVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GheroNameVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GheroNameVars> get serializer => GheroNameVarsSerializer();
}

abstract class GheroIdVars implements Built<GheroIdVars, GheroIdVarsBuilder> {
  GheroIdVars._();

  factory GheroIdVars([void Function(GheroIdVarsBuilder b) updates]) =
      _$GheroIdVars;

  factory GheroIdVars.create() => GheroIdVars();

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GheroIdVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroIdVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GheroIdVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GheroIdVars> get serializer => GheroIdVarsSerializer();
}

final class GHeroWith2FragmentsVarsSerializer
    extends StructuredSerializer<GHeroWith2FragmentsVars> {
  final String wireName = 'GHeroWith2FragmentsVars';

  final Iterable<Type> types = const [
    GHeroWith2FragmentsVars,
    _$GHeroWith2FragmentsVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHeroWith2FragmentsVars object, {
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

  GHeroWith2FragmentsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GHeroWith2FragmentsVarsBuilder();
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

final class GheroNameVarsSerializer
    extends StructuredSerializer<GheroNameVars> {
  final String wireName = 'GheroNameVars';

  final Iterable<Type> types = const [GheroNameVars, _$GheroNameVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GheroNameVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return const [];
  }

  GheroNameVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return GheroNameVars();
  }
}

final class GheroIdVarsSerializer extends StructuredSerializer<GheroIdVars> {
  final String wireName = 'GheroIdVars';

  final Iterable<Type> types = const [GheroIdVars, _$GheroIdVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GheroIdVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return const [];
  }

  GheroIdVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return GheroIdVars();
  }
}
