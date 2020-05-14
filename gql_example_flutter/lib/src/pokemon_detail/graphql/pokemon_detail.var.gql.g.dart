// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PokemonDetailVars extends PokemonDetailVars {
  @override
  final String id;
  @override
  final String name;

  factory _$PokemonDetailVars(
          [void Function(PokemonDetailVarsBuilder) updates]) =>
      (new PokemonDetailVarsBuilder()..update(updates)).build();

  _$PokemonDetailVars._({this.id, this.name}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('PokemonDetailVars', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('PokemonDetailVars', 'name');
    }
  }

  @override
  PokemonDetailVars rebuild(void Function(PokemonDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonDetailVarsBuilder toBuilder() =>
      new PokemonDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonDetailVars && id == other.id && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PokemonDetailVars')
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class PokemonDetailVarsBuilder
    implements Builder<PokemonDetailVars, PokemonDetailVarsBuilder> {
  _$PokemonDetailVars _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  PokemonDetailVarsBuilder();

  PokemonDetailVarsBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonDetailVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PokemonDetailVars;
  }

  @override
  void update(void Function(PokemonDetailVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PokemonDetailVars build() {
    final _$result = _$v ?? new _$PokemonDetailVars._(id: id, name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
