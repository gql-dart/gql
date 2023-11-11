// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i2;
import 'package:gql_exec/value.dart' as _i1;

part 'multiple_fragments.var.gql.g.dart';

abstract class GHeroWith2FragmentsVars
    implements Built<GHeroWith2FragmentsVars, GHeroWith2FragmentsVarsBuilder> {
  GHeroWith2FragmentsVars._();

  factory GHeroWith2FragmentsVars(
          [Function(GHeroWith2FragmentsVarsBuilder b) updates]) =
      _$GHeroWith2FragmentsVars;

  _i1.Value<int>? get first;
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

  factory GheroNameVars([Function(GheroNameVarsBuilder b) updates]) =
      _$GheroNameVars;

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

  factory GheroIdVars([Function(GheroIdVarsBuilder b) updates]) = _$GheroIdVars;

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

class GHeroWith2FragmentsVarsSerializer
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
          var fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.first = _i1.PresentValue(fieldValue);
          break;
      }
    }
    return builder.build();
  }
}

class GheroNameVarsSerializer extends StructuredSerializer<GheroNameVars> {
  final String wireName = 'GheroNameVars';

  final Iterable<Type> types = const [GheroNameVars, _$GheroNameVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GheroNameVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    return result;
  }

  GheroNameVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GheroNameVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {}
    }
    return builder.build();
  }
}

class GheroIdVarsSerializer extends StructuredSerializer<GheroIdVars> {
  final String wireName = 'GheroIdVars';

  final Iterable<Type> types = const [GheroIdVars, _$GheroIdVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GheroIdVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    return result;
  }

  GheroIdVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GheroIdVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {}
    }
    return builder.build();
  }
}
