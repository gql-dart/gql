// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_no_vars.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroNoVars> _$gHeroNoVarsSerializer = new _$GHeroNoVarsSerializer();

class _$GHeroNoVarsSerializer implements StructuredSerializer<GHeroNoVars> {
  @override
  final Iterable<Type> types = const [GHeroNoVars, _$GHeroNoVars];
  @override
  final String wireName = 'GHeroNoVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroNoVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroNoVarsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroNoVars deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroNoVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroNoVarsVars))!
              as _i3.GHeroNoVarsVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i1.Operation))! as _i1.Operation;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroNoVars extends GHeroNoVars {
  @override
  final _i3.GHeroNoVarsVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroNoVars([void Function(GHeroNoVarsBuilder)? updates]) =>
      (new GHeroNoVarsBuilder()..update(updates))._build();

  _$GHeroNoVars._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GHeroNoVars', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroNoVars', 'operation');
  }

  @override
  GHeroNoVars rebuild(void Function(GHeroNoVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroNoVarsBuilder toBuilder() => new GHeroNoVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroNoVars &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroNoVars')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroNoVarsBuilder implements Builder<GHeroNoVars, GHeroNoVarsBuilder> {
  _$GHeroNoVars? _$v;

  _i3.GHeroNoVarsVarsBuilder? _vars;
  _i3.GHeroNoVarsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroNoVarsVarsBuilder();
  set vars(_i3.GHeroNoVarsVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroNoVarsBuilder() {
    GHeroNoVars._initializeBuilder(this);
  }

  GHeroNoVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroNoVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroNoVars;
  }

  @override
  void update(void Function(GHeroNoVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroNoVars build() => _build();

  _$GHeroNoVars _build() {
    _$GHeroNoVars _$result;
    try {
      _$result = _$v ??
          new _$GHeroNoVars._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GHeroNoVars', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroNoVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
