// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/serializers.gql.dart' as _i1;

part 'hero_with_fragments.data.gql.g.dart';

abstract class GHeroWithFragmentsData
    implements Built<GHeroWithFragmentsData, GHeroWithFragmentsDataBuilder> {
  GHeroWithFragmentsData._();

  factory GHeroWithFragmentsData(
          [Function(GHeroWithFragmentsDataBuilder b) updates]) =
      _$GHeroWithFragmentsData;

  @nullable
  GHeroWithFragmentsData_hero get hero;
  static Serializer<GHeroWithFragmentsData> get serializer =>
      _$gHeroWithFragmentsDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GHeroWithFragmentsData.serializer, this);
  static GHeroWithFragmentsData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GHeroWithFragmentsData.serializer, json);
}

abstract class GHeroWithFragmentsData_hero
    implements
        Built<GHeroWithFragmentsData_hero, GHeroWithFragmentsData_heroBuilder>,
        GcomparisonFields {
  GHeroWithFragmentsData_hero._();

  factory GHeroWithFragmentsData_hero(
          [Function(GHeroWithFragmentsData_heroBuilder b) updates]) =
      _$GHeroWithFragmentsData_hero;

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  GHeroWithFragmentsData_hero_friendsConnection get friendsConnection;
  static Serializer<GHeroWithFragmentsData_hero> get serializer =>
      _$gHeroWithFragmentsDataHeroSerializer;
  Map<String, dynamic> toJson() => _i1.serializers
      .serializeWith(GHeroWithFragmentsData_hero.serializer, this);
  static GHeroWithFragmentsData_hero fromJson(Map<String, dynamic> json) =>
      _i1.serializers
          .deserializeWith(GHeroWithFragmentsData_hero.serializer, json);
}

abstract class GHeroWithFragmentsData_hero_friendsConnection
    implements
        Built<GHeroWithFragmentsData_hero_friendsConnection,
            GHeroWithFragmentsData_hero_friendsConnectionBuilder>,
        GcomparisonFields_friendsConnection {
  GHeroWithFragmentsData_hero_friendsConnection._();

  factory GHeroWithFragmentsData_hero_friendsConnection(
      [Function(GHeroWithFragmentsData_hero_friendsConnectionBuilder b)
          updates]) = _$GHeroWithFragmentsData_hero_friendsConnection;

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  int get totalCount;
  @nullable
  BuiltList<GHeroWithFragmentsData_hero_friendsConnection_edges> get edges;
  static Serializer<GHeroWithFragmentsData_hero_friendsConnection>
      get serializer => _$gHeroWithFragmentsDataHeroFriendsConnectionSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GHeroWithFragmentsData_hero_friendsConnection.serializer, this);
  static GHeroWithFragmentsData_hero_friendsConnection fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GHeroWithFragmentsData_hero_friendsConnection.serializer, json);
}

abstract class GHeroWithFragmentsData_hero_friendsConnection_edges
    implements
        Built<GHeroWithFragmentsData_hero_friendsConnection_edges,
            GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder>,
        GcomparisonFields_friendsConnection_edges {
  GHeroWithFragmentsData_hero_friendsConnection_edges._();

  factory GHeroWithFragmentsData_hero_friendsConnection_edges(
      [Function(GHeroWithFragmentsData_hero_friendsConnection_edgesBuilder b)
          updates]) = _$GHeroWithFragmentsData_hero_friendsConnection_edges;

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @nullable
  GHeroWithFragmentsData_hero_friendsConnection_edges_node get node;
  static Serializer<GHeroWithFragmentsData_hero_friendsConnection_edges>
      get serializer =>
          _$gHeroWithFragmentsDataHeroFriendsConnectionEdgesSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GHeroWithFragmentsData_hero_friendsConnection_edges.serializer, this);
  static GHeroWithFragmentsData_hero_friendsConnection_edges fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GHeroWithFragmentsData_hero_friendsConnection_edges.serializer, json);
}

abstract class GHeroWithFragmentsData_hero_friendsConnection_edges_node
    implements
        Built<GHeroWithFragmentsData_hero_friendsConnection_edges_node,
            GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder>,
        GcomparisonFields_friendsConnection_edges_node,
        GheroData {
  GHeroWithFragmentsData_hero_friendsConnection_edges_node._();

  factory GHeroWithFragmentsData_hero_friendsConnection_edges_node(
      [Function(
              GHeroWithFragmentsData_hero_friendsConnection_edges_nodeBuilder b)
          updates]) = _$GHeroWithFragmentsData_hero_friendsConnection_edges_node;

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  static Serializer<GHeroWithFragmentsData_hero_friendsConnection_edges_node>
      get serializer =>
          _$gHeroWithFragmentsDataHeroFriendsConnectionEdgesNodeSerializer;
  Map<String, dynamic> toJson() => _i1.serializers.serializeWith(
      GHeroWithFragmentsData_hero_friendsConnection_edges_node.serializer,
      this);
  static GHeroWithFragmentsData_hero_friendsConnection_edges_node fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
          GHeroWithFragmentsData_hero_friendsConnection_edges_node.serializer,
          json);
}

abstract class GheroData {
  String get G__typename;
  String get name;
}

abstract class GcomparisonFields implements GheroData {
  String get G__typename;
  String get id;
  String get name;
  GcomparisonFields_friendsConnection get friendsConnection;
}

abstract class GcomparisonFields_friendsConnection {
  String get G__typename;
  int get totalCount;
  BuiltList<GcomparisonFields_friendsConnection_edges> get edges;
}

abstract class GcomparisonFields_friendsConnection_edges {
  String get G__typename;
  GcomparisonFields_friendsConnection_edges_node get node;
}

abstract class GcomparisonFields_friendsConnection_edges_node
    implements GheroData {
  String get G__typename;
  String get name;
}
