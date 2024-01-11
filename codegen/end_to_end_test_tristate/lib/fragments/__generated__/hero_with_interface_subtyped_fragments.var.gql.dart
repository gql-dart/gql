// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/schema.schema.gql.dart'
    as _i1;
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i2;

part 'hero_with_interface_subtyped_fragments.var.gql.g.dart';

abstract class GHeroWithInterfaceSubTypedFragmentsVars
    implements
        Built<GHeroWithInterfaceSubTypedFragmentsVars,
            GHeroWithInterfaceSubTypedFragmentsVarsBuilder> {
  GHeroWithInterfaceSubTypedFragmentsVars._();

  factory GHeroWithInterfaceSubTypedFragmentsVars(
      [void Function(GHeroWithInterfaceSubTypedFragmentsVarsBuilder b)
          updates]) = _$GHeroWithInterfaceSubTypedFragmentsVars;

  factory GHeroWithInterfaceSubTypedFragmentsVars.create(
          {required _i1.GEpisode episode}) =>
      GHeroWithInterfaceSubTypedFragmentsVars((b) => b..episode = episode);

  _i1.GEpisode get episode;
  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GHeroWithInterfaceSubTypedFragmentsVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroWithInterfaceSubTypedFragmentsVars? fromJson(
          Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GHeroWithInterfaceSubTypedFragmentsVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHeroWithInterfaceSubTypedFragmentsVars> get serializer =>
      GHeroWithInterfaceSubTypedFragmentsVarsSerializer();
}

abstract class GheroFieldsFragmentVars
    implements Built<GheroFieldsFragmentVars, GheroFieldsFragmentVarsBuilder> {
  GheroFieldsFragmentVars._();

  factory GheroFieldsFragmentVars(
          [void Function(GheroFieldsFragmentVarsBuilder b) updates]) =
      _$GheroFieldsFragmentVars;

  factory GheroFieldsFragmentVars.create() => GheroFieldsFragmentVars();

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GheroFieldsFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GheroFieldsFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GheroFieldsFragmentVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GheroFieldsFragmentVars> get serializer =>
      GheroFieldsFragmentVarsSerializer();
}

abstract class GhumanFieldsFragmentVars
    implements
        Built<GhumanFieldsFragmentVars, GhumanFieldsFragmentVarsBuilder> {
  GhumanFieldsFragmentVars._();

  factory GhumanFieldsFragmentVars(
          [void Function(GhumanFieldsFragmentVarsBuilder b) updates]) =
      _$GhumanFieldsFragmentVars;

  factory GhumanFieldsFragmentVars.create() => GhumanFieldsFragmentVars();

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GhumanFieldsFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GhumanFieldsFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GhumanFieldsFragmentVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GhumanFieldsFragmentVars> get serializer =>
      GhumanFieldsFragmentVarsSerializer();
}

abstract class GdroidFieldsFragmentVars
    implements
        Built<GdroidFieldsFragmentVars, GdroidFieldsFragmentVarsBuilder> {
  GdroidFieldsFragmentVars._();

  factory GdroidFieldsFragmentVars(
          [void Function(GdroidFieldsFragmentVarsBuilder b) updates]) =
      _$GdroidFieldsFragmentVars;

  factory GdroidFieldsFragmentVars.create() => GdroidFieldsFragmentVars();

  Map<String, dynamic> toJson() => (_i2.serializers.serializeWith(
        GdroidFieldsFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GdroidFieldsFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(
        GdroidFieldsFragmentVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GdroidFieldsFragmentVars> get serializer =>
      GdroidFieldsFragmentVarsSerializer();
}

final class GHeroWithInterfaceSubTypedFragmentsVarsSerializer
    extends StructuredSerializer<GHeroWithInterfaceSubTypedFragmentsVars> {
  final String wireName = 'GHeroWithInterfaceSubTypedFragmentsVars';

  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragmentsVars,
    _$GHeroWithInterfaceSubTypedFragmentsVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHeroWithInterfaceSubTypedFragmentsVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('episode');
    result.add(serializers.serialize(object.episode,
        specifiedType: const FullType(_i1.GEpisode)));
    return result;
  }

  GHeroWithInterfaceSubTypedFragmentsVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GHeroWithInterfaceSubTypedFragmentsVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'episode':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEpisode)) as _i1.GEpisode;
          builder.episode = _$fieldValue;
          break;
      }
    }
    return builder.build();
  }
}

final class GheroFieldsFragmentVarsSerializer
    extends StructuredSerializer<GheroFieldsFragmentVars> {
  final String wireName = 'GheroFieldsFragmentVars';

  final Iterable<Type> types = const [
    GheroFieldsFragmentVars,
    _$GheroFieldsFragmentVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GheroFieldsFragmentVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return const [];
  }

  GheroFieldsFragmentVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return GheroFieldsFragmentVars();
  }
}

final class GhumanFieldsFragmentVarsSerializer
    extends StructuredSerializer<GhumanFieldsFragmentVars> {
  final String wireName = 'GhumanFieldsFragmentVars';

  final Iterable<Type> types = const [
    GhumanFieldsFragmentVars,
    _$GhumanFieldsFragmentVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GhumanFieldsFragmentVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return const [];
  }

  GhumanFieldsFragmentVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return GhumanFieldsFragmentVars();
  }
}

final class GdroidFieldsFragmentVarsSerializer
    extends StructuredSerializer<GdroidFieldsFragmentVars> {
  final String wireName = 'GdroidFieldsFragmentVars';

  final Iterable<Type> types = const [
    GdroidFieldsFragmentVars,
    _$GdroidFieldsFragmentVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GdroidFieldsFragmentVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return const [];
  }

  GdroidFieldsFragmentVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return GdroidFieldsFragmentVars();
  }
}
