// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReproQueryData> _$gReproQueryDataSerializer =
    new _$GReproQueryDataSerializer();
Serializer<GReproQueryData_repro> _$gReproQueryDataReproSerializer =
    new _$GReproQueryData_reproSerializer();
Serializer<GChildFragmentData__base> _$gChildFragmentDataBaseSerializer =
    new _$GChildFragmentData__baseSerializer();
Serializer<GChildFragmentData__asChildReproA>
    _$gChildFragmentDataAsChildReproASerializer =
    new _$GChildFragmentData__asChildReproASerializer();
Serializer<GChildFragmentData__asChildReproA_childs__base>
    _$gChildFragmentDataAsChildReproAChildsBaseSerializer =
    new _$GChildFragmentData__asChildReproA_childs__baseSerializer();
Serializer<GChildFragmentData__asChildReproA_childs__asChildReproB>
    _$gChildFragmentDataAsChildReproAChildsAsChildReproBSerializer =
    new _$GChildFragmentData__asChildReproA_childs__asChildReproBSerializer();

class _$GReproQueryDataSerializer
    implements StructuredSerializer<GReproQueryData> {
  @override
  final Iterable<Type> types = const [GReproQueryData, _$GReproQueryData];
  @override
  final String wireName = 'GReproQueryData';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReproQueryData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.repro;
    if (value != null) {
      result
        ..add('repro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GReproQueryData_repro)));
    }
    return result;
  }

  @override
  GReproQueryData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReproQueryDataBuilder();

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
        case 'repro':
          result.repro.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GReproQueryData_repro))!
              as GReproQueryData_repro);
          break;
      }
    }

    return result.build();
  }
}

class _$GReproQueryData_reproSerializer
    implements StructuredSerializer<GReproQueryData_repro> {
  @override
  final Iterable<Type> types = const [
    GReproQueryData_repro,
    _$GReproQueryData_repro
  ];
  @override
  final String wireName = 'GReproQueryData_repro';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GReproQueryData_repro object,
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
    value = object.child;
    if (value != null) {
      result
        ..add('child')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GChildFragmentData)));
    }
    return result;
  }

  @override
  GReproQueryData_repro deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReproQueryData_reproBuilder();

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
        case 'child':
          result.child = serializers.deserialize(value,
                  specifiedType: const FullType(GChildFragmentData))
              as GChildFragmentData?;
          break;
      }
    }

    return result.build();
  }
}

