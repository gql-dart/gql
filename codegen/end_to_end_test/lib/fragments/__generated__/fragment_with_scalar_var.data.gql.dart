// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'fragment_with_scalar_var.data.gql.g.dart';

abstract class GPostsWithFixedVariableData
    implements
        Built<GPostsWithFixedVariableData, GPostsWithFixedVariableDataBuilder> {
  GPostsWithFixedVariableData._();

  factory GPostsWithFixedVariableData(
          [void Function(GPostsWithFixedVariableDataBuilder b) updates]) =
      _$GPostsWithFixedVariableData;

  static void _initializeBuilder(GPostsWithFixedVariableDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPostFragmentForUser2Data?>? get posts;
  static Serializer<GPostsWithFixedVariableData> get serializer =>
      _$gPostsWithFixedVariableDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostsWithFixedVariableData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostsWithFixedVariableData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostsWithFixedVariableData.serializer,
        json,
      );
}

abstract class GPostFragmentForUser1 {
  String get G__typename;
  String get id;
  GPostFragmentForUser1_favoritedUsers? get favoritedUsers;
  Map<String, dynamic> toJson();
}

abstract class GPostFragmentForUser1_favoritedUsers {
  String get G__typename;
  int get totalCount;
  Map<String, dynamic> toJson();
}

abstract class GPostFragmentForUser1Data
    implements
        Built<GPostFragmentForUser1Data, GPostFragmentForUser1DataBuilder>,
        GPostFragmentForUser1 {
  GPostFragmentForUser1Data._();

  factory GPostFragmentForUser1Data(
          [void Function(GPostFragmentForUser1DataBuilder b) updates]) =
      _$GPostFragmentForUser1Data;

  static void _initializeBuilder(GPostFragmentForUser1DataBuilder b) =>
      b..G__typename = 'Post';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GPostFragmentForUser1Data_favoritedUsers? get favoritedUsers;
  static Serializer<GPostFragmentForUser1Data> get serializer =>
      _$gPostFragmentForUser1DataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostFragmentForUser1Data.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostFragmentForUser1Data? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostFragmentForUser1Data.serializer,
        json,
      );
}

abstract class GPostFragmentForUser1Data_favoritedUsers
    implements
        Built<GPostFragmentForUser1Data_favoritedUsers,
            GPostFragmentForUser1Data_favoritedUsersBuilder>,
        GPostFragmentForUser1_favoritedUsers {
  GPostFragmentForUser1Data_favoritedUsers._();

  factory GPostFragmentForUser1Data_favoritedUsers(
      [void Function(GPostFragmentForUser1Data_favoritedUsersBuilder b)
          updates]) = _$GPostFragmentForUser1Data_favoritedUsers;

  static void _initializeBuilder(
          GPostFragmentForUser1Data_favoritedUsersBuilder b) =>
      b..G__typename = 'PostLikes';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get totalCount;
  static Serializer<GPostFragmentForUser1Data_favoritedUsers> get serializer =>
      _$gPostFragmentForUser1DataFavoritedUsersSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostFragmentForUser1Data_favoritedUsers.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostFragmentForUser1Data_favoritedUsers? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostFragmentForUser1Data_favoritedUsers.serializer,
        json,
      );
}

abstract class GPostFragmentForUser2 {
  String get G__typename;
  String get id;
  GPostFragmentForUser2_favoritedUsers? get favoritedUsers;
  Map<String, dynamic> toJson();
}

abstract class GPostFragmentForUser2_favoritedUsers {
  String get G__typename;
  int get totalCount;
  Map<String, dynamic> toJson();
}

abstract class GPostFragmentForUser2Data
    implements
        Built<GPostFragmentForUser2Data, GPostFragmentForUser2DataBuilder>,
        GPostFragmentForUser2 {
  GPostFragmentForUser2Data._();

  factory GPostFragmentForUser2Data(
          [void Function(GPostFragmentForUser2DataBuilder b) updates]) =
      _$GPostFragmentForUser2Data;

  static void _initializeBuilder(GPostFragmentForUser2DataBuilder b) =>
      b..G__typename = 'Post';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GPostFragmentForUser2Data_favoritedUsers? get favoritedUsers;
  static Serializer<GPostFragmentForUser2Data> get serializer =>
      _$gPostFragmentForUser2DataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostFragmentForUser2Data.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostFragmentForUser2Data? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostFragmentForUser2Data.serializer,
        json,
      );
}

abstract class GPostFragmentForUser2Data_favoritedUsers
    implements
        Built<GPostFragmentForUser2Data_favoritedUsers,
            GPostFragmentForUser2Data_favoritedUsersBuilder>,
        GPostFragmentForUser2_favoritedUsers {
  GPostFragmentForUser2Data_favoritedUsers._();

  factory GPostFragmentForUser2Data_favoritedUsers(
      [void Function(GPostFragmentForUser2Data_favoritedUsersBuilder b)
          updates]) = _$GPostFragmentForUser2Data_favoritedUsers;

  static void _initializeBuilder(
          GPostFragmentForUser2Data_favoritedUsersBuilder b) =>
      b..G__typename = 'PostLikes';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get totalCount;
  static Serializer<GPostFragmentForUser2Data_favoritedUsers> get serializer =>
      _$gPostFragmentForUser2DataFavoritedUsersSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostFragmentForUser2Data_favoritedUsers.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPostFragmentForUser2Data_favoritedUsers? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostFragmentForUser2Data_favoritedUsers.serializer,
        json,
      );
}
