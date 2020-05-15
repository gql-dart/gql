// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pokemon.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllPokemonVars> _$allPokemonVarsSerializer =
    new _$AllPokemonVarsSerializer();

class _$AllPokemonVarsSerializer
    implements StructuredSerializer<AllPokemonVars> {
  @override
  final Iterable<Type> types = const [AllPokemonVars, _$AllPokemonVars];
  @override
  final String wireName = 'AllPokemonVars';

  @override
  Iterable<Object> serialize(Serializers serializers, AllPokemonVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'first',
      serializers.serialize(object.first, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  AllPokemonVars deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllPokemonVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$AllPokemonVars extends AllPokemonVars {
  @override
  final int first;

  factory _$AllPokemonVars([void Function(AllPokemonVarsBuilder) updates]) =>
      (new AllPokemonVarsBuilder()..update(updates)).build();

  _$AllPokemonVars._({this.first}) : super._() {
    if (first == null) {
      throw new BuiltValueNullFieldError('AllPokemonVars', 'first');
    }
  }

  @override
  AllPokemonVars rebuild(void Function(AllPokemonVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllPokemonVarsBuilder toBuilder() =>
      new AllPokemonVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllPokemonVars && first == other.first;
  }

  @override
  int get hashCode {
    return $jf($jc(0, first.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AllPokemonVars')..add('first', first))
        .toString();
  }
}

class AllPokemonVarsBuilder
    implements Builder<AllPokemonVars, AllPokemonVarsBuilder> {
  _$AllPokemonVars _$v;

  int _first;
  int get first => _$this._first;
  set first(int first) => _$this._first = first;

  AllPokemonVarsBuilder();

  AllPokemonVarsBuilder get _$this {
    if (_$v != null) {
      _first = _$v.first;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllPokemonVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AllPokemonVars;
  }

  @override
  void update(void Function(AllPokemonVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AllPokemonVars build() {
    final _$result = _$v ?? new _$AllPokemonVars._(first: first);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
