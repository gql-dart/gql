// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/fragments/__generated__/fragment_with_scalar_var.data.gql.dart'
    as _i2;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'alias_var_fragment.data.gql.g.dart';

abstract class GPostsData implements Built<GPostsData, GPostsDataBuilder> {
  GPostsData._();

  factory GPostsData([void Function(GPostsDataBuilder b) updates]) =
      _$GPostsData;

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

  factory GPostsData_posts([void Function(GPostsData_postsBuilder b) updates]) =
      _$GPostsData_posts;

  static void _initializeBuilder(GPostsData_postsBuilder b) =>
      b..G__typename = 'Post';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  _i2.GPostsWithFixedVariableData_posts_favoritedUsers? get isFavorited;
  @override
  _i2.GPostsWithFixedVariableData_posts_favoritedUsers? get isLiked;
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

abstract class GPostFragment {
  String get G__typename;
  String get id;
  _i2.GPostsWithFixedVariableData_posts_favoritedUsers? get isFavorited;
  _i2.GPostsWithFixedVariableData_posts_favoritedUsers? get isLiked;
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

  factory GPostFragmentData(
          [void Function(GPostFragmentDataBuilder b) updates]) =
      _$GPostFragmentData;

  static void _initializeBuilder(GPostFragmentDataBuilder b) =>
      b..G__typename = 'Post';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  _i2.GPostsWithFixedVariableData_posts_favoritedUsers? get isFavorited;
  @override
  _i2.GPostsWithFixedVariableData_posts_favoritedUsers? get isLiked;
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
