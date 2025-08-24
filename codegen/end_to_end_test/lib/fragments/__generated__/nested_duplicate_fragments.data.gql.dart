// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart'
    as _i3;
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    as _i2;

part 'nested_duplicate_fragments.data.gql.g.dart';

abstract class GSearchResultsQueryData
    implements Built<GSearchResultsQueryData, GSearchResultsQueryDataBuilder> {
  GSearchResultsQueryData._();

  factory GSearchResultsQueryData([
    void Function(GSearchResultsQueryDataBuilder b) updates,
  ]) = _$GSearchResultsQueryData;

  static void _initializeBuilder(GSearchResultsQueryDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GSearchResultsQueryData_search?>? get search;
  static Serializer<GSearchResultsQueryData> get serializer =>
      _$gSearchResultsQueryDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GSearchResultsQueryData.serializer, this)
          as Map<String, dynamic>);

  static GSearchResultsQueryData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GSearchResultsQueryData.serializer, json);
}

abstract class GSearchResultsQueryData_search {
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GSearchResultsQueryData_search> get serializer =>
      _i2.InlineFragmentSerializer<GSearchResultsQueryData_search>(
        'GSearchResultsQueryData_search',
        GSearchResultsQueryData_search__base,
        {
          'Human': GSearchResultsQueryData_search__asHuman,
          'Droid': GSearchResultsQueryData_search__asDroid,
        },
      );

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GSearchResultsQueryData_search.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GSearchResultsQueryData_search? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GSearchResultsQueryData_search.serializer,
        json,
      );
}

extension GSearchResultsQueryData_searchWhenExtension
    on GSearchResultsQueryData_search {
  _T when<_T>({
    required _T Function(GSearchResultsQueryData_search__asHuman) human,
    required _T Function(GSearchResultsQueryData_search__asDroid) droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human((this as GSearchResultsQueryData_search__asHuman));
      case 'Droid':
        return droid((this as GSearchResultsQueryData_search__asDroid));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GSearchResultsQueryData_search__asHuman)? human,
    _T Function(GSearchResultsQueryData_search__asDroid)? droid,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Human':
        return human != null
            ? human((this as GSearchResultsQueryData_search__asHuman))
            : orElse();
      case 'Droid':
        return droid != null
            ? droid((this as GSearchResultsQueryData_search__asDroid))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GSearchResultsQueryData_search__base
    implements
        Built<
          GSearchResultsQueryData_search__base,
          GSearchResultsQueryData_search__baseBuilder
        >,
        GSearchResultsQueryData_search {
  GSearchResultsQueryData_search__base._();

  factory GSearchResultsQueryData_search__base([
    void Function(GSearchResultsQueryData_search__baseBuilder b) updates,
  ]) = _$GSearchResultsQueryData_search__base;

  static void _initializeBuilder(
    GSearchResultsQueryData_search__baseBuilder b,
  ) => b..G__typename = 'SearchResult';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  static Serializer<GSearchResultsQueryData_search__base> get serializer =>
      _$gSearchResultsQueryDataSearchBaseSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GSearchResultsQueryData_search__base.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GSearchResultsQueryData_search__base? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GSearchResultsQueryData_search__base.serializer,
    json,
  );
}

abstract class GSearchResultsQueryData_search__asHuman
    implements
        Built<
          GSearchResultsQueryData_search__asHuman,
          GSearchResultsQueryData_search__asHumanBuilder
        >,
        GSearchResultsQueryData_search,
        GCharacterDetails {
  GSearchResultsQueryData_search__asHuman._();

  factory GSearchResultsQueryData_search__asHuman([
    void Function(GSearchResultsQueryData_search__asHumanBuilder b) updates,
  ]) = _$GSearchResultsQueryData_search__asHuman;

  static void _initializeBuilder(
    GSearchResultsQueryData_search__asHumanBuilder b,
  ) => b..G__typename = 'Human';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  BuiltList<GSearchResultsQueryData_search__asHuman_friends?>? get friends;
  @override
  BuiltList<_i3.GEpisode?> get appearsIn;
  static Serializer<GSearchResultsQueryData_search__asHuman> get serializer =>
      _$gSearchResultsQueryDataSearchAsHumanSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GSearchResultsQueryData_search__asHuman.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GSearchResultsQueryData_search__asHuman? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GSearchResultsQueryData_search__asHuman.serializer,
    json,
  );
}

