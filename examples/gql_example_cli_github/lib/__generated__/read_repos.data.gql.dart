// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli_github/__generated__/schema.schema.gql.dart'
    as _i2;
import 'package:gql_example_cli_github/__generated__/serializers.gql.dart'
    as _i1;

part 'read_repos.data.gql.g.dart';

abstract class GReadRepositoriesData
    implements Built<GReadRepositoriesData, GReadRepositoriesDataBuilder> {
  GReadRepositoriesData._();

  factory GReadRepositoriesData(
          [Function(GReadRepositoriesDataBuilder b) updates]) =
      _$GReadRepositoriesData;

  static void _initializeBuilder(GReadRepositoriesDataBuilder b) =>
      b..G__typename = 'Query';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GReadRepositoriesData_viewer get viewer;
  static Serializer<GReadRepositoriesData> get serializer =>
      _$gReadRepositoriesDataSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReadRepositoriesData.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReadRepositoriesData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReadRepositoriesData.serializer,
        json,
      );
}

abstract class GReadRepositoriesData_viewer
    implements
        Built<GReadRepositoriesData_viewer,
            GReadRepositoriesData_viewerBuilder> {
  GReadRepositoriesData_viewer._();

  factory GReadRepositoriesData_viewer(
          [Function(GReadRepositoriesData_viewerBuilder b) updates]) =
      _$GReadRepositoriesData_viewer;

  static void _initializeBuilder(GReadRepositoriesData_viewerBuilder b) =>
      b..G__typename = 'User';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GReadRepositoriesData_viewer_repositories get repositories;
  static Serializer<GReadRepositoriesData_viewer> get serializer =>
      _$gReadRepositoriesDataViewerSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReadRepositoriesData_viewer.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReadRepositoriesData_viewer? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReadRepositoriesData_viewer.serializer,
        json,
      );
}

abstract class GReadRepositoriesData_viewer_repositories
    implements
        Built<GReadRepositoriesData_viewer_repositories,
            GReadRepositoriesData_viewer_repositoriesBuilder> {
  GReadRepositoriesData_viewer_repositories._();

  factory GReadRepositoriesData_viewer_repositories(
      [Function(GReadRepositoriesData_viewer_repositoriesBuilder b)
          updates]) = _$GReadRepositoriesData_viewer_repositories;

  static void _initializeBuilder(
          GReadRepositoriesData_viewer_repositoriesBuilder b) =>
      b..G__typename = 'RepositoryConnection';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GReadRepositoriesData_viewer_repositories_nodes?>? get nodes;
  static Serializer<GReadRepositoriesData_viewer_repositories> get serializer =>
      _$gReadRepositoriesDataViewerRepositoriesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReadRepositoriesData_viewer_repositories.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReadRepositoriesData_viewer_repositories? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReadRepositoriesData_viewer_repositories.serializer,
        json,
      );
}

abstract class GReadRepositoriesData_viewer_repositories_nodes
    implements
        Built<GReadRepositoriesData_viewer_repositories_nodes,
            GReadRepositoriesData_viewer_repositories_nodesBuilder> {
  GReadRepositoriesData_viewer_repositories_nodes._();

  factory GReadRepositoriesData_viewer_repositories_nodes(
      [Function(GReadRepositoriesData_viewer_repositories_nodesBuilder b)
          updates]) = _$GReadRepositoriesData_viewer_repositories_nodes;

  static void _initializeBuilder(
          GReadRepositoriesData_viewer_repositories_nodesBuilder b) =>
      b..G__typename = 'Repository';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get id;
  String get name;
  bool get viewerHasStarred;
  _i2.GDateTime get createdAt;
  static Serializer<GReadRepositoriesData_viewer_repositories_nodes>
      get serializer =>
          _$gReadRepositoriesDataViewerRepositoriesNodesSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReadRepositoriesData_viewer_repositories_nodes.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReadRepositoriesData_viewer_repositories_nodes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReadRepositoriesData_viewer_repositories_nodes.serializer,
        json,
      );
}
