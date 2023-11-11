// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQueryOperationData> _$gQueryOperationDataSerializer =
    new _$GQueryOperationDataSerializer();
Serializer<GQueryOperationData_field> _$gQueryOperationDataFieldSerializer =
    new _$GQueryOperationData_fieldSerializer();
Serializer<GQueryOperationData_field_field>
    _$gQueryOperationDataFieldFieldSerializer =
    new _$GQueryOperationData_field_fieldSerializer();
Serializer<GQueryOperationData_field_fieldRequired>
    _$gQueryOperationDataFieldFieldRequiredSerializer =
    new _$GQueryOperationData_field_fieldRequiredSerializer();

class _$GQueryOperationDataSerializer
    implements StructuredSerializer<GQueryOperationData> {
  @override
  final Iterable<Type> types = const [
    GQueryOperationData,
    _$GQueryOperationData
  ];
  @override
  final String wireName = 'GQueryOperationData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQueryOperationData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.field;
    if (value != null) {
      result
        ..add('field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GQueryOperationData_field)));
    }
    return result;
  }

  @override
  GQueryOperationData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryOperationDataBuilder();

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
        case 'field':
          result.field.replace(serializers.deserialize(value,
                  specifiedType: const FullType(GQueryOperationData_field))!
              as GQueryOperationData_field);
          break;
      }
    }

    return result.build();
  }
}

class _$GQueryOperationData_fieldSerializer
    implements StructuredSerializer<GQueryOperationData_field> {
  @override
  final Iterable<Type> types = const [
    GQueryOperationData_field,
    _$GQueryOperationData_field
  ];
  @override
  final String wireName = 'GQueryOperationData_field';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQueryOperationData_field object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'idRequired',
      serializers.serialize(object.idRequired,
          specifiedType: const FullType(String)),
      'boolRequired',
      serializers.serialize(object.boolRequired,
          specifiedType: const FullType(bool)),
      'intRequired',
      serializers.serialize(object.intRequired,
          specifiedType: const FullType(int)),
      'floatRequired',
      serializers.serialize(object.floatRequired,
          specifiedType: const FullType(double)),
      'stringRequired',
      serializers.serialize(object.stringRequired,
          specifiedType: const FullType(String)),
      'scalarRequired',
      serializers.serialize(object.scalarRequired,
          specifiedType: const FullType(_i2.GScalar)),
      'enumRequired',
      serializers.serialize(object.enumRequired,
          specifiedType: const FullType(_i2.GEnum)),
      'fieldRequired',
      serializers.serialize(object.fieldRequired,
          specifiedType:
              const FullType(GQueryOperationData_field_fieldRequired)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.Gbool;
    if (value != null) {
      result
        ..add('bool')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.Gint;
    if (value != null) {
      result
        ..add('int')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.float;
    if (value != null) {
      result
        ..add('float')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.string;
    if (value != null) {
      result
        ..add('string')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.scalar;
    if (value != null) {
      result
        ..add('scalar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GScalar)));
    }
    value = object.Genum;
    if (value != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i2.GEnum)));
    }
    value = object.field;
    if (value != null) {
      result
        ..add('field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GQueryOperationData_field_field)));
    }
    return result;
  }

  @override
  GQueryOperationData_field deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryOperationData_fieldBuilder();

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
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bool':
          result.Gbool = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'int':
          result.Gint = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'float':
          result.float = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'string':
          result.string = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'scalar':
          result.scalar.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GScalar))! as _i2.GScalar);
          break;
        case 'enum':
          result.Genum = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GEnum)) as _i2.GEnum?;
          break;
        case 'field':
          result.field.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GQueryOperationData_field_field))!
              as GQueryOperationData_field_field);
          break;
        case 'idRequired':
          result.idRequired = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'boolRequired':
          result.boolRequired = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'intRequired':
          result.intRequired = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'floatRequired':
          result.floatRequired = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
        case 'stringRequired':
          result.stringRequired = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'scalarRequired':
          result.scalarRequired.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.GScalar))! as _i2.GScalar);
          break;
        case 'enumRequired':
          result.enumRequired = serializers.deserialize(value,
              specifiedType: const FullType(_i2.GEnum))! as _i2.GEnum;
          break;
        case 'fieldRequired':
          result.fieldRequired.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GQueryOperationData_field_fieldRequired))!
              as GQueryOperationData_field_fieldRequired);
          break;
      }
    }

    return result.build();
  }
}