abstract class GSearchResultsQueryData_search__asHuman_friends
    implements
        Built<
          GSearchResultsQueryData_search__asHuman_friends,
          GSearchResultsQueryData_search__asHuman_friendsBuilder
        >,
        GCharacterDetails_friends,
        GFriendInfo {
  GSearchResultsQueryData_search__asHuman_friends._();

  factory GSearchResultsQueryData_search__asHuman_friends([
    void Function(GSearchResultsQueryData_search__asHuman_friendsBuilder b)
    updates,
  ]) = _$GSearchResultsQueryData_search__asHuman_friends;

  static void _initializeBuilder(
    GSearchResultsQueryData_search__asHuman_friendsBuilder b,
  ) => b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection
  get friendsConnection;
  static Serializer<GSearchResultsQueryData_search__asHuman_friends>
  get serializer => _$gSearchResultsQueryDataSearchAsHumanFriendsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GSearchResultsQueryData_search__asHuman_friends.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GSearchResultsQueryData_search__asHuman_friends? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GSearchResultsQueryData_search__asHuman_friends.serializer,
    json,
  );
}

abstract class GSearchResultsQueryData_search__asHuman_friends_friendsConnection
    implements
        Built<
          GSearchResultsQueryData_search__asHuman_friends_friendsConnection,
          GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder
        >,
        GCharacterDetails_friends_friendsConnection,
        GFriendInfo_friendsConnection {
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection._();

  factory GSearchResultsQueryData_search__asHuman_friends_friendsConnection([
    void Function(
      GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder
      b,
    )
    updates,
  ]) = _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection;

  static void _initializeBuilder(
    GSearchResultsQueryData_search__asHuman_friends_friendsConnectionBuilder b,
  ) => b..G__typename = 'FriendsConnection';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<
    GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends?
  >?
  get friends;
  static Serializer<
    GSearchResultsQueryData_search__asHuman_friends_friendsConnection
  >
  get serializer =>
      _$gSearchResultsQueryDataSearchAsHumanFriendsFriendsConnectionSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GSearchResultsQueryData_search__asHuman_friends_friendsConnection
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GSearchResultsQueryData_search__asHuman_friends_friendsConnection?
  fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
    GSearchResultsQueryData_search__asHuman_friends_friendsConnection
        .serializer,
    json,
  );
}

abstract class GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
    implements
        Built<
          GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends,
          GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder
        >,
        GCharacterDetails_friends_friendsConnection_friends,
        GFriendInfo_friendsConnection_friends,
        GCharacterBasic {
  GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends._();

  factory GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends([
    void Function(
      GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder
      b,
    )
    updates,
  ]) =
      _$GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends;

  static void _initializeBuilder(
    GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friendsBuilder
    b,
  ) => b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<
    GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
  >
  get serializer =>
      _$gSearchResultsQueryDataSearchAsHumanFriendsFriendsConnectionFriendsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends?
  fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
    GSearchResultsQueryData_search__asHuman_friends_friendsConnection_friends
        .serializer,
    json,
  );
}

abstract class GSearchResultsQueryData_search__asDroid
    implements
        Built<
          GSearchResultsQueryData_search__asDroid,
          GSearchResultsQueryData_search__asDroidBuilder
        >,
        GSearchResultsQueryData_search,
        GCharacterDetails {
  GSearchResultsQueryData_search__asDroid._();

  factory GSearchResultsQueryData_search__asDroid([
    void Function(GSearchResultsQueryData_search__asDroidBuilder b) updates,
  ]) = _$GSearchResultsQueryData_search__asDroid;

  static void _initializeBuilder(
    GSearchResultsQueryData_search__asDroidBuilder b,
  ) => b..G__typename = 'Droid';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  BuiltList<GSearchResultsQueryData_search__asDroid_friends?>? get friends;
  @override
  BuiltList<_i3.GEpisode?> get appearsIn;
  static Serializer<GSearchResultsQueryData_search__asDroid> get serializer =>
      _$gSearchResultsQueryDataSearchAsDroidSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GSearchResultsQueryData_search__asDroid.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GSearchResultsQueryData_search__asDroid? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GSearchResultsQueryData_search__asDroid.serializer,
    json,
  );
}

