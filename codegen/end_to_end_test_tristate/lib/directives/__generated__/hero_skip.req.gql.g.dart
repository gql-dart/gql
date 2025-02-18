// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_skip.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroSkip> _$gHeroSkipSerializer = new _$GHeroSkipSerializer();

class _$GHeroSkipSerializer implements StructuredSerializer<GHeroSkip> {
  @override
  final Iterable<Type> types = const [GHeroSkip, _$GHeroSkip];
  @override
  final String wireName = 'GHeroSkip';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroSkip object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroSkipVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroSkip deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroSkipBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroSkipVars))!
              as _i3.GHeroSkipVars);
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

class _$GHeroSkip extends GHeroSkip {
  @override
  final _i3.GHeroSkipVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroSkip([void Function(GHeroSkipBuilder)? updates]) =>
      (new GHeroSkipBuilder()..update(updates))._build();

  _$GHeroSkip._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GHeroSkip', 'vars');
    BuiltValueNullFieldError.checkNotNull(operation, r'GHeroSkip', 'operation');
  }

  @override
  GHeroSkip rebuild(void Function(GHeroSkipBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroSkipBuilder toBuilder() => new GHeroSkipBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroSkip &&
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
    return (newBuiltValueToStringHelper(r'GHeroSkip')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroSkipBuilder implements Builder<GHeroSkip, GHeroSkipBuilder> {
  _$GHeroSkip? _$v;

  _i3.GHeroSkipVarsBuilder? _vars;
  _i3.GHeroSkipVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroSkipVarsBuilder();
  set vars(_i3.GHeroSkipVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroSkipBuilder() {
    GHeroSkip._initializeBuilder(this);
  }

  GHeroSkipBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroSkip other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroSkip;
  }

  @override
  void update(void Function(GHeroSkipBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroSkip build() => _build();

  _$GHeroSkip _build() {
    _$GHeroSkip _$result;
    try {
      _$result = _$v ??
          new _$GHeroSkip._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GHeroSkip', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroSkip', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
