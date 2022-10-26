// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_with_duplicated_fields_due_to_fragments.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithFragmentsDuplication>
    _$gHeroWithFragmentsDuplicationSerializer =
    new _$GHeroWithFragmentsDuplicationSerializer();

class _$GHeroWithFragmentsDuplicationSerializer
    implements StructuredSerializer<GHeroWithFragmentsDuplication> {
  @override
  final Iterable<Type> types = const [
    GHeroWithFragmentsDuplication,
    _$GHeroWithFragmentsDuplication
  ];
  @override
  final String wireName = 'GHeroWithFragmentsDuplication';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithFragmentsDuplication object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GHeroWithFragmentsDuplicationVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GHeroWithFragmentsDuplication deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithFragmentsDuplicationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(_i3.GHeroWithFragmentsDuplicationVars))!
              as _i3.GHeroWithFragmentsDuplicationVars);
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

class _$GHeroWithFragmentsDuplication extends GHeroWithFragmentsDuplication {
  @override
  final _i3.GHeroWithFragmentsDuplicationVars vars;
  @override
  final _i1.Operation operation;

  factory _$GHeroWithFragmentsDuplication(
          [void Function(GHeroWithFragmentsDuplicationBuilder)? updates]) =>
      (new GHeroWithFragmentsDuplicationBuilder()..update(updates))._build();

  _$GHeroWithFragmentsDuplication._(
      {required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        vars, r'GHeroWithFragmentsDuplication', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, r'GHeroWithFragmentsDuplication', 'operation');
  }

  @override
  GHeroWithFragmentsDuplication rebuild(
          void Function(GHeroWithFragmentsDuplicationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithFragmentsDuplicationBuilder toBuilder() =>
      new GHeroWithFragmentsDuplicationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithFragmentsDuplication &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroWithFragmentsDuplication')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GHeroWithFragmentsDuplicationBuilder
    implements
        Builder<GHeroWithFragmentsDuplication,
            GHeroWithFragmentsDuplicationBuilder> {
  _$GHeroWithFragmentsDuplication? _$v;

  _i3.GHeroWithFragmentsDuplicationVarsBuilder? _vars;
  _i3.GHeroWithFragmentsDuplicationVarsBuilder get vars =>
      _$this._vars ??= new _i3.GHeroWithFragmentsDuplicationVarsBuilder();
  set vars(_i3.GHeroWithFragmentsDuplicationVarsBuilder? vars) =>
      _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GHeroWithFragmentsDuplicationBuilder() {
    GHeroWithFragmentsDuplication._initializeBuilder(this);
  }

  GHeroWithFragmentsDuplicationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithFragmentsDuplication other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithFragmentsDuplication;
  }

  @override
  void update(void Function(GHeroWithFragmentsDuplicationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithFragmentsDuplication build() => _build();

  _$GHeroWithFragmentsDuplication _build() {
    _$GHeroWithFragmentsDuplication _$result;
    try {
      _$result = _$v ??
          new _$GHeroWithFragmentsDuplication._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, r'GHeroWithFragmentsDuplication', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GHeroWithFragmentsDuplication', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
