// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_interface_subtyped_fragments.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithInterfaceSubTypedFragmentsData>
    _$gHeroWithInterfaceSubTypedFragmentsDataSerializer =
    new _$GHeroWithInterfaceSubTypedFragmentsDataSerializer();
Serializer<GHeroWithInterfaceSubTypedFragmentsData_hero>
    _$gHeroWithInterfaceSubTypedFragmentsDataHeroSerializer =
    new _$GHeroWithInterfaceSubTypedFragmentsData_heroSerializer();
Serializer<GheroFieldsFragmentData__base>
    _$gheroFieldsFragmentDataBaseSerializer =
    new _$GheroFieldsFragmentData__baseSerializer();
Serializer<GheroFieldsFragmentData__asHuman>
    _$gheroFieldsFragmentDataAsHumanSerializer =
    new _$GheroFieldsFragmentData__asHumanSerializer();
Serializer<GheroFieldsFragmentData__asDroid>
    _$gheroFieldsFragmentDataAsDroidSerializer =
    new _$GheroFieldsFragmentData__asDroidSerializer();
Serializer<GhumanFieldsFragmentData> _$ghumanFieldsFragmentDataSerializer =
    new _$GhumanFieldsFragmentDataSerializer();

class _$GHeroWithInterfaceSubTypedFragmentsDataSerializer
    implements StructuredSerializer<GHeroWithInterfaceSubTypedFragmentsData> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragmentsData,
    _$GHeroWithInterfaceSubTypedFragmentsData
  ];
  @override
  final String wireName = 'GHeroWithInterfaceSubTypedFragmentsData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithInterfaceSubTypedFragmentsData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.hero;
    if (value != null) {
      result
        ..add('hero')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GHeroWithInterfaceSubTypedFragmentsData_hero)));
    }
    return result;
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithInterfaceSubTypedFragmentsDataBuilder();

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
        case 'hero':
          result.hero.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GHeroWithInterfaceSubTypedFragmentsData_hero))!
              as GHeroWithInterfaceSubTypedFragmentsData_hero);
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_heroSerializer
    implements
        StructuredSerializer<GHeroWithInterfaceSubTypedFragmentsData_hero> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInterfaceSubTypedFragmentsData_hero,
    _$GHeroWithInterfaceSubTypedFragmentsData_hero
  ];
  @override
  final String wireName = 'GHeroWithInterfaceSubTypedFragmentsData_hero';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GHeroWithInterfaceSubTypedFragmentsData_hero object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithInterfaceSubTypedFragmentsData_heroBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroFieldsFragmentData__baseSerializer
    implements StructuredSerializer<GheroFieldsFragmentData__base> {
  @override
  final Iterable<Type> types = const [
    GheroFieldsFragmentData__base,
    _$GheroFieldsFragmentData__base
  ];
  @override
  final String wireName = 'GheroFieldsFragmentData__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GheroFieldsFragmentData__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GheroFieldsFragmentData__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroFieldsFragmentData__baseBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroFieldsFragmentData__asHumanSerializer
    implements StructuredSerializer<GheroFieldsFragmentData__asHuman> {
  @override
  final Iterable<Type> types = const [
    GheroFieldsFragmentData__asHuman,
    _$GheroFieldsFragmentData__asHuman
  ];
  @override
  final String wireName = 'GheroFieldsFragmentData__asHuman';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GheroFieldsFragmentData__asHuman object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'birthday',
      serializers.serialize(object.birthday,
          specifiedType: const FullType(DateTime)),
    ];
    Object? value;
    value = object.homePlanet;
    if (value != null) {
      result
        ..add('homePlanet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GheroFieldsFragmentData__asHuman deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroFieldsFragmentData__asHumanBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'homePlanet':
          result.homePlanet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$GheroFieldsFragmentData__asDroidSerializer
    implements StructuredSerializer<GheroFieldsFragmentData__asDroid> {
  @override
  final Iterable<Type> types = const [
    GheroFieldsFragmentData__asDroid,
    _$GheroFieldsFragmentData__asDroid
  ];
  @override
  final String wireName = 'GheroFieldsFragmentData__asDroid';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GheroFieldsFragmentData__asDroid object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.primaryFunction;
    if (value != null) {
      result
        ..add('primaryFunction')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GheroFieldsFragmentData__asDroid deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GheroFieldsFragmentData__asDroidBuilder();

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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'primaryFunction':
          result.primaryFunction = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GhumanFieldsFragmentDataSerializer
    implements StructuredSerializer<GhumanFieldsFragmentData> {
  @override
  final Iterable<Type> types = const [
    GhumanFieldsFragmentData,
    _$GhumanFieldsFragmentData
  ];
  @override
  final String wireName = 'GhumanFieldsFragmentData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GhumanFieldsFragmentData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'birthday',
      serializers.serialize(object.birthday,
          specifiedType: const FullType(DateTime)),
    ];
    Object? value;
    value = object.homePlanet;
    if (value != null) {
      result
        ..add('homePlanet')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GhumanFieldsFragmentData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GhumanFieldsFragmentDataBuilder();

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
        case 'homePlanet':
          result.homePlanet = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData
    extends GHeroWithInterfaceSubTypedFragmentsData {
  @override
  final String G__typename;
  @override
  final GHeroWithInterfaceSubTypedFragmentsData_hero? hero;

  factory _$GHeroWithInterfaceSubTypedFragmentsData(
          [void Function(GHeroWithInterfaceSubTypedFragmentsDataBuilder)?
              updates]) =>
      (new GHeroWithInterfaceSubTypedFragmentsDataBuilder()..update(updates))
          ._build();

  _$GHeroWithInterfaceSubTypedFragmentsData._(
      {required this.G__typename, this.hero})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GHeroWithInterfaceSubTypedFragmentsData', 'G__typename');
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData rebuild(
          void Function(GHeroWithInterfaceSubTypedFragmentsDataBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceSubTypedFragmentsDataBuilder toBuilder() =>
      new GHeroWithInterfaceSubTypedFragmentsDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceSubTypedFragmentsData &&
        G__typename == other.G__typename &&
        hero == other.hero;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), hero.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInterfaceSubTypedFragmentsData')
          ..add('G__typename', G__typename)
          ..add('hero', hero))
        .toString();
  }
}

class GHeroWithInterfaceSubTypedFragmentsDataBuilder
    implements
        Builder<GHeroWithInterfaceSubTypedFragmentsData,
            GHeroWithInterfaceSubTypedFragmentsDataBuilder> {
  _$GHeroWithInterfaceSubTypedFragmentsData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GHeroWithInterfaceSubTypedFragmentsData_heroBuilder? _hero;
  GHeroWithInterfaceSubTypedFragmentsData_heroBuilder get hero =>
      _$this._hero ??=
          new GHeroWithInterfaceSubTypedFragmentsData_heroBuilder();
  set hero(GHeroWithInterfaceSubTypedFragmentsData_heroBuilder? hero) =>
      _$this._hero = hero;

  GHeroWithInterfaceSubTypedFragmentsDataBuilder() {
    GHeroWithInterfaceSubTypedFragmentsData._initializeBuilder(this);
  }

  GHeroWithInterfaceSubTypedFragmentsDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _hero = $v.hero?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInterfaceSubTypedFragmentsData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceSubTypedFragmentsData;
  }

  @override
  void update(
      void Function(GHeroWithInterfaceSubTypedFragmentsDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData build() => _build();

  _$GHeroWithInterfaceSubTypedFragmentsData _build() {
    _$GHeroWithInterfaceSubTypedFragmentsData _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithInterfaceSubTypedFragmentsData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GHeroWithInterfaceSubTypedFragmentsData', 'G__typename'),
              hero: _hero?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hero';
        _hero?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithInterfaceSubTypedFragmentsData',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GHeroWithInterfaceSubTypedFragmentsData_hero
    extends GHeroWithInterfaceSubTypedFragmentsData_hero {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GHeroWithInterfaceSubTypedFragmentsData_hero(
          [void Function(GHeroWithInterfaceSubTypedFragmentsData_heroBuilder)?
              updates]) =>
      (new GHeroWithInterfaceSubTypedFragmentsData_heroBuilder()
            ..update(updates))
          ._build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GHeroWithInterfaceSubTypedFragmentsData_hero', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GHeroWithInterfaceSubTypedFragmentsData_hero', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GHeroWithInterfaceSubTypedFragmentsData_hero', 'name');
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero rebuild(
          void Function(GHeroWithInterfaceSubTypedFragmentsData_heroBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInterfaceSubTypedFragmentsData_heroBuilder toBuilder() =>
      new GHeroWithInterfaceSubTypedFragmentsData_heroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInterfaceSubTypedFragmentsData_hero &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GHeroWithInterfaceSubTypedFragmentsData_hero')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GHeroWithInterfaceSubTypedFragmentsData_heroBuilder
    implements
        Builder<GHeroWithInterfaceSubTypedFragmentsData_hero,
            GHeroWithInterfaceSubTypedFragmentsData_heroBuilder> {
  _$GHeroWithInterfaceSubTypedFragmentsData_hero? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GHeroWithInterfaceSubTypedFragmentsData_heroBuilder() {
    GHeroWithInterfaceSubTypedFragmentsData_hero._initializeBuilder(this);
  }

  GHeroWithInterfaceSubTypedFragmentsData_heroBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInterfaceSubTypedFragmentsData_hero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInterfaceSubTypedFragmentsData_hero;
  }

  @override
  void update(
      void Function(GHeroWithInterfaceSubTypedFragmentsData_heroBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInterfaceSubTypedFragmentsData_hero build() => _build();

  _$GHeroWithInterfaceSubTypedFragmentsData_hero _build() {
    final _$result = _$v ??
        new _$GHeroWithInterfaceSubTypedFragmentsData_hero._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GHeroWithInterfaceSubTypedFragmentsData_hero', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GHeroWithInterfaceSubTypedFragmentsData_hero', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GHeroWithInterfaceSubTypedFragmentsData_hero', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GheroFieldsFragmentData__base extends GheroFieldsFragmentData__base {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;

  factory _$GheroFieldsFragmentData__base(
          [void Function(GheroFieldsFragmentData__baseBuilder)? updates]) =>
      (new GheroFieldsFragmentData__baseBuilder()..update(updates))._build();

  _$GheroFieldsFragmentData__base._(
      {required this.G__typename, required this.id, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GheroFieldsFragmentData__base', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GheroFieldsFragmentData__base', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GheroFieldsFragmentData__base', 'name');
  }

  @override
  GheroFieldsFragmentData__base rebuild(
          void Function(GheroFieldsFragmentData__baseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroFieldsFragmentData__baseBuilder toBuilder() =>
      new GheroFieldsFragmentData__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroFieldsFragmentData__base &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GheroFieldsFragmentData__base')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GheroFieldsFragmentData__baseBuilder
    implements
        Builder<GheroFieldsFragmentData__base,
            GheroFieldsFragmentData__baseBuilder> {
  _$GheroFieldsFragmentData__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GheroFieldsFragmentData__baseBuilder() {
    GheroFieldsFragmentData__base._initializeBuilder(this);
  }

  GheroFieldsFragmentData__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroFieldsFragmentData__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroFieldsFragmentData__base;
  }

  @override
  void update(void Function(GheroFieldsFragmentData__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroFieldsFragmentData__base build() => _build();

  _$GheroFieldsFragmentData__base _build() {
    final _$result = _$v ??
        new _$GheroFieldsFragmentData__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GheroFieldsFragmentData__base', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GheroFieldsFragmentData__base', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GheroFieldsFragmentData__base', 'name'));
    replace(_$result);
    return _$result;
  }
}

class _$GheroFieldsFragmentData__asHuman
    extends GheroFieldsFragmentData__asHuman {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? homePlanet;
  @override
  final DateTime birthday;

  factory _$GheroFieldsFragmentData__asHuman(
          [void Function(GheroFieldsFragmentData__asHumanBuilder)? updates]) =>
      (new GheroFieldsFragmentData__asHumanBuilder()..update(updates))._build();

  _$GheroFieldsFragmentData__asHuman._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.homePlanet,
      required this.birthday})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GheroFieldsFragmentData__asHuman', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GheroFieldsFragmentData__asHuman', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GheroFieldsFragmentData__asHuman', 'name');
    BuiltValueNullFieldError.checkNotNull(
        birthday, r'GheroFieldsFragmentData__asHuman', 'birthday');
  }

  @override
  GheroFieldsFragmentData__asHuman rebuild(
          void Function(GheroFieldsFragmentData__asHumanBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroFieldsFragmentData__asHumanBuilder toBuilder() =>
      new GheroFieldsFragmentData__asHumanBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroFieldsFragmentData__asHuman &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        homePlanet == other.homePlanet &&
        birthday == other.birthday;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
            homePlanet.hashCode),
        birthday.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GheroFieldsFragmentData__asHuman')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('homePlanet', homePlanet)
          ..add('birthday', birthday))
        .toString();
  }
}

class GheroFieldsFragmentData__asHumanBuilder
    implements
        Builder<GheroFieldsFragmentData__asHuman,
            GheroFieldsFragmentData__asHumanBuilder> {
  _$GheroFieldsFragmentData__asHuman? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _homePlanet;
  String? get homePlanet => _$this._homePlanet;
  set homePlanet(String? homePlanet) => _$this._homePlanet = homePlanet;

  DateTime? _birthday;
  DateTime? get birthday => _$this._birthday;
  set birthday(DateTime? birthday) => _$this._birthday = birthday;

  GheroFieldsFragmentData__asHumanBuilder() {
    GheroFieldsFragmentData__asHuman._initializeBuilder(this);
  }

  GheroFieldsFragmentData__asHumanBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _homePlanet = $v.homePlanet;
      _birthday = $v.birthday;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroFieldsFragmentData__asHuman other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroFieldsFragmentData__asHuman;
  }

  @override
  void update(void Function(GheroFieldsFragmentData__asHumanBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroFieldsFragmentData__asHuman build() => _build();

  _$GheroFieldsFragmentData__asHuman _build() {
    final _$result = _$v ??
        new _$GheroFieldsFragmentData__asHuman._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GheroFieldsFragmentData__asHuman', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GheroFieldsFragmentData__asHuman', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GheroFieldsFragmentData__asHuman', 'name'),
            homePlanet: homePlanet,
            birthday: BuiltValueNullFieldError.checkNotNull(
                birthday, r'GheroFieldsFragmentData__asHuman', 'birthday'));
    replace(_$result);
    return _$result;
  }
}

class _$GheroFieldsFragmentData__asDroid
    extends GheroFieldsFragmentData__asDroid {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final String? primaryFunction;

  factory _$GheroFieldsFragmentData__asDroid(
          [void Function(GheroFieldsFragmentData__asDroidBuilder)? updates]) =>
      (new GheroFieldsFragmentData__asDroidBuilder()..update(updates))._build();

  _$GheroFieldsFragmentData__asDroid._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.primaryFunction})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GheroFieldsFragmentData__asDroid', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GheroFieldsFragmentData__asDroid', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GheroFieldsFragmentData__asDroid', 'name');
  }

  @override
  GheroFieldsFragmentData__asDroid rebuild(
          void Function(GheroFieldsFragmentData__asDroidBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GheroFieldsFragmentData__asDroidBuilder toBuilder() =>
      new GheroFieldsFragmentData__asDroidBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GheroFieldsFragmentData__asDroid &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        primaryFunction == other.primaryFunction;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), id.hashCode), name.hashCode),
        primaryFunction.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GheroFieldsFragmentData__asDroid')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('primaryFunction', primaryFunction))
        .toString();
  }
}

class GheroFieldsFragmentData__asDroidBuilder
    implements
        Builder<GheroFieldsFragmentData__asDroid,
            GheroFieldsFragmentData__asDroidBuilder> {
  _$GheroFieldsFragmentData__asDroid? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _primaryFunction;
  String? get primaryFunction => _$this._primaryFunction;
  set primaryFunction(String? primaryFunction) =>
      _$this._primaryFunction = primaryFunction;

  GheroFieldsFragmentData__asDroidBuilder() {
    GheroFieldsFragmentData__asDroid._initializeBuilder(this);
  }

  GheroFieldsFragmentData__asDroidBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _primaryFunction = $v.primaryFunction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GheroFieldsFragmentData__asDroid other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GheroFieldsFragmentData__asDroid;
  }

  @override
  void update(void Function(GheroFieldsFragmentData__asDroidBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GheroFieldsFragmentData__asDroid build() => _build();

  _$GheroFieldsFragmentData__asDroid _build() {
    final _$result = _$v ??
        new _$GheroFieldsFragmentData__asDroid._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GheroFieldsFragmentData__asDroid', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GheroFieldsFragmentData__asDroid', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GheroFieldsFragmentData__asDroid', 'name'),
            primaryFunction: primaryFunction);
    replace(_$result);
    return _$result;
  }
}

class _$GhumanFieldsFragmentData extends GhumanFieldsFragmentData {
  @override
  final String G__typename;
  @override
  final String? homePlanet;
  @override
  final DateTime birthday;

  factory _$GhumanFieldsFragmentData(
          [void Function(GhumanFieldsFragmentDataBuilder)? updates]) =>
      (new GhumanFieldsFragmentDataBuilder()..update(updates))._build();

  _$GhumanFieldsFragmentData._(
      {required this.G__typename, this.homePlanet, required this.birthday})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GhumanFieldsFragmentData', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        birthday, r'GhumanFieldsFragmentData', 'birthday');
  }

  @override
  GhumanFieldsFragmentData rebuild(
          void Function(GhumanFieldsFragmentDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GhumanFieldsFragmentDataBuilder toBuilder() =>
      new GhumanFieldsFragmentDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GhumanFieldsFragmentData &&
        G__typename == other.G__typename &&
        homePlanet == other.homePlanet &&
        birthday == other.birthday;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, G__typename.hashCode), homePlanet.hashCode),
        birthday.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GhumanFieldsFragmentData')
          ..add('G__typename', G__typename)
          ..add('homePlanet', homePlanet)
          ..add('birthday', birthday))
        .toString();
  }
}

class GhumanFieldsFragmentDataBuilder
    implements
        Builder<GhumanFieldsFragmentData, GhumanFieldsFragmentDataBuilder> {
  _$GhumanFieldsFragmentData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _homePlanet;
  String? get homePlanet => _$this._homePlanet;
  set homePlanet(String? homePlanet) => _$this._homePlanet = homePlanet;

  DateTime? _birthday;
  DateTime? get birthday => _$this._birthday;
  set birthday(DateTime? birthday) => _$this._birthday = birthday;

  GhumanFieldsFragmentDataBuilder() {
    GhumanFieldsFragmentData._initializeBuilder(this);
  }

  GhumanFieldsFragmentDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _homePlanet = $v.homePlanet;
      _birthday = $v.birthday;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GhumanFieldsFragmentData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GhumanFieldsFragmentData;
  }

  @override
  void update(void Function(GhumanFieldsFragmentDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GhumanFieldsFragmentData build() => _build();

  _$GhumanFieldsFragmentData _build() {
    final _$result = _$v ??
        new _$GhumanFieldsFragmentData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GhumanFieldsFragmentData', 'G__typename'),
            homePlanet: homePlanet,
            birthday: BuiltValueNullFieldError.checkNotNull(
                birthday, r'GhumanFieldsFragmentData', 'birthday'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
