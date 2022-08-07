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
  Iterable<Object?> serialize(
      Serializers serializers, GQueryOperationVars object,
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
          specifiedType: const FullType(_i1.GScalar)),
      'enumRequired',
      serializers.serialize(object.enumRequired,
          specifiedType: const FullType(_i1.GEnum)),
      'inputRequired',
      serializers.serialize(object.inputRequired,
          specifiedType: const FullType(_i1.GInput)),
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
            specifiedType: const FullType(_i1.GScalar)));
    }
    value = object.Genum;
    if (value != null) {
      result
        ..add('enum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GEnum)));
    }
    value = object.input;
    if (value != null) {
      result
        ..add('input')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GInput)));
    }
    return result;
  }

  @override
  GQueryOperationVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GQueryOperationVarsBuilder();

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
              specifiedType: const FullType(_i1.GScalar))! as _i1.GScalar);
          break;
        case 'enum':
          result.Genum = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEnum)) as _i1.GEnum?;
          break;
        case 'input':
          result.input.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i1.GInput))! as _i1.GInput);
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
              specifiedType: const FullType(_i1.GScalar))! as _i1.GScalar);
          break;
        case 'enumRequired':
          result.enumRequired = serializers.deserialize(value,
              specifiedType: const FullType(_i1.GEnum))! as _i1.GEnum;
          break;
        case 'inputRequired':
          result.inputRequired.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i1.GInput))! as _i1.GInput);
          break;
      }
    }

    return result.build();
  }
}

class _$GQueryOperationVars extends GQueryOperationVars {
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
  final _i1.GScalar? scalar;
  @override
  final _i1.GEnum? Genum;
  @override
  final _i1.GInput? input;
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
          [void Function(GQueryOperationVarsBuilder)? updates]) =>
      (new GQueryOperationVarsBuilder()..update(updates))._build();

  _$GQueryOperationVars._(
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
    BuiltValueNullFieldError.checkNotNull(
        idRequired, r'GQueryOperationVars', 'idRequired');
    BuiltValueNullFieldError.checkNotNull(
        boolRequired, r'GQueryOperationVars', 'boolRequired');
    BuiltValueNullFieldError.checkNotNull(
        intRequired, r'GQueryOperationVars', 'intRequired');
    BuiltValueNullFieldError.checkNotNull(
        floatRequired, r'GQueryOperationVars', 'floatRequired');
    BuiltValueNullFieldError.checkNotNull(
        stringRequired, r'GQueryOperationVars', 'stringRequired');
    BuiltValueNullFieldError.checkNotNull(
        scalarRequired, r'GQueryOperationVars', 'scalarRequired');
    BuiltValueNullFieldError.checkNotNull(
        enumRequired, r'GQueryOperationVars', 'enumRequired');
    BuiltValueNullFieldError.checkNotNull(
        inputRequired, r'GQueryOperationVars', 'inputRequired');
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
                                                                Gbool.hashCode),
                                                            Gint.hashCode),
                                                        float.hashCode),
                                                    string.hashCode),
                                                scalar.hashCode),
                                            Genum.hashCode),
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
    return (newBuiltValueToStringHelper(r'GQueryOperationVars')
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

class GQueryOperationVarsBuilder
    implements Builder<GQueryOperationVars, GQueryOperationVarsBuilder> {
  _$GQueryOperationVars? _$v;

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

  _i1.GScalarBuilder? _scalar;
  _i1.GScalarBuilder get scalar => _$this._scalar ??= new _i1.GScalarBuilder();
  set scalar(_i1.GScalarBuilder? scalar) => _$this._scalar = scalar;

  _i1.GEnum? _Genum;
  _i1.GEnum? get Genum => _$this._Genum;
  set Genum(_i1.GEnum? Genum) => _$this._Genum = Genum;

  _i1.GInputBuilder? _input;
  _i1.GInputBuilder get input => _$this._input ??= new _i1.GInputBuilder();
  set input(_i1.GInputBuilder? input) => _$this._input = input;

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

  _i1.GScalarBuilder? _scalarRequired;
  _i1.GScalarBuilder get scalarRequired =>
      _$this._scalarRequired ??= new _i1.GScalarBuilder();
  set scalarRequired(_i1.GScalarBuilder? scalarRequired) =>
      _$this._scalarRequired = scalarRequired;

  _i1.GEnum? _enumRequired;
  _i1.GEnum? get enumRequired => _$this._enumRequired;
  set enumRequired(_i1.GEnum? enumRequired) =>
      _$this._enumRequired = enumRequired;

  _i1.GInputBuilder? _inputRequired;
  _i1.GInputBuilder get inputRequired =>
      _$this._inputRequired ??= new _i1.GInputBuilder();
  set inputRequired(_i1.GInputBuilder? inputRequired) =>
      _$this._inputRequired = inputRequired;

  GQueryOperationVarsBuilder();

  GQueryOperationVarsBuilder get _$this {
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
  void replace(GQueryOperationVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GQueryOperationVars;
  }

  @override
  void update(void Function(GQueryOperationVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GQueryOperationVars build() => _build();

  _$GQueryOperationVars _build() {
    _$GQueryOperationVars _$result;
    try {
      _$result = _$v ??
          new _$GQueryOperationVars._(
              id: id,
              Gbool: Gbool,
              Gint: Gint,
              float: float,
              string: string,
              scalar: _scalar?.build(),
              Genum: Genum,
              input: _input?.build(),
              idRequired: BuiltValueNullFieldError.checkNotNull(
                  idRequired, r'GQueryOperationVars', 'idRequired'),
              boolRequired: BuiltValueNullFieldError.checkNotNull(
                  boolRequired, r'GQueryOperationVars', 'boolRequired'),
              intRequired: BuiltValueNullFieldError.checkNotNull(
                  intRequired, r'GQueryOperationVars', 'intRequired'),
              floatRequired: BuiltValueNullFieldError.checkNotNull(
                  floatRequired, r'GQueryOperationVars', 'floatRequired'),
              stringRequired: BuiltValueNullFieldError.checkNotNull(
                  stringRequired, r'GQueryOperationVars', 'stringRequired'),
              scalarRequired: scalarRequired.build(),
              enumRequired: BuiltValueNullFieldError.checkNotNull(
                  enumRequired, r'GQueryOperationVars', 'enumRequired'),
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
            r'GQueryOperationVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
