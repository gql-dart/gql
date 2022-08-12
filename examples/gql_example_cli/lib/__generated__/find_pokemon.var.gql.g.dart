// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'find_pokemon.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFindPokemonVars> _$gFindPokemonVarsSerializer =
    new _$GFindPokemonVarsSerializer();

class _$GFindPokemonVarsSerializer
    implements StructuredSerializer<GFindPokemonVars> {
  @override
  final Iterable<Type> types = const [GFindPokemonVars, _$GFindPokemonVars];
  @override
  final String wireName = 'GFindPokemonVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GFindPokemonVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GFindPokemonVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GFindPokemonVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GFindPokemonVars extends GFindPokemonVars {
  @override
  final String name;

  factory _$GFindPokemonVars(
          [void Function(GFindPokemonVarsBuilder)? updates]) =>
      (new GFindPokemonVarsBuilder()..update(updates))._build();

  _$GFindPokemonVars._({required this.name}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'GFindPokemonVars', 'name');
  }

  @override
  GFindPokemonVars rebuild(void Function(GFindPokemonVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFindPokemonVarsBuilder toBuilder() =>
      new GFindPokemonVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFindPokemonVars && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GFindPokemonVars')..add('name', name))
        .toString();
  }
}

class GFindPokemonVarsBuilder
    implements Builder<GFindPokemonVars, GFindPokemonVarsBuilder> {
  _$GFindPokemonVars? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GFindPokemonVarsBuilder();

  GFindPokemonVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GFindPokemonVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFindPokemonVars;
  }

  @override
  void update(void Function(GFindPokemonVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GFindPokemonVars build() => _build();

  _$GFindPokemonVars _build() {
    final _$result = _$v ??
        new _$GFindPokemonVars._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GFindPokemonVars', 'name'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
