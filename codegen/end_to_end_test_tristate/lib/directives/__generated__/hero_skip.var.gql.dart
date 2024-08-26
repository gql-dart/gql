// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'hero_skip.var.gql.g.dart';

abstract class GHeroSkipVars
    implements Built<GHeroSkipVars, GHeroSkipVarsBuilder> {
  GHeroSkipVars._();

  factory GHeroSkipVars([void Function(GHeroSkipVarsBuilder b) updates]) =
      _$GHeroSkipVars;

  bool get skipName;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GHeroSkipVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GHeroSkipVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GHeroSkipVars.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GHeroSkipVars> get serializer => GHeroSkipVarsSerializer();
}

final class GHeroSkipVarsSerializer
    extends StructuredSerializer<GHeroSkipVars> {
  final String wireName = 'GHeroSkipVars';

  final Iterable<Type> types = const [GHeroSkipVars, _$GHeroSkipVars];

  Iterable<Object?> serialize(
    Serializers serializers,
    GHeroSkipVars object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('skipName');
    result.add(serializers.serialize(object.skipName,
        specifiedType: const FullType(bool)));
    return result;
  }

  GHeroSkipVars deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GHeroSkipVarsBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'skipName':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          builder.skipName = _$fieldValue;
          break;
      }
    }
    return builder.build();
  }
}
