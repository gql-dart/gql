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
          [Function(GPostsWithFixedVariableDataBuilder b) updates]) =
      _$GPostsWithFixedVariableData;

  static void _initializeBuilder(GPostsWithFixedVariableDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPostsWithFixedVariableData_posts?>? get posts;
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

abstract class GPostsWithFixedVariableData_posts
    implements
        Built<GPostsWithFixedVariableData_posts,
            GPostsWithFixedVariableData_postsBuilder>,
        GPostFragmentForUser1 {
  GPostsWithFixedVariableData_posts._();

  factory GPostsWithFixedVariableData_posts(
          [Function(GPostsWithFixedVariableData_postsBuilder b) updates]) =
      _$GPostsWithFixedVariableData_posts;

  static void _initializeBuilder(GPostsWithFixedVariableData_postsBuilder b) =>
      b..G__typename = 'Post';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GPostsWithFixedVariableData_posts_favoritedUsers? get favoritedUsers;
  static Serializer<GPostsWithFixedVariableData_posts> get serializer =>
      _$gPostsWithFixedVariableDataPostsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostsWithFixedVariableData_posts.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostsWithFixedVariableData_posts? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostsWithFixedVariableData_posts.serializer,
        json,
      );
}

abstract class GPostsWithFixedVariableData_posts_favoritedUsers
    implements
        Built<GPostsWithFixedVariableData_posts_favoritedUsers,
            GPostsWithFixedVariableData_posts_favoritedUsersBuilder>,
        GPostFragmentForUser1_favoritedUsers {
  GPostsWithFixedVariableData_posts_favoritedUsers._();

  factory GPostsWithFixedVariableData_posts_favoritedUsers(
      [Function(GPostsWithFixedVariableData_posts_favoritedUsersBuilder b)
          updates]) = _$GPostsWithFixedVariableData_posts_favoritedUsers;

  static void _initializeBuilder(
          GPostsWithFixedVariableData_posts_favoritedUsersBuilder b) =>
      b..G__typename = 'PostLikes';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get totalCount;
  static Serializer<GPostsWithFixedVariableData_posts_favoritedUsers>
      get serializer =>
          _$gPostsWithFixedVariableDataPostsFavoritedUsersSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostsWithFixedVariableData_posts_favoritedUsers.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostsWithFixedVariableData_posts_favoritedUsers? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostsWithFixedVariableData_posts_favoritedUsers.serializer,
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
          [Function(GPostFragmentForUser1DataBuilder b) updates]) =
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
      [Function(GPostFragmentForUser1Data_favoritedUsersBuilder b)
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