class _$GQueryOperationData_field_fieldSerializer
    implements StructuredSerializer<GQueryOperationData_field_field> {
  @override
  final Iterable<Type> types = const [
    GQueryOperationData_field_field,
    _$GQueryOperationData_field_field
  ];
  @override
  final String wireName = 'GQueryOperationData_field_field';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQueryOperationData_field_field object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GQueryOperationData_field_field deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryOperationData_field_fieldBuilder();

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
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GQueryOperationData_field_fieldRequiredSerializer
    implements StructuredSerializer<GQueryOperationData_field_fieldRequired> {
  @override
  final Iterable<Type> types = const [
    GQueryOperationData_field_fieldRequired,
    _$GQueryOperationData_field_fieldRequired
  ];
  @override
  final String wireName = 'GQueryOperationData_field_fieldRequired';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GQueryOperationData_field_fieldRequired object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  GQueryOperationData_field_fieldRequired deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryOperationData_field_fieldRequiredBuilder();

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
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$GQueryOperationData extends GQueryOperationData {
  @override
  final String G__typename;
  @override
  final GQueryOperationData_field? field;

  factory _$GQueryOperationData(
          [void Function(GQueryOperationDataBuilder)? updates]) =>
      (new GQueryOperationDataBuilder()..update(updates))._build();

  _$GQueryOperationData._({required this.G__typename, this.field}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GQueryOperationData', 'G__typename');
  }

  @override
  GQueryOperationData rebuild(
          void Function(GQueryOperationDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryOperationDataBuilder toBuilder() =>
      new GQueryOperationDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryOperationData &&
        G__typename == other.G__typename &&
        field == other.field;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, field.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GQueryOperationData')
          ..add('G__typename', G__typename)
          ..add('field', field))
        .toString();
  }
}

class GQueryOperationDataBuilder
    implements Builder<GQueryOperationData, GQueryOperationDataBuilder> {
  _$GQueryOperationData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GQueryOperationData_fieldBuilder? _field;
  GQueryOperationData_fieldBuilder get field =>
      _$this._field ??= new GQueryOperationData_fieldBuilder();
  set field(GQueryOperationData_fieldBuilder? field) => _$this._field = field;

  GQueryOperationDataBuilder() {
    GQueryOperationData._initializeBuilder(this);
  }

  GQueryOperationDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _field = $v.field?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQueryOperationData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryOperationData;
  }

  @override
  void update(void Function(GQueryOperationDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GQueryOperationData build() => _build();

  _$GQueryOperationData _build() {
    _$GQueryOperationData _$result;
    try {
      _$result = _$v ??
          new _$GQueryOperationData._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GQueryOperationData', 'G__typename'),
              field: _field?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'field';
        _field?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GQueryOperationData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQueryOperationData_field extends GQueryOperationData_field {
  @override
  final String G__typename;
  @override
  final String? id;
  @override
  final bool? Gbool;
  @override
  final int? Gint;
  @override
  final double? float;
  @override
  final String? string;
  @override
  final _i2.GScalar? scalar;
  @override
  final _i2.GEnum? Genum;
  @override
  final GQueryOperationData_field_field? field;
  @override
  final String idRequired;
  @override
  final bool boolRequired;
  @override
  final int intRequired;
  @override
  final double floatRequired;
  @override
  final String stringRequired;
  @override
  final _i2.GScalar scalarRequired;
  @override
  final _i2.GEnum enumRequired;
  @override
  final GQueryOperationData_field_fieldRequired fieldRequired;

  factory _$GQueryOperationData_field(
          [void Function(GQueryOperationData_fieldBuilder)? updates]) =>
      (new GQueryOperationData_fieldBuilder()..update(updates))._build();

  _$GQueryOperationData_field._(
      {required this.G__typename,
      this.id,
      this.Gbool,
      this.Gint,
      this.float,
      this.string,
      this.scalar,
      this.Genum,
      this.field,
      required this.idRequired,
      required this.boolRequired,
      required this.intRequired,
      required this.floatRequired,
      required this.stringRequired,
      required this.scalarRequired,
      required this.enumRequired,
      required this.fieldRequired})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GQueryOperationData_field', 'G__typename');
    BuiltValueNullFieldError.checkNotNull(
        idRequired, r'GQueryOperationData_field', 'idRequired');
    BuiltValueNullFieldError.checkNotNull(
        boolRequired, r'GQueryOperationData_field', 'boolRequired');
    BuiltValueNullFieldError.checkNotNull(
        intRequired, r'GQueryOperationData_field', 'intRequired');
    BuiltValueNullFieldError.checkNotNull(
        floatRequired, r'GQueryOperationData_field', 'floatRequired');
    BuiltValueNullFieldError.checkNotNull(
        stringRequired, r'GQueryOperationData_field', 'stringRequired');
    BuiltValueNullFieldError.checkNotNull(
        scalarRequired, r'GQueryOperationData_field', 'scalarRequired');
    BuiltValueNullFieldError.checkNotNull(
        enumRequired, r'GQueryOperationData_field', 'enumRequired');
    BuiltValueNullFieldError.checkNotNull(
        fieldRequired, r'GQueryOperationData_field', 'fieldRequired');
  }

  @override
  GQueryOperationData_field rebuild(
          void Function(GQueryOperationData_fieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryOperationData_fieldBuilder toBuilder() =>
      new GQueryOperationData_fieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryOperationData_field &&
        G__typename == other.G__typename &&
        id == other.id &&
        Gbool == other.Gbool &&
        Gint == other.Gint &&
        float == other.float &&
        string == other.string &&
        scalar == other.scalar &&
        Genum == other.Genum &&
        field == other.field &&
        idRequired == other.idRequired &&
        boolRequired == other.boolRequired &&
        intRequired == other.intRequired &&
        floatRequired == other.floatRequired &&
        stringRequired == other.stringRequired &&
        scalarRequired == other.scalarRequired &&
        enumRequired == other.enumRequired &&
        fieldRequired == other.fieldRequired;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, Gbool.hashCode);
    _$hash = $jc(_$hash, Gint.hashCode);
    _$hash = $jc(_$hash, float.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jc(_$hash, scalar.hashCode);
    _$hash = $jc(_$hash, Genum.hashCode);
    _$hash = $jc(_$hash, field.hashCode);
    _$hash = $jc(_$hash, idRequired.hashCode);
    _$hash = $jc(_$hash, boolRequired.hashCode);
    _$hash = $jc(_$hash, intRequired.hashCode);
    _$hash = $jc(_$hash, floatRequired.hashCode);
    _$hash = $jc(_$hash, stringRequired.hashCode);
    _$hash = $jc(_$hash, scalarRequired.hashCode);
    _$hash = $jc(_$hash, enumRequired.hashCode);
    _$hash = $jc(_$hash, fieldRequired.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GQueryOperationData_field')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('Gbool', Gbool)
          ..add('Gint', Gint)
          ..add('float', float)
          ..add('string', string)
          ..add('scalar', scalar)
          ..add('Genum', Genum)
          ..add('field', field)
          ..add('idRequired', idRequired)
          ..add('boolRequired', boolRequired)
          ..add('intRequired', intRequired)
          ..add('floatRequired', floatRequired)
          ..add('stringRequired', stringRequired)
          ..add('scalarRequired', scalarRequired)
          ..add('enumRequired', enumRequired)
          ..add('fieldRequired', fieldRequired))
        .toString();
  }
}

class GQueryOperationData_fieldBuilder
    implements
        Builder<GQueryOperationData_field, GQueryOperationData_fieldBuilder> {
  _$GQueryOperationData_field? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _Gbool;
  bool? get Gbool => _$this._Gbool;
  set Gbool(bool? Gbool) => _$this._Gbool = Gbool;

  int? _Gint;
  int? get Gint => _$this._Gint;
  set Gint(int? Gint) => _$this._Gint = Gint;

  double? _float;
  double? get float => _$this._float;
  set float(double? float) => _$this._float = float;

  String? _string;
  String? get string => _$this._string;
  set string(String? string) => _$this._string = string;

  _i2.GScalarBuilder? _scalar;
  _i2.GScalarBuilder get scalar => _$this._scalar ??= new _i2.GScalarBuilder();
  set scalar(_i2.GScalarBuilder? scalar) => _$this._scalar = scalar;

  _i2.GEnum? _Genum;
  _i2.GEnum? get Genum => _$this._Genum;
  set Genum(_i2.GEnum? Genum) => _$this._Genum = Genum;

  GQueryOperationData_field_fieldBuilder? _field;
  GQueryOperationData_field_fieldBuilder get field =>
      _$this._field ??= new GQueryOperationData_field_fieldBuilder();
  set field(GQueryOperationData_field_fieldBuilder? field) =>
      _$this._field = field;

  String? _idRequired;
  String? get idRequired => _$this._idRequired;
  set idRequired(String? idRequired) => _$this._idRequired = idRequired;

  bool? _boolRequired;
  bool? get boolRequired => _$this._boolRequired;
  set boolRequired(bool? boolRequired) => _$this._boolRequired = boolRequired;

  int? _intRequired;
  int? get intRequired => _$this._intRequired;
  set intRequired(int? intRequired) => _$this._intRequired = intRequired;

  double? _floatRequired;
  double? get floatRequired => _$this._floatRequired;
  set floatRequired(double? floatRequired) =>
      _$this._floatRequired = floatRequired;

  String? _stringRequired;
  String? get stringRequired => _$this._stringRequired;
  set stringRequired(String? stringRequired) =>
      _$this._stringRequired = stringRequired;

  _i2.GScalarBuilder? _scalarRequired;
  _i2.GScalarBuilder get scalarRequired =>
      _$this._scalarRequired ??= new _i2.GScalarBuilder();
  set scalarRequired(_i2.GScalarBuilder? scalarRequired) =>
      _$this._scalarRequired = scalarRequired;

  _i2.GEnum? _enumRequired;
  _i2.GEnum? get enumRequired => _$this._enumRequired;
  set enumRequired(_i2.GEnum? enumRequired) =>
      _$this._enumRequired = enumRequired;

  GQueryOperationData_field_fieldRequiredBuilder? _fieldRequired;
  GQueryOperationData_field_fieldRequiredBuilder get fieldRequired =>
      _$this._fieldRequired ??=
          new GQueryOperationData_field_fieldRequiredBuilder();
  set fieldRequired(
          GQueryOperationData_field_fieldRequiredBuilder? fieldRequired) =>
      _$this._fieldRequired = fieldRequired;

  GQueryOperationData_fieldBuilder() {
    GQueryOperationData_field._initializeBuilder(this);
  }

  GQueryOperationData_fieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _Gbool = $v.Gbool;
      _Gint = $v.Gint;
      _float = $v.float;
      _string = $v.string;
      _scalar = $v.scalar?.toBuilder();
      _Genum = $v.Genum;
      _field = $v.field?.toBuilder();
      _idRequired = $v.idRequired;
      _boolRequired = $v.boolRequired;
      _intRequired = $v.intRequired;
      _floatRequired = $v.floatRequired;
      _stringRequired = $v.stringRequired;
      _scalarRequired = $v.scalarRequired.toBuilder();
      _enumRequired = $v.enumRequired;
      _fieldRequired = $v.fieldRequired.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQueryOperationData_field other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryOperationData_field;
  }

  @override
  void update(void Function(GQueryOperationData_fieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GQueryOperationData_field build() => _build();

  _$GQueryOperationData_field _build() {
    _$GQueryOperationData_field _$result;
    try {
      _$result = _$v ??
          new _$GQueryOperationData_field._(
              G__typename: BuiltValueNullFieldError.checkNotNull(
                  G__typename, r'GQueryOperationData_field', 'G__typename'),
              id: id,
              Gbool: Gbool,
              Gint: Gint,
              float: float,
              string: string,
              scalar: _scalar?.build(),
              Genum: Genum,
              field: _field?.build(),
              idRequired: BuiltValueNullFieldError.checkNotNull(
                  idRequired, r'GQueryOperationData_field', 'idRequired'),
              boolRequired: BuiltValueNullFieldError.checkNotNull(
                  boolRequired, r'GQueryOperationData_field', 'boolRequired'),
              intRequired: BuiltValueNullFieldError.checkNotNull(
                  intRequired, r'GQueryOperationData_field', 'intRequired'),
              floatRequired: BuiltValueNullFieldError.checkNotNull(
                  floatRequired, r'GQueryOperationData_field', 'floatRequired'),
              stringRequired: BuiltValueNullFieldError.checkNotNull(
                  stringRequired,
                  r'GQueryOperationData_field',
                  'stringRequired'),
              scalarRequired: scalarRequired.build(),
              enumRequired: BuiltValueNullFieldError.checkNotNull(
                  enumRequired, r'GQueryOperationData_field', 'enumRequired'),
              fieldRequired: fieldRequired.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scalar';
        _scalar?.build();

        _$failedField = 'field';
        _field?.build();

        _$failedField = 'scalarRequired';
        scalarRequired.build();

        _$failedField = 'fieldRequired';
        fieldRequired.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GQueryOperationData_field', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GQueryOperationData_field_field
    extends GQueryOperationData_field_field {
  @override
  final String G__typename;
  @override
  final String? id;

  factory _$GQueryOperationData_field_field(
          [void Function(GQueryOperationData_field_fieldBuilder)? updates]) =>
      (new GQueryOperationData_field_fieldBuilder()..update(updates))._build();

  _$GQueryOperationData_field_field._({required this.G__typename, this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GQueryOperationData_field_field', 'G__typename');
  }

  @override
  GQueryOperationData_field_field rebuild(
          void Function(GQueryOperationData_field_fieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryOperationData_field_fieldBuilder toBuilder() =>
      new GQueryOperationData_field_fieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryOperationData_field_field &&
        G__typename == other.G__typename &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GQueryOperationData_field_field')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GQueryOperationData_field_fieldBuilder
    implements
        Builder<GQueryOperationData_field_field,
            GQueryOperationData_field_fieldBuilder> {
  _$GQueryOperationData_field_field? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GQueryOperationData_field_fieldBuilder() {
    GQueryOperationData_field_field._initializeBuilder(this);
  }

  GQueryOperationData_field_fieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQueryOperationData_field_field other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryOperationData_field_field;
  }

  @override
  void update(void Function(GQueryOperationData_field_fieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GQueryOperationData_field_field build() => _build();

  _$GQueryOperationData_field_field _build() {
    final _$result = _$v ??
        new _$GQueryOperationData_field_field._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GQueryOperationData_field_field', 'G__typename'),
            id: id);
    replace(_$result);
    return _$result;
  }
}

class _$GQueryOperationData_field_fieldRequired
    extends GQueryOperationData_field_fieldRequired {
  @override
  final String G__typename;
  @override
  final String? id;

  factory _$GQueryOperationData_field_fieldRequired(
          [void Function(GQueryOperationData_field_fieldRequiredBuilder)?
              updates]) =>
      (new GQueryOperationData_field_fieldRequiredBuilder()..update(updates))
          ._build();

  _$GQueryOperationData_field_fieldRequired._(
      {required this.G__typename, this.id})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        G__typename, r'GQueryOperationData_field_fieldRequired', 'G__typename');
  }

  @override
  GQueryOperationData_field_fieldRequired rebuild(
          void Function(GQueryOperationData_field_fieldRequiredBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryOperationData_field_fieldRequiredBuilder toBuilder() =>
      new GQueryOperationData_field_fieldRequiredBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryOperationData_field_fieldRequired &&
        G__typename == other.G__typename &&
        id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GQueryOperationData_field_fieldRequired')
          ..add('G__typename', G__typename)
          ..add('id', id))
        .toString();
  }
}

class GQueryOperationData_field_fieldRequiredBuilder
    implements
        Builder<GQueryOperationData_field_fieldRequired,
            GQueryOperationData_field_fieldRequiredBuilder> {
  _$GQueryOperationData_field_fieldRequired? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  GQueryOperationData_field_fieldRequiredBuilder() {
    GQueryOperationData_field_fieldRequired._initializeBuilder(this);
  }

  GQueryOperationData_field_fieldRequiredBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GQueryOperationData_field_fieldRequired other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryOperationData_field_fieldRequired;
  }

  @override
  void update(
      void Function(GQueryOperationData_field_fieldRequiredBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GQueryOperationData_field_fieldRequired build() => _build();

  _$GQueryOperationData_field_fieldRequired _build() {
    final _$result = _$v ??
        new _$GQueryOperationData_field_fieldRequired._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GQueryOperationData_field_fieldRequired', 'G__typename'),
            id: id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
