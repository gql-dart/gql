// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_star.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddStarData> _$gAddStarDataSerializer =
    new _$GAddStarDataSerializer();
Serializer<GAddStarData_action> _$gAddStarDataActionSerializer =
    new _$GAddStarData_actionSerializer();
Serializer<GAddStarData_action_starrable>
    _$gAddStarDataActionStarrableSerializer =
    new _$GAddStarData_action_starrableSerializer();

class _$GAddStarDataSerializer implements StructuredSerializer<GAddStarData> {
  @override
  final Iterable<Type> types = const [GAddStarData, _$GAddStarData];
  @override
  final String wireName = 'GAddStarData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAddStarData object,
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
            specifiedType: const FullType(GAddStarData_action)));
    }
    return result;
  }

  @override
  GAddStarData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddStarDataBuilder();

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
                  specifiedType: const FullType(GAddStarData_action))!
              as GAddStarData_action);
          break;
      }
    }

    return result.build();
  }
}

class _$GAddStarData_actionSerializer
    implements StructuredSerializer<GAddStarData_action> {
  @override
  final Iterable<Type> types = const [
    GAddStarData_action,
    _$GAddStarData_action
  ];
  @override
  final String wireName = 'GAddStarData_action';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAddStarData_action object,
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
            specifiedType: const FullType(GAddStarData_action_starrable)));
    }
    return result;
  }

  @override
  GAddStarData_action deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddStarData_actionBuilder();

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
                  specifiedType: const FullType(GAddStarData_action_starrable))!
              as GAddStarData_action_starrable);
          break;
      }
    }

    return result.build();
  }
}

class _$GAddStarData_action_starrableSerializer
    implements StructuredSerializer<GAddStarData_action_starrable> {
  @override
  final Iterable<Type> types = const [
    GAddStarData_action_starrable,
    _$GAddStarData_action_starrable
  ];
  @override
  final String wireName = 'GAddStarData_action_starrable';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GAddStarData_action_starrable object,
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
  GAddStarData_action_starrable deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddStarData_action_starrableBuilder();

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

class _$GAddStarData extends GAddStarData {
  @override
  final String G__typename;
  @override
  final GAddStarData_action? action;

  factory _$GAddStarData([void Function(GAddStarDataBuilder)? updates]) =>
      (new GAddStarDataBuilder()..update(updates))._build();

  _$GAddStarData._({required this.G__typename, this.action}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAddStarData', 'G__typename');
  }

  @override
  GAddStarData rebuild(void Function(GAddStarDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddStarDataBuilder toBuilder() => new GAddStarDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddStarData &&
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
    return (newBuiltValueToStringHelper(r'GAddStarData')
          ..add('G__typename', G__typename)
          ..add('action', action))
        .toString();
  }
}

class GAddStarDataBuilder
    implements Builder<GAddStarData, GAddStarDataBuilder> {
  _$GAddStarData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GAddStarData_actionBuilder? _action;
  GAddStarData_actionBuilder get action =>
      _$this._action ??= new GAddStarData_actionBuilder();
  set action(GAddStarData_actionBuilder? action) => _$this._action = action;

  GAddStarDataBuilder() {
    GAddStarData._initializeBuilder(this);
  }

  GAddStarDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _action = $v.action?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddStarData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddStarData;
  }

  @override
  void update(void Function(GAddStarDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddStarData build() => _build();

  _$GAddStarData _build() {
    _$GAddStarData _$result;
    try {
      _$result = _$v ??
          new _$GAddStarData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAddStarData', 'G__typename'),
              action: _action?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'action';
        _action?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAddStarData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAddStarData_action extends GAddStarData_action {
  @override
  final String G__typename;
  @override
  final GAddStarData_action_starrable? starrable;

  factory _$GAddStarData_action(
          [void Function(GAddStarData_actionBuilder)? updates]) =>
      (new GAddStarData_actionBuilder()..update(updates))._build();

  _$GAddStarData_action._({required this.G__typename, this.starrable})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAddStarData_action', 'G__typename');
  }

  @override
  GAddStarData_action rebuild(
          void Function(GAddStarData_actionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddStarData_actionBuilder toBuilder() =>
      new GAddStarData_actionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddStarData_action &&
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
    return (newBuiltValueToStringHelper(r'GAddStarData_action')
          ..add('G__typename', G__typename)
          ..add('starrable', starrable))
        .toString();
  }
}

class GAddStarData_actionBuilder
    implements Builder<GAddStarData_action, GAddStarData_actionBuilder> {
  _$GAddStarData_action? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GAddStarData_action_starrableBuilder? _starrable;
  GAddStarData_action_starrableBuilder get starrable =>
      _$this._starrable ??= new GAddStarData_action_starrableBuilder();
  set starrable(GAddStarData_action_starrableBuilder? starrable) =>
      _$this._starrable = starrable;

  GAddStarData_actionBuilder() {
    GAddStarData_action._initializeBuilder(this);
  }

  GAddStarData_actionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _starrable = $v.starrable?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddStarData_action other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddStarData_action;
  }

  @override
  void update(void Function(GAddStarData_actionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddStarData_action build() => _build();

  _$GAddStarData_action _build() {
    _$GAddStarData_action _$result;
    try {
      _$result = _$v ??
          new _$GAddStarData_action._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GAddStarData_action', 'G__typename'),
              starrable: _starrable?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'starrable';
        _starrable?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAddStarData_action', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GAddStarData_action_starrable extends GAddStarData_action_starrable {
  @override
  final String G__typename;
  @override
  final bool viewerHasStarred;

  factory _$GAddStarData_action_starrable(
          [void Function(GAddStarData_action_starrableBuilder)? updates]) =>
      (new GAddStarData_action_starrableBuilder()..update(updates))._build();

  _$GAddStarData_action_starrable._(
      {required this.G__typename, required this.viewerHasStarred})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GAddStarData_action_starrable', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        viewerHasStarred, r'GAddStarData_action_starrable', 'viewerHasStarred');
  }

  @override
  GAddStarData_action_starrable rebuild(
          void Function(GAddStarData_action_starrableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddStarData_action_starrableBuilder toBuilder() =>
      new GAddStarData_action_starrableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddStarData_action_starrable &&
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
    return (newBuiltValueToStringHelper(r'GAddStarData_action_starrable')
          ..add('G__typename', G__typename)
          ..add('viewerHasStarred', viewerHasStarred))
        .toString();
  }
}

class GAddStarData_action_starrableBuilder
    implements
        Builder<GAddStarData_action_starrable,
            GAddStarData_action_starrableBuilder> {
  _$GAddStarData_action_starrable? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  bool? _viewerHasStarred;
  bool? get viewerHasStarred => _$this._viewerHasStarred;
  set viewerHasStarred(bool? viewerHasStarred) =>
      _$this._viewerHasStarred = viewerHasStarred;

  GAddStarData_action_starrableBuilder() {
    GAddStarData_action_starrable._initializeBuilder(this);
  }

  GAddStarData_action_starrableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _viewerHasStarred = $v.viewerHasStarred;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddStarData_action_starrable other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddStarData_action_starrable;
  }

  @override
  void update(void Function(GAddStarData_action_starrableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddStarData_action_starrable build() => _build();

  _$GAddStarData_action_starrable _build() {
    final _$result = _$v ??
        new _$GAddStarData_action_starrable._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GAddStarData_action_starrable', 'G__typename'),
            viewerHasStarred: BuiltValueNullFieldError.checkNotNull(
                viewerHasStarred,
                r'GAddStarData_action_starrable',
                'viewerHasStarred'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
