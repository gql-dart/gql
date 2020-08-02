// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GQueryOperationVars> _$gQueryOperationVarsSerializer =
    new _$GQueryOperationVarsSerializer();

class _$GQueryOperationVarsSerializer
    implements StructuredSerializer<GQueryOperationVars> {
  @override
  final Iterable<Type> types = const [
    GQueryOperationVars,
    _$GQueryOperationVars
  ];
  @override
  final String wireName = 'GQueryOperationVars';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GQueryOperationVars object,
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
          specifiedType: const FullType(_i1.GScalar)),
      'enumRequired',
      serializers.serialize(object.enumRequired,
          specifiedType: const FullType(_i1.GEnum)),
      'inputRequired',
      serializers.serialize(object.inputRequired,
          specifiedType: const FullType(_i1.GInput)),
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
            specifiedType: const FullType(_i1.GScalar)));
    }
    if (object.enum$ != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(object.enum$,
            specifiedType: const FullType(_i1.GEnum)));
    }
    if (object.input != null) {
      result
        ..add('input')
        ..add(serializers.serialize(object.input,
            specifiedType: const FullType(_i1.GInput)));
    }
    return result;
  }

  @override
  GQueryOperationVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryOperationVarsBuilder();

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
              specifiedType: const FullType(_i1.GScalar)) as _i1.GScalar);
          break;
        case 'enum':
          result.enum$ = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEnum)) as _i1.GEnum;
          break;
        case 'input':
          result.input.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i1.GInput)) as _i1.GInput);
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
              specifiedType: const FullType(_i1.GScalar)) as _i1.GScalar);
          break;
        case 'enumRequired':
          result.enumRequired = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEnum)) as _i1.GEnum;
          break;
        case 'inputRequired':
          result.inputRequired.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i1.GInput)) as _i1.GInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GQueryOperationVars extends GQueryOperationVars {
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
  final _i1.GScalar scalar;
  @override
  final _i1.GEnum enum$;
  @override
  final _i1.GInput input;
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
  final _i1.GScalar scalarRequired;
  @override
  final _i1.GEnum enumRequired;
  @override
  final _i1.GInput inputRequired;

  factory _$GQueryOperationVars(
          [void Function(GQueryOperationVarsBuilder) updates]) =>
      (new GQueryOperationVarsBuilder()..update(updates)).build();

  _$GQueryOperationVars._(
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
      throw new BuiltValueNullFieldError('GQueryOperationVars', 'idRequired');
    }
    if (boolRequired == null) {
      throw new BuiltValueNullFieldError('GQueryOperationVars', 'boolRequired');
    }
    if (intRequired == null) {
      throw new BuiltValueNullFieldError('GQueryOperationVars', 'intRequired');
    }
    if (floatRequired == null) {
      throw new BuiltValueNullFieldError(
          'GQueryOperationVars', 'floatRequired');
    }
    if (stringRequired == null) {
      throw new BuiltValueNullFieldError(
          'GQueryOperationVars', 'stringRequired');
    }
    if (scalarRequired == null) {
      throw new BuiltValueNullFieldError(
          'GQueryOperationVars', 'scalarRequired');
    }
    if (enumRequired == null) {
      throw new BuiltValueNullFieldError('GQueryOperationVars', 'enumRequired');
    }
    if (inputRequired == null) {
      throw new BuiltValueNullFieldError(
          'GQueryOperationVars', 'inputRequired');
    }
  }

  @override
  GQueryOperationVars rebuild(
          void Function(GQueryOperationVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GQueryOperationVarsBuilder toBuilder() =>
      new GQueryOperationVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GQueryOperationVars &&
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
    return (newBuiltValueToStringHelper('GQueryOperationVars')
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

class GQueryOperationVarsBuilder
    implements Builder<GQueryOperationVars, GQueryOperationVarsBuilder> {
  _$GQueryOperationVars _$v;

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

  _i1.GScalarBuilder _scalar;
  _i1.GScalarBuilder get scalar => _$this._scalar ??= new _i1.GScalarBuilder();
  set scalar(_i1.GScalarBuilder scalar) => _$this._scalar = scalar;

  _i1.GEnum _enum$;
  _i1.GEnum get enum$ => _$this._enum$;
  set enum$(_i1.GEnum enum$) => _$this._enum$ = enum$;

  _i1.GInputBuilder _input;
  _i1.GInputBuilder get input => _$this._input ??= new _i1.GInputBuilder();
  set input(_i1.GInputBuilder input) => _$this._input = input;

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

  _i1.GScalarBuilder _scalarRequired;
  _i1.GScalarBuilder get scalarRequired =>
      _$this._scalarRequired ??= new _i1.GScalarBuilder();
  set scalarRequired(_i1.GScalarBuilder scalarRequired) =>
      _$this._scalarRequired = scalarRequired;

  _i1.GEnum _enumRequired;
  _i1.GEnum get enumRequired => _$this._enumRequired;
  set enumRequired(_i1.GEnum enumRequired) =>
      _$this._enumRequired = enumRequired;

  _i1.GInputBuilder _inputRequired;
  _i1.GInputBuilder get inputRequired =>
      _$this._inputRequired ??= new _i1.GInputBuilder();
  set inputRequired(_i1.GInputBuilder inputRequired) =>
      _$this._inputRequired = inputRequired;

  GQueryOperationVarsBuilder();

  GQueryOperationVarsBuilder get _$this {
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
  void replace(GQueryOperationVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GQueryOperationVars;
  }

  @override
  void update(void Function(GQueryOperationVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GQueryOperationVars build() {
    _$GQueryOperationVars _$result;
    try {
      _$result = _$v ??
          new _$GQueryOperationVars._(
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
            'GQueryOperationVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
