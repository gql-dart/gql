// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_repos.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GReadRepositories> _$gReadRepositoriesSerializer =
    new _$GReadRepositoriesSerializer();

class _$GReadRepositoriesSerializer
    implements StructuredSerializer<GReadRepositories> {
  @override
  final Iterable<Type> types = const [GReadRepositories, _$GReadRepositories];
  @override
  final String wireName = 'GReadRepositories';

  @override
  Iterable<Object?> serialize(Serializers serializers, GReadRepositories object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GReadRepositoriesVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GReadRepositories deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GReadRepositoriesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GReadRepositoriesVars))!
              as _i3.GReadRepositoriesVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i1.Operation)) as _i1.Operation;
          break;
      }
    }

    return result.build();
  }
}

class _$GReadRepositories extends GReadRepositories {
  @override
  final _i3.GReadRepositoriesVars vars;
  @override
  final _i1.Operation operation;

  factory _$GReadRepositories(
          [void Function(GReadRepositoriesBuilder)? updates]) =>
      (new GReadRepositoriesBuilder()..update(updates)).build();

  _$GReadRepositories._({required this.vars, required this.operation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(vars, 'GReadRepositories', 'vars');
    BuiltValueNullFieldError.checkNotNull(
        operation, 'GReadRepositories', 'operation');
  }

  @override
  GReadRepositories rebuild(void Function(GReadRepositoriesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GReadRepositoriesBuilder toBuilder() =>
      new GReadRepositoriesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GReadRepositories &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, vars.hashCode), operation.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GReadRepositories')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GReadRepositoriesBuilder
    implements Builder<GReadRepositories, GReadRepositoriesBuilder> {
  _$GReadRepositories? _$v;

  _i3.GReadRepositoriesVarsBuilder? _vars;
  _i3.GReadRepositoriesVarsBuilder get vars =>
      _$this._vars ??= new _i3.GReadRepositoriesVarsBuilder();
  set vars(_i3.GReadRepositoriesVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GReadRepositoriesBuilder() {
    GReadRepositories._initializeBuilder(this);
  }

  GReadRepositoriesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GReadRepositories other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GReadRepositories;
  }

  @override
  void update(void Function(GReadRepositoriesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GReadRepositories build() {
    _$GReadRepositories _$result;
    try {
      _$result = _$v ??
          new _$GReadRepositories._(
              vars: vars.build(),
              operation: BuiltValueNullFieldError.checkNotNull(
                  operation, 'GReadRepositories', 'operation'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GReadRepositories', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
