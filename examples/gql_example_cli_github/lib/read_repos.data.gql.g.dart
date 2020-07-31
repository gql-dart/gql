// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_repos.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReadRepositoriesData> _$gReadRepositoriesDataSerializer =
    new _$GReadRepositoriesDataSerializer();
Serializer<GReadRepositoriesData_viewer>
    _$gReadRepositoriesDataViewerSerializer =
    new _$GReadRepositoriesData_viewerSerializer();
Serializer<GReadRepositoriesData_viewer_repositories>
    _$gReadRepositoriesDataViewerRepositoriesSerializer =
    new _$GReadRepositoriesData_viewer_repositoriesSerializer();
Serializer<GReadRepositoriesData_viewer_repositories_nodes>
    _$gReadRepositoriesDataViewerRepositoriesNodesSerializer =
    new _$GReadRepositoriesData_viewer_repositories_nodesSerializer();

class _$GReadRepositoriesDataSerializer
    implements StructuredSerializer<GReadRepositoriesData> {
  @override
  final Iterable<Type> types = const [
    GReadRepositoriesData,
    _$GReadRepositoriesData
  ];
  @override
  final String wireName = 'GReadRepositoriesData';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GReadRepositoriesData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'viewer',
      serializers.serialize(object.viewer,
          specifiedType: const FullType(GReadRepositoriesData_viewer)),
    ];

    return result;
  }

  @override
  GReadRepositoriesData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReadRepositoriesDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'viewer':
          result.viewer.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GReadRepositoriesData_viewer))
              as GReadRepositoriesData_viewer);
          break;
      }
    }

    return result.build();
  }
}

class _$GReadRepositoriesData_viewerSerializer
    implements StructuredSerializer<GReadRepositoriesData_viewer> {
  @override
  final Iterable<Type> types = const [
    GReadRepositoriesData_viewer,
    _$GReadRepositoriesData_viewer
  ];
  @override
  final String wireName = 'GReadRepositoriesData_viewer';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GReadRepositoriesData_viewer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'repositories',
      serializers.serialize(object.repositories,
          specifiedType:
              const FullType(GReadRepositoriesData_viewer_repositories)),
    ];

    return result;
  }

  @override
  GReadRepositoriesData_viewer deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReadRepositoriesData_viewerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'repositories':
          result.repositories.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GReadRepositoriesData_viewer_repositories))
              as GReadRepositoriesData_viewer_repositories);
          break;
      }
    }

    return result.build();
  }
}

class _$GReadRepositoriesData_viewer_repositoriesSerializer
    implements StructuredSerializer<GReadRepositoriesData_viewer_repositories> {
  @override
  final Iterable<Type> types = const [
    GReadRepositoriesData_viewer_repositories,
    _$GReadRepositoriesData_viewer_repositories
  ];
  @override
  final String wireName = 'GReadRepositoriesData_viewer_repositories';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GReadRepositoriesData_viewer_repositories object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.nodes != null) {
      result
        ..add('nodes')
        ..add(serializers.serialize(object.nodes,
            specifiedType: const FullType(BuiltList, const [
              const FullType(GReadRepositoriesData_viewer_repositories_nodes)
            ])));
    }
    return result;
  }

  @override
  GReadRepositoriesData_viewer_repositories deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReadRepositoriesData_viewer_repositoriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nodes':
          result.nodes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GReadRepositoriesData_viewer_repositories_nodes)
              ])) as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GReadRepositoriesData_viewer_repositories_nodesSerializer
    implements
        StructuredSerializer<GReadRepositoriesData_viewer_repositories_nodes> {
  @override
  final Iterable<Type> types = const [
    GReadRepositoriesData_viewer_repositories_nodes,
    _$GReadRepositoriesData_viewer_repositories_nodes
  ];
  @override
  final String wireName = 'GReadRepositoriesData_viewer_repositories_nodes';

  @override
  Iterable<Object> serialize(Serializers serializers,
      GReadRepositoriesData_viewer_repositories_nodes object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'viewerHasStarred',
      serializers.serialize(object.viewerHasStarred,
          specifiedType: const FullType(bool)),
      'createdAt',
      serializers.serialize(object.createdAt,
          specifiedType: const FullType(_i2.GDateTime)),
    ];

    return result;
  }

  @override
  GReadRepositoriesData_viewer_repositories_nodes deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReadRepositoriesData_viewer_repositories_nodesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'viewerHasStarred':
          result.viewerHasStarred = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'createdAt':
          result.createdAt.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GDateTime)) as _i2.GDateTime);
          break;
      }
    }

    return result.build();
  }
}