abstract class GSearchResultsQueryData_search__asDroid_friends
    implements
        Built<
          GSearchResultsQueryData_search__asDroid_friends,
          GSearchResultsQueryData_search__asDroid_friendsBuilder
        >,
        GCharacterDetails_friends,
        GFriendInfo {
  GSearchResultsQueryData_search__asDroid_friends._();

  factory GSearchResultsQueryData_search__asDroid_friends([
    void Function(GSearchResultsQueryData_search__asDroid_friendsBuilder b)
    updates,
  ]) = _$GSearchResultsQueryData_search__asDroid_friends;

  static void _initializeBuilder(
    GSearchResultsQueryData_search__asDroid_friendsBuilder b,
  ) => b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection
  get friendsConnection;
  static Serializer<GSearchResultsQueryData_search__asDroid_friends>
  get serializer => _$gSearchResultsQueryDataSearchAsDroidFriendsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GSearchResultsQueryData_search__asDroid_friends.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GSearchResultsQueryData_search__asDroid_friends? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GSearchResultsQueryData_search__asDroid_friends.serializer,
    json,
  );
}

abstract class GSearchResultsQueryData_search__asDroid_friends_friendsConnection
    implements
        Built<
          GSearchResultsQueryData_search__asDroid_friends_friendsConnection,
          GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder
        >,
        GCharacterDetails_friends_friendsConnection,
        GFriendInfo_friendsConnection {
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection._();

  factory GSearchResultsQueryData_search__asDroid_friends_friendsConnection([
    void Function(
      GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder
      b,
    )
    updates,
  ]) = _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection;

  static void _initializeBuilder(
    GSearchResultsQueryData_search__asDroid_friends_friendsConnectionBuilder b,
  ) => b..G__typename = 'FriendsConnection';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<
    GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends?
  >?
  get friends;
  static Serializer<
    GSearchResultsQueryData_search__asDroid_friends_friendsConnection
  >
  get serializer =>
      _$gSearchResultsQueryDataSearchAsDroidFriendsFriendsConnectionSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GSearchResultsQueryData_search__asDroid_friends_friendsConnection
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GSearchResultsQueryData_search__asDroid_friends_friendsConnection?
  fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
    GSearchResultsQueryData_search__asDroid_friends_friendsConnection
        .serializer,
    json,
  );
}

abstract class GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
    implements
        Built<
          GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends,
          GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder
        >,
        GCharacterDetails_friends_friendsConnection_friends,
        GFriendInfo_friendsConnection_friends,
        GCharacterBasic {
  GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends._();

  factory GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends([
    void Function(
      GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder
      b,
    )
    updates,
  ]) =
      _$GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends;

  static void _initializeBuilder(
    GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friendsBuilder
    b,
  ) => b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<
    GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
  >
  get serializer =>
      _$gSearchResultsQueryDataSearchAsDroidFriendsFriendsConnectionFriendsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
                .serializer,
            this,
          )
          as Map<String, dynamic>);

  static GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends?
  fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
    GSearchResultsQueryData_search__asDroid_friends_friendsConnection_friends
        .serializer,
    json,
  );
}

abstract class GCharacterDetails {
  String get G__typename;
  String get id;
  String get name;
  BuiltList<GCharacterDetails_friends?>? get friends;
  BuiltList<_i3.GEpisode?> get appearsIn;
}

abstract class GCharacterDetails_friends implements GFriendInfo {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  GCharacterDetails_friends_friendsConnection get friendsConnection;
}

abstract class GCharacterDetails_friends_friendsConnection
    implements GFriendInfo_friendsConnection {
  @override
  String get G__typename;
  @override
  BuiltList<GCharacterDetails_friends_friendsConnection_friends?>? get friends;
}

