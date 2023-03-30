// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multiple_fragments.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWith2Fragments> _$gHeroWith2FragmentsSerializer =
    new _$GHeroWith2FragmentsSerializer();

class _$GHeroWith2FragmentsSerializer
    implements StructuredSerializer<GHeroWith2Fragments> {
  @override
  final Iterable<Type> types = const [
    GHeroWith2Fragments,
    _$GHeroWith2Fragments
  ];
  @override
  final String wireName = 'GHeroWith2Fragments';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWith2Fragments object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroWith2FragmentsVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroWith2Fragments deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWith2FragmentsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GHeroWith2FragmentsVars))!
              as _i3.GHeroWith2FragmentsVars);
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

class _$GHeroWith2Fragments extends GHeroWith2Fragments {
  @override
  final _i3.GHeroWith2FragmentsVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroWith2Fragments(
          [void Function(GHeroWith2FragmentsBuilder)? updates]) =>
      (new GHeroWith2FragmentsBuilder()..update(updates))._build();

  _$GHeroWith2Fragments._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, r'GHeroWith2Fragments', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroWith2Fragments', 'operation');
  }

  @override
  GHeroWith2Fragments rebuild(
          void Function(GHeroWith2FragmentsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWith2FragmentsBuilder toBuilder() =>
      new GHeroWith2FragmentsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWith2Fragments &&
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
    return (newBuiltValueToStringHelper(r'GHeroWith2Fragments')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroWith2FragmentsBuilder
    implements Builder<GHeroWith2Fragments, GHeroWith2FragmentsBuilder> {
  _$GHeroWith2Fragments? _$v;

  _i3.GHeroWith2FragmentsVarsBuilder? _vars;
  _i3.GHeroWith2FragmentsVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroWith2FragmentsVarsBuilder();
  set vars(_i3.GHeroWith2FragmentsVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroWith2FragmentsBuilder() {
    GHeroWith2Fragments._initializeBuilder(this);
  }

  GHeroWith2FragmentsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWith2Fragments other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWith2Fragments;
  }

  @override
  void update(void Function(GHeroWith2FragmentsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWith2Fragments build() => _build();

  _$GHeroWith2Fragments _build() {
    _$GHeroWith2Fragments _$result;
    try {
      _$result = _$v ??
          new _$GHeroWith2Fragments._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GHeroWith2Fragments', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWith2Fragments', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
