// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/custom_date.dart' as _i2;
import 'package:end_to_end_test_tristate/custom_field.dart' as _i3;
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
    as _i4;
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i5;
import 'package:gql_tristate_value/gql_tristate_value.dart' as _i1;

part 'schema.schema.gql.g.dart';

class GEpisode extends EnumClass {
  const GEpisode._(String name) : super(name);

  static const GEpisode NEWHOPE = _$gEpisodeNEWHOPE;

  static const GEpisode EMPIRE = _$gEpisodeEMPIRE;

  static const GEpisode JEDI = _$gEpisodeJEDI;

  static Serializer<GEpisode> get serializer => _$gEpisodeSerializer;

  static BuiltSet<GEpisode> get values => _$gEpisodeValues;

  static GEpisode valueOf(String name) => _$gEpisodeValueOf(name);
}

class GLengthUnit extends EnumClass {
  const GLengthUnit._(String name) : super(name);

  @BuiltValueEnumConst(
    wireName: 'METER',
    fallback: true,
  )
  static const GLengthUnit METER = _$gLengthUnitMETER;

  static const GLengthUnit FOOT = _$gLengthUnitFOOT;

  static Serializer<GLengthUnit> get serializer => _$gLengthUnitSerializer;

  static BuiltSet<GLengthUnit> get values => _$gLengthUnitValues;

  static GLengthUnit valueOf(String name) => _$gLengthUnitValueOf(name);
}

abstract class GReviewInput
    implements Built<GReviewInput, GReviewInputBuilder> {
  GReviewInput._();

  factory GReviewInput([void Function(GReviewInputBuilder b) updates]) =
      _$GReviewInput;

  static void _initializeBuilder(GReviewInputBuilder b) => b
    ..commentary = const _i1.AbsentValue()
    ..favorite_color = const _i1.AbsentValue()
    ..seenOn = const _i1.AbsentValue();

  int get stars;
  _i1.Value<String> get commentary;
  _i1.Value<GColorInput> get favorite_color;
  _i1.Value<BuiltList<DateTime?>> get seenOn;
  _i2.CustomDate get createdDay;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GReviewInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GReviewInput? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GReviewInput.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GReviewInput> get serializer => GReviewInputSerializer();
}

final class GReviewInputSerializer extends StructuredSerializer<GReviewInput> {
  final String wireName = 'GReviewInput';

  final Iterable<Type> types = const [GReviewInput, _$GReviewInput];

  Iterable<Object?> serialize(
    Serializers serializers,
    GReviewInput object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('stars');
    result.add(serializers.serialize(object.stars,
        specifiedType: const FullType(int)));
    final _$commentaryvalue = object.commentary;
    if (_$commentaryvalue case _i1.PresentValue(value: final _$value)) {
      result.add('commentary');
      result.add(serializers.serialize(_$value,
          specifiedType: const FullType(String)));
    }
    final _$favorite_colorvalue = object.favorite_color;
    if (_$favorite_colorvalue case _i1.PresentValue(value: final _$value)) {
      result.add('favorite_color');
      result.add(serializers.serialize(_$value,
          specifiedType: const FullType(GColorInput)));
    }
    final _$seenOnvalue = object.seenOn;
    if (_$seenOnvalue case _i1.PresentValue(value: final _$value)) {
      result.add('seenOn');
      result.add(serializers.serialize(_$value,
          specifiedType: const FullType(BuiltList, [FullType(DateTime)])));
    }
    result.add('createdDay');
    result.add(serializers.serialize(object.createdDay,
        specifiedType: const FullType(_i2.CustomDate)));
    return result;
  }

  GReviewInput deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GReviewInputBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'stars':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.stars = _$fieldValue;
          break;
        case 'commentary':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          builder.commentary = _i1.PresentValue(_$fieldValue);
          break;
        case 'favorite_color':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(GColorInput)) as GColorInput;
          builder.favorite_color = _i1.PresentValue(_$fieldValue);
          break;
        case 'seenOn':
          var _$fieldValue = serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, [FullType(DateTime)]))
              as BuiltList<DateTime>;
          builder.seenOn = _i1.PresentValue(_$fieldValue);
          break;
        case 'createdDay':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(_i2.CustomDate)) as _i2.CustomDate;
          builder.createdDay = _$fieldValue;
          break;
      }
    }
    return builder.build();
  }
}

abstract class GCustomFieldInput
    implements Built<GCustomFieldInput, GCustomFieldInputBuilder> {
  GCustomFieldInput._();

  factory GCustomFieldInput(
          [void Function(GCustomFieldInputBuilder b) updates]) =
      _$GCustomFieldInput;

  static void _initializeBuilder(GCustomFieldInputBuilder b) =>
      b..customField = const _i1.AbsentValue();

  String get id;
  _i1.Value<_i3.CustomField> get customField;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GCustomFieldInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GCustomFieldInput? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GCustomFieldInput.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GCustomFieldInput> get serializer =>
      GCustomFieldInputSerializer();
}