abstract class GCharacterDetails_friends_friendsConnection_friends
    implements GFriendInfo_friendsConnection_friends, GCharacterBasic {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
}

abstract class GCharacterDetailsData
    implements
        Built<GCharacterDetailsData, GCharacterDetailsDataBuilder>,
        GCharacterDetails {
  GCharacterDetailsData._();

  factory GCharacterDetailsData([
    void Function(GCharacterDetailsDataBuilder b) updates,
  ]) = _$GCharacterDetailsData;

  static void _initializeBuilder(GCharacterDetailsDataBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  BuiltList<GCharacterDetailsData_friends?>? get friends;
  @override
  BuiltList<_i3.GEpisode?> get appearsIn;
  static Serializer<GCharacterDetailsData> get serializer =>
      _$gCharacterDetailsDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCharacterDetailsData.serializer, this)
          as Map<String, dynamic>);

  static GCharacterDetailsData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCharacterDetailsData.serializer, json);
}

abstract class GCharacterDetailsData_friends
    implements
        Built<
          GCharacterDetailsData_friends,
          GCharacterDetailsData_friendsBuilder
        >,
        GCharacterDetails_friends,
        GFriendInfo {
  GCharacterDetailsData_friends._();

  factory GCharacterDetailsData_friends([
    void Function(GCharacterDetailsData_friendsBuilder b) updates,
  ]) = _$GCharacterDetailsData_friends;

  static void _initializeBuilder(GCharacterDetailsData_friendsBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  GCharacterDetailsData_friends_friendsConnection get friendsConnection;
  static Serializer<GCharacterDetailsData_friends> get serializer =>
      _$gCharacterDetailsDataFriendsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GCharacterDetailsData_friends.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GCharacterDetailsData_friends? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GCharacterDetailsData_friends.serializer,
        json,
      );
}

abstract class GCharacterDetailsData_friends_friendsConnection
    implements
        Built<
          GCharacterDetailsData_friends_friendsConnection,
          GCharacterDetailsData_friends_friendsConnectionBuilder
        >,
        GCharacterDetails_friends_friendsConnection,
        GFriendInfo_friendsConnection {
  GCharacterDetailsData_friends_friendsConnection._();

  factory GCharacterDetailsData_friends_friendsConnection([
    void Function(GCharacterDetailsData_friends_friendsConnectionBuilder b)
    updates,
  ]) = _$GCharacterDetailsData_friends_friendsConnection;

  static void _initializeBuilder(
    GCharacterDetailsData_friends_friendsConnectionBuilder b,
  ) => b..G__typename = 'FriendsConnection';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GCharacterDetailsData_friends_friendsConnection_friends?>?
  get friends;
  static Serializer<GCharacterDetailsData_friends_friendsConnection>
  get serializer => _$gCharacterDetailsDataFriendsFriendsConnectionSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GCharacterDetailsData_friends_friendsConnection.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GCharacterDetailsData_friends_friendsConnection? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GCharacterDetailsData_friends_friendsConnection.serializer,
    json,
  );
}

abstract class GCharacterDetailsData_friends_friendsConnection_friends
    implements
        Built<
          GCharacterDetailsData_friends_friendsConnection_friends,
          GCharacterDetailsData_friends_friendsConnection_friendsBuilder
        >,
        GCharacterDetails_friends_friendsConnection_friends,
        GFriendInfo_friendsConnection_friends,
        GCharacterBasic {
  GCharacterDetailsData_friends_friendsConnection_friends._();

  factory GCharacterDetailsData_friends_friendsConnection_friends([
    void Function(
      GCharacterDetailsData_friends_friendsConnection_friendsBuilder b,
    )
    updates,
  ]) = _$GCharacterDetailsData_friends_friendsConnection_friends;

  static void _initializeBuilder(
    GCharacterDetailsData_friends_friendsConnection_friendsBuilder b,
  ) => b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GCharacterDetailsData_friends_friendsConnection_friends>
  get serializer =>
      _$gCharacterDetailsDataFriendsFriendsConnectionFriendsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GCharacterDetailsData_friends_friendsConnection_friends.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GCharacterDetailsData_friends_friendsConnection_friends? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GCharacterDetailsData_friends_friendsConnection_friends.serializer,
    json,
  );
}

