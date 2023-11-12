// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alias_var_fragment.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPosts> _$gPostsSerializer = new _$GPostsSerializer();

class _$GPostsSerializer implements StructuredSerializer<GPosts> {
  @override
  final Iterable<Type> types = const [GPosts, _$GPosts];
  @override
  final String wireName = 'GPosts';

  @override
  Iterable<Object?> serialize(Serializers serializers, GPosts object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GPostsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GPosts deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GPostsVars))!
              as _i3.GPostsVars);
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

class _$GPosts extends GPosts {
  @override
  final _i3.GPostsVars vars;
  @override
  final _i1.Operation operation;

  factory _$GPosts([void Function(GPostsBuilder)? updates]) =>
      (new GPostsBuilder()..update(updates))._build();

  _$GPosts._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GPosts', 'vars');
    BuiltValueNullFieldError.checkNotNull(operation, r'GPosts', 'operation');
  }

  @override
  GPosts rebuild(void Function(GPostsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostsBuilder toBuilder() => new GPostsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPosts &&
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
    return (newBuiltValueToStringHelper(r'GPosts')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GPostsBuilder implements Builder<GPosts, GPostsBuilder> {
  _$GPosts? _$v;

  _i3.GPostsVarsBuilder? _vars;
  _i3.GPostsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GPostsVarsBuilder();
  set vars(_i3.GPostsVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GPostsBuilder() {
    GPosts._initializeBuilder(this);
  }

  GPostsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPosts other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPosts;
  }

  @override
  void update(void Function(GPostsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPosts build() => _build();

  _$GPosts _build() {
    _$GPosts _$result;
    try {
      _$result = _$v ??
          new _$GPosts._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GPosts', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPosts', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
