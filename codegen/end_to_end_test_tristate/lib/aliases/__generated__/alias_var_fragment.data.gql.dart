// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/serializers.gql.dart'
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
  BuiltList<GPostFragmentData?>? get posts;
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
          [void Function(GPostFragmentData_isFavoritedBuilder b) updates]) =
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
          [void Function(GPostFragmentData_isLikedBuilder b) updates]) =
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