final class GCustomFieldInputSerializer
    extends StructuredSerializer<GCustomFieldInput> {
  final String wireName = 'GCustomFieldInput';

  final Iterable<Type> types = const [GCustomFieldInput, _$GCustomFieldInput];

  Iterable<Object?> serialize(
    Serializers serializers,
    GCustomFieldInput object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('id');
    result.add(serializers.serialize(object.id,
        specifiedType: const FullType(String)));
    final _$customFieldvalue = object.customField;
    if (_$customFieldvalue case _i1.PresentValue(value: final _$value)) {
      result.add('customField');
      result.add(serializers.serialize(_$value,
          specifiedType: const FullType(_i3.CustomField)));
    }
    return result;
  }

  GCustomFieldInput deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GCustomFieldInputBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          builder.id = _$fieldValue;
          break;
        case 'customField':
          var _$fieldValue = serializers.deserialize(value,
                  specifiedType: const FullType(_i3.CustomField))
              as _i3.CustomField;
          builder.customField = _i1.PresentValue(_$fieldValue);
          break;
      }
    }
    return builder.build();
  }
}

abstract class GColorInput implements Built<GColorInput, GColorInputBuilder> {
  GColorInput._();

  factory GColorInput([void Function(GColorInputBuilder b) updates]) =
      _$GColorInput;

  int get red;
  int get green;
  int get blue;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GColorInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GColorInput? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GColorInput.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GColorInput> get serializer => GColorInputSerializer();
}

final class GColorInputSerializer extends StructuredSerializer<GColorInput> {
  final String wireName = 'GColorInput';

  final Iterable<Type> types = const [GColorInput, _$GColorInput];

  Iterable<Object?> serialize(
    Serializers serializers,
    GColorInput object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('red');
    result.add(
        serializers.serialize(object.red, specifiedType: const FullType(int)));
    result.add('green');
    result.add(serializers.serialize(object.green,
        specifiedType: const FullType(int)));
    result.add('blue');
    result.add(
        serializers.serialize(object.blue, specifiedType: const FullType(int)));
    return result;
  }

  GColorInput deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GColorInputBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'red':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.red = _$fieldValue;
          break;
        case 'green':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.green = _$fieldValue;
          break;
        case 'blue':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          builder.blue = _$fieldValue;
          break;
      }
    }
    return builder.build();
  }
}

abstract class GPostLikesInput
    implements Built<GPostLikesInput, GPostLikesInputBuilder> {
  GPostLikesInput._();

  factory GPostLikesInput([void Function(GPostLikesInputBuilder b) updates]) =
      _$GPostLikesInput;

  String get id;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GPostLikesInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostLikesInput? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GPostLikesInput.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GPostLikesInput> get serializer =>
      GPostLikesInputSerializer();
}

final class GPostLikesInputSerializer
    extends StructuredSerializer<GPostLikesInput> {
  final String wireName = 'GPostLikesInput';

  final Iterable<Type> types = const [GPostLikesInput, _$GPostLikesInput];

  Iterable<Object?> serialize(
    Serializers serializers,
    GPostLikesInput object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('id');
    result.add(serializers.serialize(object.id,
        specifiedType: const FullType(String)));
    return result;
  }

  GPostLikesInput deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GPostLikesInputBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          builder.id = _$fieldValue;
          break;
      }
    }
    return builder.build();
  }
}

abstract class GPostFavoritesInput
    implements Built<GPostFavoritesInput, GPostFavoritesInputBuilder> {
  GPostFavoritesInput._();

  factory GPostFavoritesInput(
          [void Function(GPostFavoritesInputBuilder b) updates]) =
      _$GPostFavoritesInput;

  String get id;
  Map<String, dynamic> toJson() => (_i4.serializers.serializeWith(
        GPostFavoritesInput.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostFavoritesInput? fromJson(Map<String, dynamic> json) =>
      _i4.serializers.deserializeWith(
        GPostFavoritesInput.serializer,
        json,
      );

  @BuiltValueSerializer(custom: true, serializeNulls: true)
  static Serializer<GPostFavoritesInput> get serializer =>
      GPostFavoritesInputSerializer();
}

final class GPostFavoritesInputSerializer
    extends StructuredSerializer<GPostFavoritesInput> {
  final String wireName = 'GPostFavoritesInput';

  final Iterable<Type> types = const [
    GPostFavoritesInput,
    _$GPostFavoritesInput
  ];

  Iterable<Object?> serialize(
    Serializers serializers,
    GPostFavoritesInput object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    result.add('id');
    result.add(serializers.serialize(object.id,
        specifiedType: const FullType(String)));
    return result;
  }

  GPostFavoritesInput deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final builder = GPostFavoritesInputBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          var _$fieldValue = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          builder.id = _$fieldValue;
          break;
      }
    }
    return builder.build();
  }
}

abstract class GISODate implements Built<GISODate, GISODateBuilder> {
  GISODate._();

  factory GISODate([String? value]) =>
      _$GISODate((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GISODate> get serializer =>
      _i5.DefaultScalarSerializer<GISODate>(
          (Object serialized) => GISODate((serialized as String?)));
}

abstract class GJson implements Built<GJson, GJsonBuilder> {
  GJson._();

  factory GJson([String? value]) =>
      _$GJson((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GJson> get serializer => _i5.DefaultScalarSerializer<GJson>(
      (Object serialized) => GJson((serialized as String?)));
}

const Map<String, Set<String>> possibleTypesMap = {
  'Character': {
    'Human',
    'Droid',
  },
  'SearchResult': {
    'Human',
    'Droid',
    'Starship',
  },
};
