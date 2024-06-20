// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_skip_fragment.var.gql.g.dart';

abstract class GHeroSkipFragmentVars
    implements Built<GHeroSkipFragmentVars, GHeroSkipFragmentVarsBuilder> {
  GHeroSkipFragmentVars._();

  factory GHeroSkipFragmentVars(
          [void Function(GHeroSkipFragmentVarsBuilder b) updates]) =
      _$GHeroSkipFragmentVars;

  bool get skipDetails;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroSkipFragmentVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroSkipFragmentVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroSkipFragmentVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHeroSkipFragmentVars> get serializer =>
      GHeroSkipFragmentVarsSerializer();
}

abstract class GHeroDetailVars
    implements Built<GHeroDetailVars, GHeroDetailVarsBuilder> {
  GHeroDetailVars._();

  factory GHeroDetailVars([void Function(GHeroDetailVarsBuilder b) updates]) =
      _$GHeroDetailVars;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroDetailVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroDetailVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroDetailVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHeroDetailVars> get serializer =>
      GHeroDetailVarsSerializer();
}

final class GHeroSkipFragmentVarsSerializer
    extends StructuredSerializer<GHeroSkipFragmentVars> {
  final String wireName = 'GHeroSkipFragmentVars';

  final Iterable<Type> types = const [
    GHeroSkipFragmentVars,
    _$GHeroSkipFragmentVars
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHeroSkipFragmentVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('skipDetails');
    result.add(serializers.serialize(object.skipDetails,
        specifiedType: const FullType(bool)));
    return result;
  }

  GHeroSkipFragmentVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GHeroSkipFragmentVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'skipDetails':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          builder.skipDetails = _$fieldValue;
          break;
      }
    }
    return builder.build();
  }
}

final class GHeroDetailVarsSerializer
    extends StructuredSerializer<GHeroDetailVars> {
  final String wireName = 'GHeroDetailVars';

  final Iterable<Type> types = const [GHeroDetailVars, _$GHeroDetailVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHeroDetailVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return const [];
  }

  GHeroDetailVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return GHeroDetailVars();
  }
}