class _$GChildFragmentData__baseSerializer
    implements StructuredSerializer<GChildFragmentData__base> {
  @override
  final Iterable<Type> types = const [
    GChildFragmentData__base,
    _$GChildFragmentData__base
  ];
  @override
  final String wireName = 'GChildFragmentData__base';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GChildFragmentData__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GChildFragmentData__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GChildFragmentData__baseBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GChildFragmentData__asChildReproASerializer
    implements StructuredSerializer<GChildFragmentData__asChildReproA> {
  @override
  final Iterable<Type> types = const [
    GChildFragmentData__asChildReproA,
    _$GChildFragmentData__asChildReproA
  ];
  @override
  final String wireName = 'GChildFragmentData__asChildReproA';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GChildFragmentData__asChildReproA object,
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
    value = object.childs;
    if (value != null) {
      result
        ..add('childs')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType.nullable(GChildFragmentData__asChildReproA_childs)
            ])));
    }
    return result;
  }

  @override
  GChildFragmentData__asChildReproA deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GChildFragmentData__asChildReproABuilder();

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
        case 'childs':
          result.childs.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(
                    GChildFragmentData__asChildReproA_childs)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GChildFragmentData__asChildReproA_childs__baseSerializer
    implements
        StructuredSerializer<GChildFragmentData__asChildReproA_childs__base> {
  @override
  final Iterable<Type> types = const [
    GChildFragmentData__asChildReproA_childs__base,
    _$GChildFragmentData__asChildReproA_childs__base
  ];
  @override
  final String wireName = 'GChildFragmentData__asChildReproA_childs__base';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GChildFragmentData__asChildReproA_childs__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GChildFragmentData__asChildReproA_childs__base deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GChildFragmentData__asChildReproA_childs__baseBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GChildFragmentData__asChildReproA_childs__asChildReproBSerializer
    implements
        StructuredSerializer<
            GChildFragmentData__asChildReproA_childs__asChildReproB> {
  @override
  final Iterable<Type> types = const [
    GChildFragmentData__asChildReproA_childs__asChildReproB,
    _$GChildFragmentData__asChildReproA_childs__asChildReproB
  ];
  @override
  final String wireName =
      'GChildFragmentData__asChildReproA_childs__asChildReproB';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GChildFragmentData__asChildReproA_childs__asChildReproB object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GChildFragmentData__asChildReproA_childs__asChildReproB deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        new GChildFragmentData__asChildReproA_childs__asChildReproBBuilder();

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
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GReproQueryData extends GReproQueryData {
  @override
  final String G__typename;
  @override
  final GReproQueryData_repro? repro;

  factory _$GReproQueryData([void Function(GReproQueryDataBuilder)? updates]) =>
      (new GReproQueryDataBuilder()..update(updates))._build();

  _$GReproQueryData._({required this.G__typename, this.repro}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReproQueryData', 'G__typename');
  }

  @override
  GReproQueryData rebuild(void Function(GReproQueryDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReproQueryDataBuilder toBuilder() =>
      new GReproQueryDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReproQueryData &&
        G__typename == other.G__typename &&
        repro == other.repro;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, repro.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReproQueryData')
          ..add('G__typename', G__typename)
          ..add('repro', repro))
        .toString();
  }
}

class GReproQueryDataBuilder
    implements Builder<GReproQueryData, GReproQueryDataBuilder> {
  _$GReproQueryData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GReproQueryData_reproBuilder? _repro;
  GReproQueryData_reproBuilder get repro =>
      _$this._repro ??= new GReproQueryData_reproBuilder();
  set repro(GReproQueryData_reproBuilder? repro) => _$this._repro = repro;

  GReproQueryDataBuilder() {
    GReproQueryData._initializeBuilder(this);
  }

  GReproQueryDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _repro = $v.repro?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReproQueryData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReproQueryData;
  }

  @override
  void update(void Function(GReproQueryDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReproQueryData build() => _build();

  _$GReproQueryData _build() {
    _$GReproQueryData _$result;
    try {
      _$result = _$v ??
          new _$GReproQueryData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GReproQueryData', 'G__typename'),
              repro: _repro?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'repro';
        _repro?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GReproQueryData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GReproQueryData_repro extends GReproQueryData_repro {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final GChildFragmentData? child;

  factory _$GReproQueryData_repro(
          [void Function(GReproQueryData_reproBuilder)? updates]) =>
      (new GReproQueryData_reproBuilder()..update(updates))._build();

  _$GReproQueryData_repro._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.child})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GReproQueryData_repro', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(id, r'GReproQueryData_repro', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GReproQueryData_repro', 'name');
  }

  @override
  GReproQueryData_repro rebuild(
          void Function(GReproQueryData_reproBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReproQueryData_reproBuilder toBuilder() =>
      new GReproQueryData_reproBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReproQueryData_repro &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        child == other.child;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, child.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GReproQueryData_repro')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('child', child))
        .toString();
  }
}

class GReproQueryData_reproBuilder
    implements Builder<GReproQueryData_repro, GReproQueryData_reproBuilder> {
  _$GReproQueryData_repro? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GChildFragmentData? _child;
  GChildFragmentData? get child => _$this._child;
  set child(GChildFragmentData? child) => _$this._child = child;

  GReproQueryData_reproBuilder() {
    GReproQueryData_repro._initializeBuilder(this);
  }

  GReproQueryData_reproBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _child = $v.child;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReproQueryData_repro other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReproQueryData_repro;
  }

  @override
  void update(void Function(GReproQueryData_reproBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GReproQueryData_repro build() => _build();

  _$GReproQueryData_repro _build() {
    final _$result = _$v ??
        new _$GReproQueryData_repro._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GReproQueryData_repro', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GReproQueryData_repro', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GReproQueryData_repro', 'name'),
            child: child);
    replace(_$result);
    return _$result;
  }
}

class _$GChildFragmentData__base extends GChildFragmentData__base {
  @override
  final String G__typename;

  factory _$GChildFragmentData__base(
          [void Function(GChildFragmentData__baseBuilder)? updates]) =>
      (new GChildFragmentData__baseBuilder()..update(updates))._build();

  _$GChildFragmentData__base._({required this.G__typename}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GChildFragmentData__base', 'G__typename');
  }

  @override
  GChildFragmentData__base rebuild(
          void Function(GChildFragmentData__baseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GChildFragmentData__baseBuilder toBuilder() =>
      new GChildFragmentData__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChildFragmentData__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GChildFragmentData__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GChildFragmentData__baseBuilder
    implements
        Builder<GChildFragmentData__base, GChildFragmentData__baseBuilder> {
  _$GChildFragmentData__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GChildFragmentData__baseBuilder() {
    GChildFragmentData__base._initializeBuilder(this);
  }

  GChildFragmentData__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GChildFragmentData__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChildFragmentData__base;
  }

  @override
  void update(void Function(GChildFragmentData__baseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GChildFragmentData__base build() => _build();

  _$GChildFragmentData__base _build() {
    final _$result = _$v ??
        new _$GChildFragmentData__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GChildFragmentData__base', 'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GChildFragmentData__asChildReproA
    extends GChildFragmentData__asChildReproA {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final String name;
  @override
  final BuiltList<GChildFragmentData__asChildReproA_childs?>? childs;

  factory _$GChildFragmentData__asChildReproA(
          [void Function(GChildFragmentData__asChildReproABuilder)? updates]) =>
      (new GChildFragmentData__asChildReproABuilder()..update(updates))
          ._build();

  _$GChildFragmentData__asChildReproA._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.childs})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GChildFragmentData__asChildReproA', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GChildFragmentData__asChildReproA', 'id');
    BuiltValueNullFieldError.checkNotNull(
        name, r'GChildFragmentData__asChildReproA', 'name');
  }

  @override
  GChildFragmentData__asChildReproA rebuild(
          void Function(GChildFragmentData__asChildReproABuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GChildFragmentData__asChildReproABuilder toBuilder() =>
      new GChildFragmentData__asChildReproABuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChildFragmentData__asChildReproA &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        childs == other.childs;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, childs.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GChildFragmentData__asChildReproA')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('childs', childs))
        .toString();
  }
}

class GChildFragmentData__asChildReproABuilder
    implements
        Builder<GChildFragmentData__asChildReproA,
            GChildFragmentData__asChildReproABuilder> {
  _$GChildFragmentData__asChildReproA? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<GChildFragmentData__asChildReproA_childs?>? _childs;
  ListBuilder<GChildFragmentData__asChildReproA_childs?> get childs =>
      _$this._childs ??=
          new ListBuilder<GChildFragmentData__asChildReproA_childs?>();
  set childs(ListBuilder<GChildFragmentData__asChildReproA_childs?>? childs) =>
      _$this._childs = childs;

  GChildFragmentData__asChildReproABuilder() {
    GChildFragmentData__asChildReproA._initializeBuilder(this);
  }

  GChildFragmentData__asChildReproABuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _childs = $v.childs?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GChildFragmentData__asChildReproA other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChildFragmentData__asChildReproA;
  }

  @override
  void update(
      void Function(GChildFragmentData__asChildReproABuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GChildFragmentData__asChildReproA build() => _build();

  _$GChildFragmentData__asChildReproA _build() {
    _$GChildFragmentData__asChildReproA _$result;
    try {
      _$result = _$v ??
          new _$GChildFragmentData__asChildReproA._(
              G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                  r'GChildFragmentData__asChildReproA', 'G__typename'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'GChildFragmentData__asChildReproA', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'GChildFragmentData__asChildReproA', 'name'),
              childs: _childs?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'childs';
        _childs?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GChildFragmentData__asChildReproA', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GChildFragmentData__asChildReproA_childs__base
    extends GChildFragmentData__asChildReproA_childs__base {
  @override
  final String G__typename;

  factory _$GChildFragmentData__asChildReproA_childs__base(
          [void Function(GChildFragmentData__asChildReproA_childs__baseBuilder)?
              updates]) =>
      (new GChildFragmentData__asChildReproA_childs__baseBuilder()
            ..update(updates))
          ._build();

  _$GChildFragmentData__asChildReproA_childs__base._(
      {required this.G__typename})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(G__typename,
        r'GChildFragmentData__asChildReproA_childs__base', 'G__typename');
  }

  @override
  GChildFragmentData__asChildReproA_childs__base rebuild(
          void Function(GChildFragmentData__asChildReproA_childs__baseBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GChildFragmentData__asChildReproA_childs__baseBuilder toBuilder() =>
      new GChildFragmentData__asChildReproA_childs__baseBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChildFragmentData__asChildReproA_childs__base &&
        G__typename == other.G__typename;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GChildFragmentData__asChildReproA_childs__base')
          ..add('G__typename', G__typename))
        .toString();
  }
}

class GChildFragmentData__asChildReproA_childs__baseBuilder
    implements
        Builder<GChildFragmentData__asChildReproA_childs__base,
            GChildFragmentData__asChildReproA_childs__baseBuilder> {
  _$GChildFragmentData__asChildReproA_childs__base? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GChildFragmentData__asChildReproA_childs__baseBuilder() {
    GChildFragmentData__asChildReproA_childs__base._initializeBuilder(this);
  }

  GChildFragmentData__asChildReproA_childs__baseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GChildFragmentData__asChildReproA_childs__base other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChildFragmentData__asChildReproA_childs__base;
  }

  @override
  void update(
      void Function(GChildFragmentData__asChildReproA_childs__baseBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GChildFragmentData__asChildReproA_childs__base build() => _build();

  _$GChildFragmentData__asChildReproA_childs__base _build() {
    final _$result = _$v ??
        new _$GChildFragmentData__asChildReproA_childs__base._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GChildFragmentData__asChildReproA_childs__base',
                'G__typename'));
    replace(_$result);
    return _$result;
  }
}

class _$GChildFragmentData__asChildReproA_childs__asChildReproB
    extends GChildFragmentData__asChildReproA_childs__asChildReproB {
  @override
  final String G__typename;
  @override
  final String id;
  @override
  final int count;

  factory _$GChildFragmentData__asChildReproA_childs__asChildReproB(
          [void Function(
                  GChildFragmentData__asChildReproA_childs__asChildReproBBuilder)?
              updates]) =>
      (new GChildFragmentData__asChildReproA_childs__asChildReproBBuilder()
            ..update(updates))
          ._build();

  _$GChildFragmentData__asChildReproA_childs__asChildReproB._(
      {required this.G__typename, required this.id, required this.count})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename,
        r'GChildFragmentData__asChildReproA_childs__asChildReproB',
        'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        id, r'GChildFragmentData__asChildReproA_childs__asChildReproB', 'id');
    BuiltValueNullFieldError.checkNotNull(count,
        r'GChildFragmentData__asChildReproA_childs__asChildReproB', 'count');
  }

  @override
  GChildFragmentData__asChildReproA_childs__asChildReproB rebuild(
          void Function(
                  GChildFragmentData__asChildReproA_childs__asChildReproBBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GChildFragmentData__asChildReproA_childs__asChildReproBBuilder toBuilder() =>
      new GChildFragmentData__asChildReproA_childs__asChildReproBBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GChildFragmentData__asChildReproA_childs__asChildReproB &&
        G__typename == other.G__typename &&
        id == other.id &&
        count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GChildFragmentData__asChildReproA_childs__asChildReproB')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('count', count))
        .toString();
  }
}

class GChildFragmentData__asChildReproA_childs__asChildReproBBuilder
    implements
        Builder<GChildFragmentData__asChildReproA_childs__asChildReproB,
            GChildFragmentData__asChildReproA_childs__asChildReproBBuilder> {
  _$GChildFragmentData__asChildReproA_childs__asChildReproB? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GChildFragmentData__asChildReproA_childs__asChildReproBBuilder() {
    GChildFragmentData__asChildReproA_childs__asChildReproB._initializeBuilder(
        this);
  }

  GChildFragmentData__asChildReproA_childs__asChildReproBBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GChildFragmentData__asChildReproA_childs__asChildReproB other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GChildFragmentData__asChildReproA_childs__asChildReproB;
  }

  @override
  void update(
      void Function(
              GChildFragmentData__asChildReproA_childs__asChildReproBBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GChildFragmentData__asChildReproA_childs__asChildReproB build() => _build();

  _$GChildFragmentData__asChildReproA_childs__asChildReproB _build() {
    final _$result = _$v ??
        new _$GChildFragmentData__asChildReproA_childs__asChildReproB._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GChildFragmentData__asChildReproA_childs__asChildReproB',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GChildFragmentData__asChildReproA_childs__asChildReproB',
                'id'),
            count: BuiltValueNullFieldError.checkNotNull(
                count,
                r'GChildFragmentData__asChildReproA_childs__asChildReproB',
                'count'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