abstract class GFriendInfo {
  String get G__typename;
  String get id;
  String get name;
  GFriendInfo_friendsConnection get friendsConnection;
}

abstract class GFriendInfo_friendsConnection {
  String get G__typename;
  BuiltList<GFriendInfo_friendsConnection_friends?>? get friends;
}

abstract class GFriendInfo_friendsConnection_friends
    implements GCharacterBasic {
  @override
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
}

abstract class GFriendInfoData
    implements Built<GFriendInfoData, GFriendInfoDataBuilder>, GFriendInfo {
  GFriendInfoData._();

  factory GFriendInfoData([void Function(GFriendInfoDataBuilder b) updates]) =
      _$GFriendInfoData;

  static void _initializeBuilder(GFriendInfoDataBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  @override
  GFriendInfoData_friendsConnection get friendsConnection;
  static Serializer<GFriendInfoData> get serializer =>
      _$gFriendInfoDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GFriendInfoData.serializer, this)
          as Map<String, dynamic>);

  static GFriendInfoData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFriendInfoData.serializer, json);
}

abstract class GFriendInfoData_friendsConnection
    implements
        Built<
          GFriendInfoData_friendsConnection,
          GFriendInfoData_friendsConnectionBuilder
        >,
        GFriendInfo_friendsConnection {
  GFriendInfoData_friendsConnection._();

  factory GFriendInfoData_friendsConnection([
    void Function(GFriendInfoData_friendsConnectionBuilder b) updates,
  ]) = _$GFriendInfoData_friendsConnection;

  static void _initializeBuilder(GFriendInfoData_friendsConnectionBuilder b) =>
      b..G__typename = 'FriendsConnection';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  BuiltList<GFriendInfoData_friendsConnection_friends?>? get friends;
  static Serializer<GFriendInfoData_friendsConnection> get serializer =>
      _$gFriendInfoDataFriendsConnectionSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GFriendInfoData_friendsConnection.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GFriendInfoData_friendsConnection? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GFriendInfoData_friendsConnection.serializer,
    json,
  );
}

abstract class GFriendInfoData_friendsConnection_friends
    implements
        Built<
          GFriendInfoData_friendsConnection_friends,
          GFriendInfoData_friendsConnection_friendsBuilder
        >,
        GFriendInfo_friendsConnection_friends,
        GCharacterBasic {
  GFriendInfoData_friendsConnection_friends._();

  factory GFriendInfoData_friendsConnection_friends([
    void Function(GFriendInfoData_friendsConnection_friendsBuilder b) updates,
  ]) = _$GFriendInfoData_friendsConnection_friends;

  static void _initializeBuilder(
    GFriendInfoData_friendsConnection_friendsBuilder b,
  ) => b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GFriendInfoData_friendsConnection_friends> get serializer =>
      _$gFriendInfoDataFriendsConnectionFriendsSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(
            GFriendInfoData_friendsConnection_friends.serializer,
            this,
          )
          as Map<String, dynamic>);

  static GFriendInfoData_friendsConnection_friends? fromJson(
    Map<String, dynamic> json,
  ) => _i1.serializers.deserializeWith(
    GFriendInfoData_friendsConnection_friends.serializer,
    json,
  );
}

abstract class GCharacterBasic {
  String get G__typename;
  String get id;
  String get name;
}

abstract class GCharacterBasicData
    implements
        Built<GCharacterBasicData, GCharacterBasicDataBuilder>,
        GCharacterBasic {
  GCharacterBasicData._();

  factory GCharacterBasicData([
    void Function(GCharacterBasicDataBuilder b) updates,
  ]) = _$GCharacterBasicData;

  static void _initializeBuilder(GCharacterBasicDataBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  String get name;
  static Serializer<GCharacterBasicData> get serializer =>
      _$gCharacterBasicDataSerializer;

  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GCharacterBasicData.serializer, this)
          as Map<String, dynamic>);

  static GCharacterBasicData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GCharacterBasicData.serializer, json);
}
