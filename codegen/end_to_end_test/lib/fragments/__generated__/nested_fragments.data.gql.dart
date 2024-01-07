// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'nested_fragments.data.gql.g.dart';

abstract class GTestQueryData
    implements Built<GTestQueryData, GTestQueryDataBuilder> {
  GTestQueryData._();

  factory GTestQueryData([void Function(GTestQueryDataBuilder b) updates]) =
      _$GTestQueryData;

  static void _initializeBuilder(GTestQueryDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GUserFragmentData get currentUser;
  GUserFragmentData get currentUser2;
  static Serializer<GTestQueryData> get serializer =>
      _$gTestQueryDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GTestQueryData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GTestQueryData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GTestQueryData.serializer,
        json,
      );
}

abstract class GUserFragment {
  String get G__typename;
  String get id;
  GUserFragment_location? get location;
  GUserFragment_moderation? get moderation;
  Map<String, dynamic> toJson();
}

abstract class GUserFragment_location {
  String get G__typename;
  double get lat;
  double get lng;
  Map<String, dynamic> toJson();
}

abstract class GUserFragment_moderation {
  String get G__typename;
  _i2.GModerationStatus get moderationStatus;
  Map<String, dynamic> toJson();
}

abstract class GUserFragmentData
    implements
        Built<GUserFragmentData, GUserFragmentDataBuilder>,
        GUserFragment {
  GUserFragmentData._();

  factory GUserFragmentData(
          [void Function(GUserFragmentDataBuilder b) updates]) =
      _$GUserFragmentData;

  static void _initializeBuilder(GUserFragmentDataBuilder b) =>
      b..G__typename = 'User';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GUserFragmentData_location? get location;
  @override
  GUserFragmentData_moderation? get moderation;
  static Serializer<GUserFragmentData> get serializer =>
      _$gUserFragmentDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFragmentData.serializer,
        json,
      );
}

abstract class GUserFragmentData_location
    implements
        Built<GUserFragmentData_location, GUserFragmentData_locationBuilder>,
        GUserFragment_location {
  GUserFragmentData_location._();

  factory GUserFragmentData_location(
          [void Function(GUserFragmentData_locationBuilder b) updates]) =
      _$GUserFragmentData_location;

  static void _initializeBuilder(GUserFragmentData_locationBuilder b) =>
      b..G__typename = 'Location';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  double get lat;
  @override
  double get lng;
  static Serializer<GUserFragmentData_location> get serializer =>
      _$gUserFragmentDataLocationSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFragmentData_location.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFragmentData_location? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFragmentData_location.serializer,
        json,
      );
}

abstract class GUserFragmentData_moderation
    implements
        Built<GUserFragmentData_moderation,
            GUserFragmentData_moderationBuilder>,
        GUserFragment_moderation {
  GUserFragmentData_moderation._();

  factory GUserFragmentData_moderation(
          [void Function(GUserFragmentData_moderationBuilder b) updates]) =
      _$GUserFragmentData_moderation;

  static void _initializeBuilder(GUserFragmentData_moderationBuilder b) =>
      b..G__typename = 'Moderation';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  _i2.GModerationStatus get moderationStatus;
  static Serializer<GUserFragmentData_moderation> get serializer =>
      _$gUserFragmentDataModerationSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GUserFragmentData_moderation.serializer,
        this,
      ) as Map<String, dynamic>);

  static GUserFragmentData_moderation? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GUserFragmentData_moderation.serializer,
        json,
      );
}
