// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_with_args.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHumanWithArgsData> _$gHumanWithArgsDataSerializer =
    new _$GHumanWithArgsDataSerializer();
Serializer<GHumanWithArgsData_human> _$gHumanWithArgsDataHumanSerializer =
    new _$GHumanWithArgsData_humanSerializer();

class _$GHumanWithArgsDataSerializer
    implements StructuredSerializer<GHumanWithArgsData> {
  @override
  final Iterable<Type> types = const [GHumanWithArgsData, _$GHumanWithArgsData];
  @override
  final String wireName = 'GHumanWithArgsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHumanWithArgsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.human;
    if (value != null) {
      result
        ..add('human')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GHumanWithArgsData_human)));
    }
    return result;
  }

  @override
  GHumanWithArgsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanWithArgsDataBuilder();

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
        case 'human':
          result.human.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GHumanWithArgsData_human))!
              as GHumanWithArgsData_human);
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanWithArgsData_humanSerializer
    implements StructuredSerializer<GHumanWithArgsData_human> {
  @override
  final Iterable<Type> types = const [
    GHumanWithArgsData_human,
    _$GHumanWithArgsData_human
  ];
  @override
  final String wireName = 'GHumanWithArgsData_human';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHumanWithArgsData_human object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GHumanWithArgsData_human deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHumanWithArgsData_humanBuilder();

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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$GHumanWithArgsData extends GHumanWithArgsData {
  @override
  final String G__typename;
  @override
  final GHumanWithArgsData_human? human;

  factory _$GHumanWithArgsData(
          [void Function(GHumanWithArgsDataBuilder)? updates]) =>
      (new GHumanWithArgsDataBuilder()..update(updates))._build();

  _$GHumanWithArgsData._({required this.G__typename, this.human}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHumanWithArgsData', 'G__typename');
  }

  @override
  GHumanWithArgsData rebuild(
          void Function(GHumanWithArgsDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanWithArgsDataBuilder toBuilder() =>
      new GHumanWithArgsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanWithArgsData &&
        G__typename == other.G__typename &&
        human == other.human;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, human.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHumanWithArgsData')
          ..add('G__typename', G__typename)
          ..add('human', human))
        .toString();
  }
}

class GHumanWithArgsDataBuilder
    implements Builder<GHumanWithArgsData, GHumanWithArgsDataBuilder> {
  _$GHumanWithArgsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHumanWithArgsData_humanBuilder? _human;
  GHumanWithArgsData_humanBuilder get human =>
      _$this._human ??= new GHumanWithArgsData_humanBuilder();
  set human(GHumanWithArgsData_humanBuilder? human) => _$this._human = human;

  GHumanWithArgsDataBuilder() {
    GHumanWithArgsData._initializeBuilder(this);
  }

  GHumanWithArgsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _human = $v.human?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanWithArgsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanWithArgsData;
  }

  @override
  void update(void Function(GHumanWithArgsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanWithArgsData build() => _build();

  _$GHumanWithArgsData _build() {
    _$GHumanWithArgsData _$result;
    try {
      _$result = _$v ??
          new _$GHumanWithArgsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GHumanWithArgsData', 'G__typename'),
              human: _human?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'human';
        _human?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHumanWithArgsData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHumanWithArgsData_human extends GHumanWithArgsData_human {
  @override
  final String G__typename;
  @override
  final String name;
  @override
  final double? height;

  factory _$GHumanWithArgsData_human(
          [void Function(GHumanWithArgsData_humanBuilder)? updates]) =>
      (new GHumanWithArgsData_humanBuilder()..update(updates))._build();

  _$GHumanWithArgsData_human._(
      {required this.G__typename, required this.name, this.height})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHumanWithArgsData_human', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHumanWithArgsData_human', 'name');
  }

  @override
  GHumanWithArgsData_human rebuild(
          void Function(GHumanWithArgsData_humanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHumanWithArgsData_humanBuilder toBuilder() =>
      new GHumanWithArgsData_humanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHumanWithArgsData_human &&
        G__typename == other.G__typename &&
        name == other.name &&
        height == other.height;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHumanWithArgsData_human')
          ..add('G__typename', G__typename)
          ..add('name', name)
          ..add('height', height))
        .toString();
  }
}

class GHumanWithArgsData_humanBuilder
    implements
        Builder<GHumanWithArgsData_human, GHumanWithArgsData_humanBuilder> {
  _$GHumanWithArgsData_human? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _height;
  double? get height => _$this._height;
  set height(double? height) => _$this._height = height;

  GHumanWithArgsData_humanBuilder() {
    GHumanWithArgsData_human._initializeBuilder(this);
  }

  GHumanWithArgsData_humanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _height = $v.height;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHumanWithArgsData_human other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHumanWithArgsData_human;
  }

  @override
  void update(void Function(GHumanWithArgsData_humanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHumanWithArgsData_human build() => _build();

  _$GHumanWithArgsData_human _build() {
    final _$result = _$v ??
        new _$GHumanWithArgsData_human._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GHumanWithArgsData_human', 'G__typename'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHumanWithArgsData_human', 'name'),
            height: height);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
