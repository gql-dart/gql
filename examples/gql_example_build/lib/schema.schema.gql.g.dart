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
  Iterable<Object> serialize(Serializers serializers, GInput object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
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
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.bool$ != null) {
      result
        ..add('bool')
        ..add(serializers.serialize(object.bool$,
            specifiedType: const FullType(bool)));
    }
    if (object.int$ != null) {
      result
        ..add('int')
        ..add(serializers.serialize(object.int$,
            specifiedType: const FullType(int)));
    }
    if (object.float != null) {
      result
        ..add('float')
        ..add(serializers.serialize(object.float,
            specifiedType: const FullType(double)));
    }
    if (object.string != null) {
      result
        ..add('string')
        ..add(serializers.serialize(object.string,
            specifiedType: const FullType(String)));
    }
    if (object.scalar != null) {
      result
        ..add('scalar')
        ..add(serializers.serialize(object.scalar,
            specifiedType: const FullType(GScalar)));
    }
    if (object.enum$ != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(object.enum$,
            specifiedType: const FullType(GEnum)));
    }
    if (object.input != null) {
      result
        ..add('input')
        ..add(serializers.serialize(object.input,
            specifiedType: const FullType(GInput)));
    }
    return result;
  }

  @override
  GInput deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GInputBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bool':
          result.bool$ = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'int':
          result.int$ = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'float':
          result.float = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'string':
          result.string = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'scalar':
          result.scalar.replace(serializers.deserialize(value,
              specifiedType: const FullType(GScalar)) as GScalar);
          break;
        case 'enum':
          result.enum$ = serializers.deserialize(value,
              specifiedType: const FullType(GEnum)) as GEnum;
          break;
        case 'input':
          result.input.replace(serializers.deserialize(value,
              specifiedType: const FullType(GInput)) as GInput);
          break;
        case 'idRequired':
          result.idRequired = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'boolRequired':
          result.boolRequired = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'intRequired':
          result.intRequired = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'floatRequired':
          result.floatRequired = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'stringRequired':
          result.stringRequired = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'scalarRequired':
          result.scalarRequired.replace(serializers.deserialize(value,
              specifiedType: const FullType(GScalar)) as GScalar);
          break;
        case 'enumRequired':
          result.enumRequired = serializers.deserialize(value,
              specifiedType: const FullType(GEnum)) as GEnum;
          break;
        case 'inputRequired':
          result.inputRequired.replace(serializers.deserialize(value,
              specifiedType: const FullType(GInput)) as GInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GScalar extends GScalar {
  @override
  final String value;

  factory _$GScalar([void Function(GScalarBuilder) updates]) =>
      (new GScalarBuilder()..update(updates)).build();

  _$GScalar._({this.value}) : super._() {
    if (value == null) {
      throw new BuiltValueNullFieldError('GScalar', 'value');
    }
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
    return $jf($jc(0, value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GScalar')..add('value', value))
        .toString();
  }
}

class GScalarBuilder implements Builder<GScalar, GScalarBuilder> {
  _$GScalar _$v;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  GScalarBuilder();

  GScalarBuilder get _$this {
    if (_$v != null) {
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GScalar other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GScalar;
  }

  @override
  void update(void Function(GScalarBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GScalar build() {
    final _$result = _$v ?? new _$GScalar._(value: value);
    replace(_$result);
    return _$result;
  }
}

class _$GInput extends GInput {
  @override
  final String id;
  @override
  final bool bool$;
  @override
  final int int$;
  @override
  final double float;
  @override
  final String string;
  @override
  final GScalar scalar;
  @override
  final GEnum enum$;
  @override
  final GInput input;
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

  factory _$GInput([void Function(GInputBuilder) updates]) =>
      (new GInputBuilder()..update(updates)).build();

  _$GInput._(
      {this.id,
      this.bool$,
      this.int$,
      this.float,
      this.string,
      this.scalar,
      this.enum$,
      this.input,
      this.idRequired,
      this.boolRequired,
      this.intRequired,
      this.floatRequired,
      this.stringRequired,
      this.scalarRequired,
      this.enumRequired,
      this.inputRequired})
      : super._() {
    if (idRequired == null) {
      throw new BuiltValueNullFieldError('GInput', 'idRequired');
    }
    if (boolRequired == null) {
      throw new BuiltValueNullFieldError('GInput', 'boolRequired');
    }
    if (intRequired == null) {
      throw new BuiltValueNullFieldError('GInput', 'intRequired');
    }
    if (floatRequired == null) {
      throw new BuiltValueNullFieldError('GInput', 'floatRequired');
    }
    if (stringRequired == null) {
      throw new BuiltValueNullFieldError('GInput', 'stringRequired');
    }
    if (scalarRequired == null) {
      throw new BuiltValueNullFieldError('GInput', 'scalarRequired');
    }
    if (enumRequired == null) {
      throw new BuiltValueNullFieldError('GInput', 'enumRequired');
    }
    if (inputRequired == null) {
      throw new BuiltValueNullFieldError('GInput', 'inputRequired');
    }
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
        bool$ == other.bool$ &&
        int$ == other.int$ &&
        float == other.float &&
        string == other.string &&
        scalar == other.scalar &&
        enum$ == other.enum$ &&
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
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(0,
                                                                    id.hashCode),
                                                                bool$.hashCode),
                                                            int$.hashCode),
                                                        float.hashCode),
                                                    string.hashCode),
                                                scalar.hashCode),
                                            enum$.hashCode),
                                        input.hashCode),
                                    idRequired.hashCode),
                                boolRequired.hashCode),
                            intRequired.hashCode),
                        floatRequired.hashCode),
                    stringRequired.hashCode),
                scalarRequired.hashCode),
            enumRequired.hashCode),
        inputRequired.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GInput')
          ..add('id', id)
          ..add('bool\$', bool$)
          ..add('int\$', int$)
          ..add('float', float)
          ..add('string', string)
          ..add('scalar', scalar)
          ..add('enum\$', enum$)
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
  _$GInput _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  bool _bool$;
  bool get bool$ => _$this._bool$;
  set bool$(bool bool$) => _$this._bool$ = bool$;

  int _int$;
  int get int$ => _$this._int$;
  set int$(int int$) => _$this._int$ = int$;

  double _float;
  double get float => _$this._float;
  set float(double float) => _$this._float = float;

  String _string;
  String get string => _$this._string;
  set string(String string) => _$this._string = string;

  GScalarBuilder _scalar;
  GScalarBuilder get scalar => _$this._scalar ??= new GScalarBuilder();
  set scalar(GScalarBuilder scalar) => _$this._scalar = scalar;

  GEnum _enum$;
  GEnum get enum$ => _$this._enum$;
  set enum$(GEnum enum$) => _$this._enum$ = enum$;

  GInputBuilder _input;
  GInputBuilder get input => _$this._input ??= new GInputBuilder();
  set input(GInputBuilder input) => _$this._input = input;

  String _idRequired;
  String get idRequired => _$this._idRequired;
  set idRequired(String idRequired) => _$this._idRequired = idRequired;

  bool _boolRequired;
  bool get boolRequired => _$this._boolRequired;
  set boolRequired(bool boolRequired) => _$this._boolRequired = boolRequired;

  int _intRequired;
  int get intRequired => _$this._intRequired;
  set intRequired(int intRequired) => _$this._intRequired = intRequired;

  double _floatRequired;
  double get floatRequired => _$this._floatRequired;
  set floatRequired(double floatRequired) =>
      _$this._floatRequired = floatRequired;

  String _stringRequired;
  String get stringRequired => _$this._stringRequired;
  set stringRequired(String stringRequired) =>
      _$this._stringRequired = stringRequired;

  GScalarBuilder _scalarRequired;
  GScalarBuilder get scalarRequired =>
      _$this._scalarRequired ??= new GScalarBuilder();
  set scalarRequired(GScalarBuilder scalarRequired) =>
      _$this._scalarRequired = scalarRequired;

  GEnum _enumRequired;
  GEnum get enumRequired => _$this._enumRequired;
  set enumRequired(GEnum enumRequired) => _$this._enumRequired = enumRequired;

  GInputBuilder _inputRequired;
  GInputBuilder get inputRequired =>
      _$this._inputRequired ??= new GInputBuilder();
  set inputRequired(GInputBuilder inputRequired) =>
      _$this._inputRequired = inputRequired;

  GInputBuilder();

  GInputBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _bool$ = _$v.bool$;
      _int$ = _$v.int$;
      _float = _$v.float;
      _string = _$v.string;
      _scalar = _$v.scalar?.toBuilder();
      _enum$ = _$v.enum$;
      _input = _$v.input?.toBuilder();
      _idRequired = _$v.idRequired;
      _boolRequired = _$v.boolRequired;
      _intRequired = _$v.intRequired;
      _floatRequired = _$v.floatRequired;
      _stringRequired = _$v.stringRequired;
      _scalarRequired = _$v.scalarRequired?.toBuilder();
      _enumRequired = _$v.enumRequired;
      _inputRequired = _$v.inputRequired?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GInput other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GInput;
  }

  @override
  void update(void Function(GInputBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GInput build() {
    _$GInput _$result;
    try {
      _$result = _$v ??
          new _$GInput._(
              id: id,
              bool$: bool$,
              int$: int$,
              float: float,
              string: string,
              scalar: _scalar?.build(),
              enum$: enum$,
              input: _input?.build(),
              idRequired: idRequired,
              boolRequired: boolRequired,
              intRequired: intRequired,
              floatRequired: floatRequired,
              stringRequired: stringRequired,
              scalarRequired: scalarRequired.build(),
              enumRequired: enumRequired,
              inputRequired: inputRequired.build());
    } catch (_) {
      String _$failedField;
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
            'GInput', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