class _$GReadRepositoriesData extends GReadRepositoriesData {
  @override
  final GReadRepositoriesData_viewer viewer;

  factory _$GReadRepositoriesData(
          [void Function(GReadRepositoriesDataBuilder) updates]) =>
      (new GReadRepositoriesDataBuilder()..update(updates)).build();

  _$GReadRepositoriesData._({this.viewer}) : super._() {
    if (viewer == null) {
      throw new BuiltValueNullFieldError('GReadRepositoriesData', 'viewer');
    }
  }

  @override
  GReadRepositoriesData rebuild(
          void Function(GReadRepositoriesDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReadRepositoriesDataBuilder toBuilder() =>
      new GReadRepositoriesDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadRepositoriesData && viewer == other.viewer;
  }

  @override
  int get hashCode {
    return $jf($jc(0, viewer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GReadRepositoriesData')
          ..add('viewer', viewer))
        .toString();
  }
}

class GReadRepositoriesDataBuilder
    implements Builder<GReadRepositoriesData, GReadRepositoriesDataBuilder> {
  _$GReadRepositoriesData _$v;

  GReadRepositoriesData_viewerBuilder _viewer;
  GReadRepositoriesData_viewerBuilder get viewer =>
      _$this._viewer ??= new GReadRepositoriesData_viewerBuilder();
  set viewer(GReadRepositoriesData_viewerBuilder viewer) =>
      _$this._viewer = viewer;

  GReadRepositoriesDataBuilder();

  GReadRepositoriesDataBuilder get _$this {
    if (_$v != null) {
      _viewer = _$v.viewer?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadRepositoriesData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GReadRepositoriesData;
  }

  @override
  void update(void Function(GReadRepositoriesDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReadRepositoriesData build() {
    _$GReadRepositoriesData _$result;
    try {
      _$result = _$v ?? new _$GReadRepositoriesData._(viewer: viewer.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'viewer';
        viewer.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GReadRepositoriesData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GReadRepositoriesData_viewer extends GReadRepositoriesData_viewer {
  @override
  final String G__typename;
  @override
  final GReadRepositoriesData_viewer_repositories repositories;

  factory _$GReadRepositoriesData_viewer(
          [void Function(GReadRepositoriesData_viewerBuilder) updates]) =>
      (new GReadRepositoriesData_viewerBuilder()..update(updates)).build();

  _$GReadRepositoriesData_viewer._({this.G__typename, this.repositories})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GReadRepositoriesData_viewer', 'G__typename');
    }
    if (repositories == null) {
      throw new BuiltValueNullFieldError(
          'GReadRepositoriesData_viewer', 'repositories');
    }
  }

  @override
  GReadRepositoriesData_viewer rebuild(
          void Function(GReadRepositoriesData_viewerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReadRepositoriesData_viewerBuilder toBuilder() =>
      new GReadRepositoriesData_viewerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadRepositoriesData_viewer &&
        G__typename == other.G__typename &&
        repositories == other.repositories;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), repositories.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GReadRepositoriesData_viewer')
          ..add('G__typename', G__typename)
          ..add('repositories', repositories))
        .toString();
  }
}

class GReadRepositoriesData_viewerBuilder
    implements
        Builder<GReadRepositoriesData_viewer,
            GReadRepositoriesData_viewerBuilder> {
  _$GReadRepositoriesData_viewer _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  GReadRepositoriesData_viewer_repositoriesBuilder _repositories;
  GReadRepositoriesData_viewer_repositoriesBuilder get repositories =>
      _$this._repositories ??=
          new GReadRepositoriesData_viewer_repositoriesBuilder();
  set repositories(
          GReadRepositoriesData_viewer_repositoriesBuilder repositories) =>
      _$this._repositories = repositories;

  GReadRepositoriesData_viewerBuilder() {
    GReadRepositoriesData_viewer._initializeBuilder(this);
  }

  GReadRepositoriesData_viewerBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _repositories = _$v.repositories?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadRepositoriesData_viewer other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GReadRepositoriesData_viewer;
  }

  @override
  void update(void Function(GReadRepositoriesData_viewerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReadRepositoriesData_viewer build() {
    _$GReadRepositoriesData_viewer _$result;
    try {
      _$result = _$v ??
          new _$GReadRepositoriesData_viewer._(
              G__typename: G__typename, repositories: repositories.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'repositories';
        repositories.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GReadRepositoriesData_viewer', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GReadRepositoriesData_viewer_repositories
    extends GReadRepositoriesData_viewer_repositories {
  @override
  final String G__typename;
  @override
  final BuiltList<GReadRepositoriesData_viewer_repositories_nodes> nodes;

  factory _$GReadRepositoriesData_viewer_repositories(
          [void Function(GReadRepositoriesData_viewer_repositoriesBuilder)
              updates]) =>
      (new GReadRepositoriesData_viewer_repositoriesBuilder()..update(updates))
          .build();

  _$GReadRepositoriesData_viewer_repositories._({this.G__typename, this.nodes})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GReadRepositoriesData_viewer_repositories', 'G__typename');
    }
  }

  @override
  GReadRepositoriesData_viewer_repositories rebuild(
          void Function(GReadRepositoriesData_viewer_repositoriesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReadRepositoriesData_viewer_repositoriesBuilder toBuilder() =>
      new GReadRepositoriesData_viewer_repositoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadRepositoriesData_viewer_repositories &&
        G__typename == other.G__typename &&
        nodes == other.nodes;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), nodes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GReadRepositoriesData_viewer_repositories')
          ..add('G__typename', G__typename)
          ..add('nodes', nodes))
        .toString();
  }
}

class GReadRepositoriesData_viewer_repositoriesBuilder
    implements
        Builder<GReadRepositoriesData_viewer_repositories,
            GReadRepositoriesData_viewer_repositoriesBuilder> {
  _$GReadRepositoriesData_viewer_repositories _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GReadRepositoriesData_viewer_repositories_nodes> _nodes;
  ListBuilder<GReadRepositoriesData_viewer_repositories_nodes> get nodes =>
      _$this._nodes ??=
          new ListBuilder<GReadRepositoriesData_viewer_repositories_nodes>();
  set nodes(
          ListBuilder<GReadRepositoriesData_viewer_repositories_nodes> nodes) =>
      _$this._nodes = nodes;

  GReadRepositoriesData_viewer_repositoriesBuilder() {
    GReadRepositoriesData_viewer_repositories._initializeBuilder(this);
  }

  GReadRepositoriesData_viewer_repositoriesBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _nodes = _$v.nodes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadRepositoriesData_viewer_repositories other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GReadRepositoriesData_viewer_repositories;
  }

  @override
  void update(
      void Function(GReadRepositoriesData_viewer_repositoriesBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReadRepositoriesData_viewer_repositories build() {
    _$GReadRepositoriesData_viewer_repositories _$result;
    try {
      _$result = _$v ??
          new _$GReadRepositoriesData_viewer_repositories._(
              G__typename: G__typename, nodes: _nodes?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'nodes';
        _nodes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GReadRepositoriesData_viewer_repositories',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GReadRepositoriesData_viewer_repositories_nodes
    extends GReadRepositoriesData_viewer_repositories_nodes {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final bool viewerHasStarred;
  @override
  final _i2.GDateTime createdAt;

  factory _$GReadRepositoriesData_viewer_repositories_nodes(
          [void Function(GReadRepositoriesData_viewer_repositories_nodesBuilder)
              updates]) =>
      (new GReadRepositoriesData_viewer_repositories_nodesBuilder()
            ..update(updates))
          .build();

  _$GReadRepositoriesData_viewer_repositories_nodes._(
      {this.G__typename,
      this.id,
      this.name,
      this.viewerHasStarred,
      this.createdAt})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GReadRepositoriesData_viewer_repositories_nodes', 'G__typename');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError(
          'GReadRepositoriesData_viewer_repositories_nodes', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError(
          'GReadRepositoriesData_viewer_repositories_nodes', 'name');
    }
    if (viewerHasStarred == null) {
      throw new BuiltValueNullFieldError(
          'GReadRepositoriesData_viewer_repositories_nodes',
          'viewerHasStarred');
    }
    if (createdAt == null) {
      throw new BuiltValueNullFieldError(
          'GReadRepositoriesData_viewer_repositories_nodes', 'createdAt');
    }
  }

  @override
  GReadRepositoriesData_viewer_repositories_nodes rebuild(
          void Function(GReadRepositoriesData_viewer_repositories_nodesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReadRepositoriesData_viewer_repositories_nodesBuilder toBuilder() =>
      new GReadRepositoriesData_viewer_repositories_nodesBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadRepositoriesData_viewer_repositories_nodes &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        viewerHasStarred == other.viewerHasStarred &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
            viewerHasStarred.hashCode),
        createdAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            'GReadRepositoriesData_viewer_repositories_nodes')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('viewerHasStarred', viewerHasStarred)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class GReadRepositoriesData_viewer_repositories_nodesBuilder
    implements
        Builder<GReadRepositoriesData_viewer_repositories_nodes,
            GReadRepositoriesData_viewer_repositories_nodesBuilder> {
  _$GReadRepositoriesData_viewer_repositories_nodes _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _viewerHasStarred;
  bool get viewerHasStarred => _$this._viewerHasStarred;
  set viewerHasStarred(bool viewerHasStarred) =>
      _$this._viewerHasStarred = viewerHasStarred;

  _i2.GDateTimeBuilder _createdAt;
  _i2.GDateTimeBuilder get createdAt =>
      _$this._createdAt ??= new _i2.GDateTimeBuilder();
  set createdAt(_i2.GDateTimeBuilder createdAt) =>
      _$this._createdAt = createdAt;

  GReadRepositoriesData_viewer_repositories_nodesBuilder() {
    GReadRepositoriesData_viewer_repositories_nodes._initializeBuilder(this);
  }

  GReadRepositoriesData_viewer_repositories_nodesBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _id = _$v.id;
      _name = _$v.name;
      _viewerHasStarred = _$v.viewerHasStarred;
      _createdAt = _$v.createdAt?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadRepositoriesData_viewer_repositories_nodes other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GReadRepositoriesData_viewer_repositories_nodes;
  }

  @override
  void update(
      void Function(GReadRepositoriesData_viewer_repositories_nodesBuilder)
          updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReadRepositoriesData_viewer_repositories_nodes build() {
    _$GReadRepositoriesData_viewer_repositories_nodes _$result;
    try {
      _$result = _$v ??
          new _$GReadRepositoriesData_viewer_repositories_nodes._(
              G__typename: G__typename,
              id: id,
              name: name,
              viewerHasStarred: viewerHasStarred,
              createdAt: createdAt.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'createdAt';
        createdAt.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GReadRepositoriesData_viewer_repositories_nodes',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
