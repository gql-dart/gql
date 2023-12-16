// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aliased_hero.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAliasedHero> _$gAliasedHeroSerializer =
    new _$GAliasedHeroSerializer();

class _$GAliasedHeroSerializer implements StructuredSerializer<GAliasedHero> {
  @override
  final Iterable<Type> types = const [GAliasedHero, _$GAliasedHero];
  @override
  final String wireName = 'GAliasedHero';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAliasedHero object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GAliasedHeroVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GAliasedHero deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAliasedHeroBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GAliasedHeroVars))!
              as _i3.GAliasedHeroVars);
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

class _$GAliasedHero extends GAliasedHero {
  @override
  final _i3.GAliasedHeroVars vars;
  @override
  final _i1.Operation operation;

  factory _$GAliasedHero([void Function(GAliasedHeroBuilder)? updates]) =>
      (new GAliasedHeroBuilder()..update(updates))._build();

  _$GAliasedHero._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GAliasedHero', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GAliasedHero', 'operation');
  }

  @override
  GAliasedHero rebuild(void Function(GAliasedHeroBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAliasedHeroBuilder toBuilder() => new GAliasedHeroBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAliasedHero &&
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
    return (newBuiltValueToStringHelper(r'GAliasedHero')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GAliasedHeroBuilder
    implements Builder<GAliasedHero, GAliasedHeroBuilder> {
  _$GAliasedHero? _$v;

  _i3.GAliasedHeroVarsBuilder? _vars;
  _i3.GAliasedHeroVarsBuilder get vars =>
      _$this._vars ??= new _i3.GAliasedHeroVarsBuilder();
  set vars(_i3.GAliasedHeroVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GAliasedHeroBuilder() {
    GAliasedHero._initializeBuilder(this);
  }

  GAliasedHeroBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAliasedHero other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAliasedHero;
  }

  @override
  void update(void Function(GAliasedHeroBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAliasedHero build() => _build();

  _$GAliasedHero _build() {
    _$GAliasedHero _$result;
    try {
      _$result = _$v ??
          new _$GAliasedHero._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GAliasedHero', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GAliasedHero', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
