// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.schema.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GEnum _$gEnumON = const GEnum._('ON');
const GEnum _$gEnumOFF = const GEnum._('OFF');

GEnum _$gEnumValueOf(String name) {
  switch (name) {
    case 'ON':
      return _$gEnumON;
    case 'OFF':
      return _$gEnumOFF;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<GEnum> _$gEnumValues = new BuiltSet<GEnum>(const <GEnum>[
  _$gEnumON,
  _$gEnumOFF,
]);

Serializer<GEnum> _$gEnumSerializer = new _$GEnumSerializer();
Serializer<GInput> _$gInputSerializer = new _$GInputSerializer();

class _$GEnumSerializer implements PrimitiveSerializer<GEnum> {
  @override
  final Iterable<Type> types = const <Type>[GEnum];
  @override
  final String wireName = 'GEnum';

  @override
  Object serialize(Serializers serializers, GEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  GEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GEnum.valueOf(serialized as String);
}

class _$GInputSerializer implements StructuredSerializer<GInput> {
  @override
  final Iterable<Type> types = const [GInput, _$GInput];
  @override
  final String wireName = 'GInput';

  @override
  Iterable<Object?> serialize(Serializers serializers, GInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
          specifiedType: const FullType(GScalar)),
      'enumRequired',
      serializers.serialize(object.enumRequired,
          specifiedType: const FullType(GEnum)),
      'inputRequired',
      serializers.serialize(object.inputRequired,
          specifiedType: const FullType(GInput)),
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
            specifiedType: const FullType(GScalar)));
    }
    value = object.Genum;
    if (value != null) {
      result
        ..add('enum')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(GEnum)));
    }
    value = object.input;
    if (value != null) {
      result
        ..add('input')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GInput)));
    }
    return result;
  }

  @override
  GInput deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
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
              specifiedType: const FullType(GScalar))! as GScalar);
          break;
        case 'enum':
          result.Genum = serializers.deserialize(value,
              specifiedType: const FullType(GEnum)) as GEnum?;
          break;
        case 'input':
          result.input.replace(serializers.deserialize(value,
              specifiedType: const FullType(GInput))! as GInput);
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
              specifiedType: const FullType(GScalar))! as GScalar);
          break;
        case 'enumRequired':
          result.enumRequired = serializers.deserialize(value,
              specifiedType: const FullType(GEnum))! as GEnum;
          break;
        case 'inputRequired':
          result.inputRequired.replace(serializers.deserialize(value,
              specifiedType: const FullType(GInput))! as GInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GScalar extends GScalar {
  @override
  final String value;

  factory _$GScalar([void Function(GScalarBuilder)? updates]) =>
      (new GScalarBuilder()..update(updates))._build();

  _$GScalar._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'GScalar', 'value');
  }

  @override
  GScalar rebuild(void Function(GScalarBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GScalarBuilder toBuilder() => new GScalarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GScalar && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GScalar')..add('value', value))
        .toString();
  }
}

class GScalarBuilder implements Builder<GScalar, GScalarBuilder> {
  _$GScalar? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  GScalarBuilder();

  GScalarBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GScalar other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GScalar;
  }

  @override
  void update(void Function(GScalarBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GScalar build() => _build();

  _$GScalar _build() {
    final _$result = _$v ??
        new _$GScalar._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'GScalar', 'value'));
    replace(_$result);
    return _$result;
  }
}

class _$GInput extends GInput {
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
  final GScalar? scalar;
  @override
  final GEnum? Genum;
  @override
  final GInput? input;
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
  final GScalar scalarRequired;
  @override
  final GEnum enumRequired;
  @override
  final GInput inputRequired;

  factory _$GInput([void Function(GInputBuilder)? updates]) =>
      (new GInputBuilder()..update(updates))._build();

