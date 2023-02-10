// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'alias_var_fragment.data.gql.g.dart';

abstract class GPostsData implements Built<GPostsData, GPostsDataBuilder> {
  GPostsData._();

  factory GPostsData([Function(GPostsDataBuilder b) updates]) = _$GPostsData;

  static void _initializeBuilder(GPostsDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPostsData_posts?>? get posts;
  static Serializer<GPostsData> get serializer => _$gPostsDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostsData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostsData.serializer,
        json,
      );
}

abstract class GPostsData_posts
    implements Built<GPostsData_posts, GPostsData_postsBuilder>, GPostFragment {
  GPostsData_posts._();

  factory GPostsData_posts([Function(GPostsData_postsBuilder b) updates]) =
      _$GPostsData_posts;

  static void _initializeBuilder(GPostsData_postsBuilder b) =>
      b..G__typename = 'Post';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GPostsData_posts_isFavorited? get isFavorited;
  @override
  GPostsData_posts_isLiked? get isLiked;
  static Serializer<GPostsData_posts> get serializer =>
      _$gPostsDataPostsSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostsData_posts.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostsData_posts? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostsData_posts.serializer,
        json,
      );
}

abstract class GPostsData_posts_isFavorited
    implements
        Built<GPostsData_posts_isFavorited,
            GPostsData_posts_isFavoritedBuilder>,
        GPostFragment_isFavorited {
  GPostsData_posts_isFavorited._();

  factory GPostsData_posts_isFavorited(
          [Function(GPostsData_posts_isFavoritedBuilder b) updates]) =
      _$GPostsData_posts_isFavorited;

  static void _initializeBuilder(GPostsData_posts_isFavoritedBuilder b) =>
      b..G__typename = 'PostLikes';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get totalCount;
  static Serializer<GPostsData_posts_isFavorited> get serializer =>
      _$gPostsDataPostsIsFavoritedSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostsData_posts_isFavorited.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostsData_posts_isFavorited? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostsData_posts_isFavorited.serializer,
        json,
      );
}

abstract class GPostsData_posts_isLiked
    implements
        Built<GPostsData_posts_isLiked, GPostsData_posts_isLikedBuilder>,
        GPostFragment_isLiked {
  GPostsData_posts_isLiked._();

  factory GPostsData_posts_isLiked(
          [Function(GPostsData_posts_isLikedBuilder b) updates]) =
      _$GPostsData_posts_isLiked;

  static void _initializeBuilder(GPostsData_posts_isLikedBuilder b) =>
      b..G__typename = 'PostFavorites';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get totalCount;
  static Serializer<GPostsData_posts_isLiked> get serializer =>
      _$gPostsDataPostsIsLikedSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostsData_posts_isLiked.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostsData_posts_isLiked? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostsData_posts_isLiked.serializer,
        json,
      );
}

abstract class GPostFragment {
  String get G__typename;
  String get id;
  GPostFragment_isFavorited? get isFavorited;
  GPostFragment_isLiked? get isLiked;
  Map<String, dynamic> toJson();
}

abstract class GPostFragment_isFavorited {
  String get G__typename;
  int get totalCount;
  Map<String, dynamic> toJson();
}

abstract class GPostFragment_isLiked {
  String get G__typename;
  int get totalCount;
  Map<String, dynamic> toJson();
}

abstract class GPostFragmentData
    implements
        Built<GPostFragmentData, GPostFragmentDataBuilder>,
        GPostFragment {
  GPostFragmentData._();

  factory GPostFragmentData([Function(GPostFragmentDataBuilder b) updates]) =
      _$GPostFragmentData;

  static void _initializeBuilder(GPostFragmentDataBuilder b) =>
      b..G__typename = 'Post';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GPostFragmentData_isFavorited? get isFavorited;
  @override
  GPostFragmentData_isLiked? get isLiked;
  static Serializer<GPostFragmentData> get serializer =>
      _$gPostFragmentDataSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostFragmentData.serializer,
        json,
      );
}

abstract class GPostFragmentData_isFavorited
    implements
        Built<GPostFragmentData_isFavorited,
            GPostFragmentData_isFavoritedBuilder>,
        GPostFragment_isFavorited {
  GPostFragmentData_isFavorited._();

  factory GPostFragmentData_isFavorited(
          [Function(GPostFragmentData_isFavoritedBuilder b) updates]) =
      _$GPostFragmentData_isFavorited;

  static void _initializeBuilder(GPostFragmentData_isFavoritedBuilder b) =>
      b..G__typename = 'PostLikes';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get totalCount;
  static Serializer<GPostFragmentData_isFavorited> get serializer =>
      _$gPostFragmentDataIsFavoritedSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostFragmentData_isFavorited.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostFragmentData_isFavorited? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostFragmentData_isFavorited.serializer,
        json,
      );
}

abstract class GPostFragmentData_isLiked
    implements
        Built<GPostFragmentData_isLiked, GPostFragmentData_isLikedBuilder>,
        GPostFragment_isLiked {
  GPostFragmentData_isLiked._();

  factory GPostFragmentData_isLiked(
          [Function(GPostFragmentData_isLikedBuilder b) updates]) =
      _$GPostFragmentData_isLiked;

  static void _initializeBuilder(GPostFragmentData_isLikedBuilder b) =>
      b..G__typename = 'PostFavorites';
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int get totalCount;
  static Serializer<GPostFragmentData_isLiked> get serializer =>
      _$gPostFragmentDataIsLikedSerializer;
  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPostFragmentData_isLiked.serializer,
        this,
      ) as Map<String, dynamic>);
  static GPostFragmentData_isLiked? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPostFragmentData_isLiked.serializer,
        json,
      );
}
