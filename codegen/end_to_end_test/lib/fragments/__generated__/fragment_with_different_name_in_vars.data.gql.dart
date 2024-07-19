// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;

part 'fragment_with_different_name_in_vars.data.gql.g.dart';

abstract class GDifferentName {
  String get G__typename;
  String get id;
  GDifferentName_friendsConnection get friendsConnection;
  Map<String, dynamic> toJson();
}

abstract class GDifferentName_friendsConnection {
  String get G__typename;
  int? get totalCount;
  Map<String, dynamic> toJson();
}

abstract class GDifferentNameData
    implements
        Built<GDifferentNameData, GDifferentNameDataBuilder>,
        GDifferentName {
  GDifferentNameData._();

  factory GDifferentNameData(
          [void Function(GDifferentNameDataBuilder b) updates]) =
      _$GDifferentNameData;

  static void _initializeBuilder(GDifferentNameDataBuilder b) =>
      b..G__typename = 'Character';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get id;
  @override
  GDifferentNameData_friendsConnection get friendsConnection;
  static Serializer<GDifferentNameData> get serializer =>
      _$gDifferentNameDataSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDifferentNameData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDifferentNameData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDifferentNameData.serializer,
        json,
      );
}

abstract class GDifferentNameData_friendsConnection
    implements
        Built<GDifferentNameData_friendsConnection,
            GDifferentNameData_friendsConnectionBuilder>,
        GDifferentName_friendsConnection {
  GDifferentNameData_friendsConnection._();

  factory GDifferentNameData_friendsConnection(
      [void Function(GDifferentNameData_friendsConnectionBuilder b)
          updates]) = _$GDifferentNameData_friendsConnection;

  static void _initializeBuilder(
          GDifferentNameData_friendsConnectionBuilder b) =>
      b..G__typename = 'FriendsConnection';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  int? get totalCount;
  static Serializer<GDifferentNameData_friendsConnection> get serializer =>
      _$gDifferentNameDataFriendsConnectionSerializer;

  @override
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GDifferentNameData_friendsConnection.serializer,
        this,
      ) as Map<String, dynamic>);

  static GDifferentNameData_friendsConnection? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GDifferentNameData_friendsConnection.serializer,
        json,
      );
}