  _$GInput._(
      {this.id,
      this.Gbool,
      this.Gint,
      this.float,
      this.string,
      this.scalar,
      this.Genum,
      this.input,
      required this.idRequired,
      required this.boolRequired,
      required this.intRequired,
      required this.floatRequired,
      required this.stringRequired,
      required this.scalarRequired,
      required this.enumRequired,
      required this.inputRequired})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(idRequired, r'GInput', 'idRequired');
    BuiltValueNullFieldError.checkNotNull(
        boolRequired, r'GInput', 'boolRequired');
    BuiltValueNullFieldError.checkNotNull(
        intRequired, r'GInput', 'intRequired');
    BuiltValueNullFieldError.checkNotNull(
        floatRequired, r'GInput', 'floatRequired');
    BuiltValueNullFieldError.checkNotNull(
        stringRequired, r'GInput', 'stringRequired');
    BuiltValueNullFieldError.checkNotNull(
        scalarRequired, r'GInput', 'scalarRequired');
    BuiltValueNullFieldError.checkNotNull(
        enumRequired, r'GInput', 'enumRequired');
    BuiltValueNullFieldError.checkNotNull(
        inputRequired, r'GInput', 'inputRequired');
  }

  @override
  GInput rebuild(void Function(GInputBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GInputBuilder toBuilder() => new GInputBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GInput &&
        id == other.id &&
        Gbool == other.Gbool &&
        Gint == other.Gint &&
        float == other.float &&
        string == other.string &&
        scalar == other.scalar &&
        Genum == other.Genum &&
        input == other.input &&
        idRequired == other.idRequired &&
        boolRequired == other.boolRequired &&
        intRequired == other.intRequired &&
        floatRequired == other.floatRequired &&
        stringRequired == other.stringRequired &&
        scalarRequired == other.scalarRequired &&
        enumRequired == other.enumRequired &&
        inputRequired == other.inputRequired;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, Gbool.hashCode);
    _$hash = $jc(_$hash, Gint.hashCode);
    _$hash = $jc(_$hash, float.hashCode);
    _$hash = $jc(_$hash, string.hashCode);
    _$hash = $jc(_$hash, scalar.hashCode);
    _$hash = $jc(_$hash, Genum.hashCode);
    _$hash = $jc(_$hash, input.hashCode);
    _$hash = $jc(_$hash, idRequired.hashCode);
    _$hash = $jc(_$hash, boolRequired.hashCode);
    _$hash = $jc(_$hash, intRequired.hashCode);
    _$hash = $jc(_$hash, floatRequired.hashCode);
    _$hash = $jc(_$hash, stringRequired.hashCode);
    _$hash = $jc(_$hash, scalarRequired.hashCode);
    _$hash = $jc(_$hash, enumRequired.hashCode);
    _$hash = $jc(_$hash, inputRequired.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GInput')
          ..add('id', id)
          ..add('Gbool', Gbool)
          ..add('Gint', Gint)
          ..add('float', float)
          ..add('string', string)
          ..add('scalar', scalar)
          ..add('Genum', Genum)
          ..add('input', input)
          ..add('idRequired', idRequired)
          ..add('boolRequired', boolRequired)
          ..add('intRequired', intRequired)
          ..add('floatRequired', floatRequired)
          ..add('stringRequired', stringRequired)
          ..add('scalarRequired', scalarRequired)
          ..add('enumRequired', enumRequired)
          ..add('inputRequired', inputRequired))
        .toString();
  }
}

class GInputBuilder implements Builder<GInput, GInputBuilder> {
  _$GInput? _$v;

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

  GScalarBuilder? _scalar;
  GScalarBuilder get scalar => _$this._scalar ??= new GScalarBuilder();
  set scalar(GScalarBuilder? scalar) => _$this._scalar = scalar;

  GEnum? _Genum;
  GEnum? get Genum => _$this._Genum;
  set Genum(GEnum? Genum) => _$this._Genum = Genum;

  GInputBuilder? _input;
  GInputBuilder get input => _$this._input ??= new GInputBuilder();
  set input(GInputBuilder? input) => _$this._input = input;

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

  GScalarBuilder? _scalarRequired;
  GScalarBuilder get scalarRequired =>
      _$this._scalarRequired ??= new GScalarBuilder();
  set scalarRequired(GScalarBuilder? scalarRequired) =>
      _$this._scalarRequired = scalarRequired;

  GEnum? _enumRequired;
  GEnum? get enumRequired => _$this._enumRequired;
  set enumRequired(GEnum? enumRequired) => _$this._enumRequired = enumRequired;

  GInputBuilder? _inputRequired;
  GInputBuilder get inputRequired =>
      _$this._inputRequired ??= new GInputBuilder();
  set inputRequired(GInputBuilder? inputRequired) =>
      _$this._inputRequired = inputRequired;

  GInputBuilder();

  GInputBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _Gbool = $v.Gbool;
      _Gint = $v.Gint;
      _float = $v.float;
      _string = $v.string;
      _scalar = $v.scalar?.toBuilder();
      _Genum = $v.Genum;
      _input = $v.input?.toBuilder();
      _idRequired = $v.idRequired;
      _boolRequired = $v.boolRequired;
      _intRequired = $v.intRequired;
      _floatRequired = $v.floatRequired;
      _stringRequired = $v.stringRequired;
      _scalarRequired = $v.scalarRequired.toBuilder();
      _enumRequired = $v.enumRequired;
      _inputRequired = $v.inputRequired.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInput other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GInput;
  }

  @override
  void update(void Function(GInputBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GInput build() => _build();

  _$GInput _build() {
    _$GInput _$result;
    try {
      _$result = _$v ??
          new _$GInput._(
              id: id,
              Gbool: Gbool,
              Gint: Gint,
              float: float,
              string: string,
              scalar: _scalar?.build(),
              Genum: Genum,
              input: _input?.build(),
              idRequired: BuiltValueNullFieldError.checkNotNull(
                  idRequired, r'GInput', 'idRequired'),
              boolRequired: BuiltValueNullFieldError.checkNotNull(
                  boolRequired, r'GInput', 'boolRequired'),
              intRequired: BuiltValueNullFieldError.checkNotNull(
                  intRequired, r'GInput', 'intRequired'),
              floatRequired: BuiltValueNullFieldError.checkNotNull(
                  floatRequired, r'GInput', 'floatRequired'),
              stringRequired: BuiltValueNullFieldError.checkNotNull(
                  stringRequired, r'GInput', 'stringRequired'),
              scalarRequired: scalarRequired.build(),
              enumRequired: BuiltValueNullFieldError.checkNotNull(
                  enumRequired, r'GInput', 'enumRequired'),
              inputRequired: inputRequired.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'scalar';
        _scalar?.build();

        _$failedField = 'input';
        _input?.build();

        _$failedField = 'scalarRequired';
        scalarRequired.build();

        _$failedField = 'inputRequired';
        inputRequired.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GInput', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
