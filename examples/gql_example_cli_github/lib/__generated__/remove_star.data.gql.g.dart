// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_star.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GRemoveStarData> _$gRemoveStarDataSerializer =
    new _$GRemoveStarDataSerializer();
Serializer<GRemoveStarData_action> _$gRemoveStarDataActionSerializer =
    new _$GRemoveStarData_actionSerializer();
Serializer<GRemoveStarData_action_starrable>
    _$gRemoveStarDataActionStarrableSerializer =
    new _$GRemoveStarData_action_starrableSerializer();

class _$GRemoveStarDataSerializer
    implements StructuredSerializer<GRemoveStarData> {
  @override
  final Iterable<Type> types = const [GRemoveStarData, _$GRemoveStarData];
  @override
  final String wireName = 'GRemoveStarData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GRemoveStarData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.action;
    if (value != null) {
      result
        ..add('action')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GRemoveStarData_action)));
    }
    return result;
  }

  @override
  GRemoveStarData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRemoveStarDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'action':
          result.action.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GRemoveStarData_action))!
              as GRemoveStarData_action);
          break;
      }
    }

    return result.build();
  }
}

class _$GRemoveStarData_actionSerializer
    implements StructuredSerializer<GRemoveStarData_action> {
  @override
  final Iterable<Type> types = const [
    GRemoveStarData_action,
    _$GRemoveStarData_action
  ];
  @override
  final String wireName = 'GRemoveStarData_action';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GRemoveStarData_action object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.starrable;
    if (value != null) {
      result
        ..add('starrable')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GRemoveStarData_action_starrable)));
    }
    return result;
  }

  @override
  GRemoveStarData_action deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRemoveStarData_actionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'starrable':
          result.starrable.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GRemoveStarData_action_starrable))!
              as GRemoveStarData_action_starrable);
          break;
      }
    }

    return result.build();
  }
}

