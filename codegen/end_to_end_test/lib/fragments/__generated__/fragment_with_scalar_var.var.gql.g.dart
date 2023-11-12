// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fragment_with_scalar_var.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPostsWithFixedVariableVars>
    _$gPostsWithFixedVariableVarsSerializer =
    new _$GPostsWithFixedVariableVarsSerializer();
Serializer<GPostFragmentForUser1Vars> _$gPostFragmentForUser1VarsSerializer =
    new _$GPostFragmentForUser1VarsSerializer();

class _$GPostsWithFixedVariableVarsSerializer
    implements StructuredSerializer<GPostsWithFixedVariableVars> {
  @override
  final Iterable<Type> types = const [
    GPostsWithFixedVariableVars,
    _$GPostsWithFixedVariableVars
  ];
  @override
  final String wireName = 'GPostsWithFixedVariableVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostsWithFixedVariableVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.filter;
    if (value != null) {
      result
        ..add('filter')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(_i1.GJson)));
    }
    return result;
  }

  @override
  GPostsWithFixedVariableVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GPostsWithFixedVariableVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'filter':
          result.filter.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i1.GJson))! as _i1.GJson);
          break;
      }
    }

    return result.build();
  }
}

class _$GPostFragmentForUser1VarsSerializer
    implements StructuredSerializer<GPostFragmentForUser1Vars> {
  @override
  final Iterable<Type> types = const [
    GPostFragmentForUser1Vars,
    _$GPostFragmentForUser1Vars
  ];
  @override
  final String wireName = 'GPostFragmentForUser1Vars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPostFragmentForUser1Vars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GPostFragmentForUser1Vars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GPostFragmentForUser1VarsBuilder().build();
  }
}

class _$GPostsWithFixedVariableVars extends GPostsWithFixedVariableVars {
  @override
  final _i1.GJson? filter;

  factory _$GPostsWithFixedVariableVars(
          [void Function(GPostsWithFixedVariableVarsBuilder)? updates]) =>
      (new GPostsWithFixedVariableVarsBuilder()..update(updates))._build();

  _$GPostsWithFixedVariableVars._({this.filter}) : super._();

  @override
  GPostsWithFixedVariableVars rebuild(
          void Function(GPostsWithFixedVariableVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostsWithFixedVariableVarsBuilder toBuilder() =>
      new GPostsWithFixedVariableVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostsWithFixedVariableVars && filter == other.filter;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, filter.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPostsWithFixedVariableVars')
          ..add('filter', filter))
        .toString();
  }
}

class GPostsWithFixedVariableVarsBuilder
    implements
        Builder<GPostsWithFixedVariableVars,
            GPostsWithFixedVariableVarsBuilder> {
  _$GPostsWithFixedVariableVars? _$v;

  _i1.GJsonBuilder? _filter;
  _i1.GJsonBuilder get filter => _$this._filter ??= new _i1.GJsonBuilder();
  set filter(_i1.GJsonBuilder? filter) => _$this._filter = filter;

  GPostsWithFixedVariableVarsBuilder();

  GPostsWithFixedVariableVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _filter = $v.filter?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPostsWithFixedVariableVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostsWithFixedVariableVars;
  }

  @override
  void update(void Function(GPostsWithFixedVariableVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostsWithFixedVariableVars build() => _build();

  _$GPostsWithFixedVariableVars _build() {
    _$GPostsWithFixedVariableVars _$result;
    try {
      _$result =
          _$v ?? new _$GPostsWithFixedVariableVars._(filter: _filter?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filter';
        _filter?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GPostsWithFixedVariableVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPostFragmentForUser1Vars extends GPostFragmentForUser1Vars {
  factory _$GPostFragmentForUser1Vars(
          [void Function(GPostFragmentForUser1VarsBuilder)? updates]) =>
      (new GPostFragmentForUser1VarsBuilder()..update(updates))._build();

  _$GPostFragmentForUser1Vars._() : super._();

  @override
  GPostFragmentForUser1Vars rebuild(
          void Function(GPostFragmentForUser1VarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPostFragmentForUser1VarsBuilder toBuilder() =>
      new GPostFragmentForUser1VarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPostFragmentForUser1Vars;
  }

  @override
  int get hashCode {
    return 10256085;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GPostFragmentForUser1Vars').toString();
  }
}

class GPostFragmentForUser1VarsBuilder
    implements
        Builder<GPostFragmentForUser1Vars, GPostFragmentForUser1VarsBuilder> {
  _$GPostFragmentForUser1Vars? _$v;

  GPostFragmentForUser1VarsBuilder();

  @override
  void replace(GPostFragmentForUser1Vars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GPostFragmentForUser1Vars;
  }

  @override
  void update(void Function(GPostFragmentForUser1VarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPostFragmentForUser1Vars build() => _build();

  _$GPostFragmentForUser1Vars _build() {
    final _$result = _$v ?? new _$GPostFragmentForUser1Vars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
