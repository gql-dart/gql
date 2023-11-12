// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_star.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GRemoveStar> _$gRemoveStarSerializer = new _$GRemoveStarSerializer();

class _$GRemoveStarSerializer implements StructuredSerializer<GRemoveStar> {
  @override
  final Iterable<Type> types = const [GRemoveStar, _$GRemoveStar];
  @override
  final String wireName = 'GRemoveStar';

  @override
  Iterable<Object?> serialize(Serializers serializers, GRemoveStar object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GRemoveStarVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GRemoveStar deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRemoveStarBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GRemoveStarVars))!
              as _i3.GRemoveStarVars);
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

class _$GRemoveStar extends GRemoveStar {
  @override
  final _i3.GRemoveStarVars vars;
  @override
  final _i1.Operation operation;

  factory _$GRemoveStar([void Function(GRemoveStarBuilder)? updates]) =>
      (new GRemoveStarBuilder()..update(updates))._build();

  _$GRemoveStar._({required this.vars, required this.operation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GRemoveStar', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GRemoveStar', 'operation');
  }

  @override
  GRemoveStar rebuild(void Function(GRemoveStarBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRemoveStarBuilder toBuilder() => new GRemoveStarBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRemoveStar &&
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
    return (newBuiltValueToStringHelper(r'GRemoveStar')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GRemoveStarBuilder implements Builder<GRemoveStar, GRemoveStarBuilder> {
  _$GRemoveStar? _$v;

  _i3.GRemoveStarVarsBuilder? _vars;
  _i3.GRemoveStarVarsBuilder get vars =>
      _$this._vars ??= new _i3.GRemoveStarVarsBuilder();
  set vars(_i3.GRemoveStarVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GRemoveStarBuilder() {
    GRemoveStar._initializeBuilder(this);
  }

  GRemoveStarBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRemoveStar other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRemoveStar;
  }

  @override
  void update(void Function(GRemoveStarBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRemoveStar build() => _build();

  _$GRemoveStar _build() {
    _$GRemoveStar _$result;
    try {
      _$result = _$v ??
          new _$GRemoveStar._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GRemoveStar', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GRemoveStar', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