class _$GRemoveStarData_action_starrableSerializer
    implements StructuredSerializer<GRemoveStarData_action_starrable> {
  @override
  final Iterable<Type> types = const [
    GRemoveStarData_action_starrable,
    _$GRemoveStarData_action_starrable
  ];
  @override
  final String wireName = 'GRemoveStarData_action_starrable';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GRemoveStarData_action_starrable object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'viewerHasStarred',
      serializers.serialize(object.viewerHasStarred,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GRemoveStarData_action_starrable deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRemoveStarData_action_starrableBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'viewerHasStarred':
          result.viewerHasStarred = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GRemoveStarData extends GRemoveStarData {
  @override
  final String G__typename;
  @override
  final GRemoveStarData_action? action;

  factory _$GRemoveStarData([void Function(GRemoveStarDataBuilder)? updates]) =>
      (new GRemoveStarDataBuilder()..update(updates))._build();

  _$GRemoveStarData._({required this.G__typename, this.action}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GRemoveStarData', 'G__typename');
  }

  @override
  GRemoveStarData rebuild(void Function(GRemoveStarDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRemoveStarDataBuilder toBuilder() =>
      new GRemoveStarDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRemoveStarData &&
        G__typename == other.G__typename &&
        action == other.action;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, action.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GRemoveStarData')
          ..add('G__typename', G__typename)
          ..add('action', action))
        .toString();
  }
}

class GRemoveStarDataBuilder
    implements Builder<GRemoveStarData, GRemoveStarDataBuilder> {
  _$GRemoveStarData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GRemoveStarData_actionBuilder? _action;
  GRemoveStarData_actionBuilder get action =>
      _$this._action ??= new GRemoveStarData_actionBuilder();
  set action(GRemoveStarData_actionBuilder? action) => _$this._action = action;

  GRemoveStarDataBuilder() {
    GRemoveStarData._initializeBuilder(this);
  }

  GRemoveStarDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _action = $v.action?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRemoveStarData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRemoveStarData;
  }

  @override
  void update(void Function(GRemoveStarDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRemoveStarData build() => _build();

  _$GRemoveStarData _build() {
    _$GRemoveStarData _$result;
    try {
      _$result = _$v ??
          new _$GRemoveStarData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GRemoveStarData', 'G__typename'),
              action: _action?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'action';
        _action?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GRemoveStarData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GRemoveStarData_action extends GRemoveStarData_action {
  @override
  final String G__typename;
  @override
  final GRemoveStarData_action_starrable? starrable;

  factory _$GRemoveStarData_action(
          [void Function(GRemoveStarData_actionBuilder)? updates]) =>
      (new GRemoveStarData_actionBuilder()..update(updates))._build();

  _$GRemoveStarData_action._({required this.G__typename, this.starrable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GRemoveStarData_action', 'G__typename');
  }

  @override
  GRemoveStarData_action rebuild(
          void Function(GRemoveStarData_actionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRemoveStarData_actionBuilder toBuilder() =>
      new GRemoveStarData_actionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRemoveStarData_action &&
        G__typename == other.G__typename &&
        starrable == other.starrable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, starrable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GRemoveStarData_action')
          ..add('G__typename', G__typename)
          ..add('starrable', starrable))
        .toString();
  }
}

class GRemoveStarData_actionBuilder
    implements Builder<GRemoveStarData_action, GRemoveStarData_actionBuilder> {
  _$GRemoveStarData_action? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GRemoveStarData_action_starrableBuilder? _starrable;
  GRemoveStarData_action_starrableBuilder get starrable =>
      _$this._starrable ??= new GRemoveStarData_action_starrableBuilder();
  set starrable(GRemoveStarData_action_starrableBuilder? starrable) =>
      _$this._starrable = starrable;

  GRemoveStarData_actionBuilder() {
    GRemoveStarData_action._initializeBuilder(this);
  }

  GRemoveStarData_actionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _starrable = $v.starrable?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRemoveStarData_action other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRemoveStarData_action;
  }

  @override
  void update(void Function(GRemoveStarData_actionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRemoveStarData_action build() => _build();

  _$GRemoveStarData_action _build() {
    _$GRemoveStarData_action _$result;
    try {
      _$result = _$v ??
          new _$GRemoveStarData_action._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GRemoveStarData_action', 'G__typename'),
              starrable: _starrable?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'starrable';
        _starrable?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GRemoveStarData_action', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GRemoveStarData_action_starrable
    extends GRemoveStarData_action_starrable {
  @override
  final String G__typename;
  @override
  final bool viewerHasStarred;

  factory _$GRemoveStarData_action_starrable(
          [void Function(GRemoveStarData_action_starrableBuilder)? updates]) =>
      (new GRemoveStarData_action_starrableBuilder()..update(updates))._build();

  _$GRemoveStarData_action_starrable._(
      {required this.G__typename, required this.viewerHasStarred})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GRemoveStarData_action_starrable', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(viewerHasStarred,
        r'GRemoveStarData_action_starrable', 'viewerHasStarred');
  }

  @override
  GRemoveStarData_action_starrable rebuild(
          void Function(GRemoveStarData_action_starrableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRemoveStarData_action_starrableBuilder toBuilder() =>
      new GRemoveStarData_action_starrableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRemoveStarData_action_starrable &&
        G__typename == other.G__typename &&
        viewerHasStarred == other.viewerHasStarred;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, viewerHasStarred.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GRemoveStarData_action_starrable')
          ..add('G__typename', G__typename)
          ..add('viewerHasStarred', viewerHasStarred))
        .toString();
  }
}

class GRemoveStarData_action_starrableBuilder
    implements
        Builder<GRemoveStarData_action_starrable,
            GRemoveStarData_action_starrableBuilder> {
  _$GRemoveStarData_action_starrable? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _viewerHasStarred;
  bool? get viewerHasStarred => _$this._viewerHasStarred;
  set viewerHasStarred(bool? viewerHasStarred) =>
      _$this._viewerHasStarred = viewerHasStarred;

  GRemoveStarData_action_starrableBuilder() {
    GRemoveStarData_action_starrable._initializeBuilder(this);
  }

  GRemoveStarData_action_starrableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewerHasStarred = $v.viewerHasStarred;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRemoveStarData_action_starrable other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRemoveStarData_action_starrable;
  }

  @override
  void update(void Function(GRemoveStarData_action_starrableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRemoveStarData_action_starrable build() => _build();

  _$GRemoveStarData_action_starrable _build() {
    final _$result = _$v ??
        new _$GRemoveStarData_action_starrable._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GRemoveStarData_action_starrable', 'G__typename'),
            viewerHasStarred: BuiltValueNullFieldError.checkNotNull(
                viewerHasStarred,
                r'GRemoveStarData_action_starrable',
                'viewerHasStarred'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
