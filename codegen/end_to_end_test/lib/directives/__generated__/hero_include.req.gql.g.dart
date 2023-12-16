// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_include.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroInclude> _$gHeroIncludeSerializer =
    new _$GHeroIncludeSerializer();

class _$GHeroIncludeSerializer implements StructuredSerializer<GHeroInclude> {
  @override
  final Iterable<Type> types = const [GHeroInclude, _$GHeroInclude];
  @override
  final String wireName = 'GHeroInclude';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroInclude object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroIncludeVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroInclude deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroIncludeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroIncludeVars))!
              as _i3.GHeroIncludeVars);
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

class _$GHeroInclude extends GHeroInclude {
  @override
  final _i3.GHeroIncludeVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroInclude([void Function(GHeroIncludeBuilder)? updates]) =>
      (new GHeroIncludeBuilder()..update(updates))._build();

  _$GHeroInclude._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GHeroInclude', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroInclude', 'operation');
  }

  @override
  GHeroInclude rebuild(void Function(GHeroIncludeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroIncludeBuilder toBuilder() => new GHeroIncludeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroInclude &&
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
    return (newBuiltValueToStringHelper(r'GHeroInclude')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroIncludeBuilder
    implements Builder<GHeroInclude, GHeroIncludeBuilder> {
  _$GHeroInclude? _$v;

  _i3.GHeroIncludeVarsBuilder? _vars;
  _i3.GHeroIncludeVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroIncludeVarsBuilder();
  set vars(_i3.GHeroIncludeVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroIncludeBuilder() {
    GHeroInclude._initializeBuilder(this);
  }

  GHeroIncludeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroInclude other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroInclude;
  }

  @override
  void update(void Function(GHeroIncludeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroInclude build() => _build();

  _$GHeroInclude _build() {
    _$GHeroInclude _$result;
    try {
      _$result = _$v ??
          new _$GHeroInclude._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GHeroInclude', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroInclude', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
