// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pokemon.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAllPokemonVars> _$gAllPokemonVarsSerializer =
    new _$GAllPokemonVarsSerializer();

class _$GAllPokemonVarsSerializer
    implements StructuredSerializer<GAllPokemonVars> {
  @override
  final Iterable<Type> types = const [GAllPokemonVars, _$GAllPokemonVars];
  @override
  final String wireName = 'GAllPokemonVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAllPokemonVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'first',
      serializers.serialize(object.first, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GAllPokemonVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAllPokemonVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'first':
          result.first = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GAllPokemonVars extends GAllPokemonVars {
  @override
  final int first;

  factory _$GAllPokemonVars([void Function(GAllPokemonVarsBuilder)? updates]) =>
      (new GAllPokemonVarsBuilder()..update(updates))._build();

  _$GAllPokemonVars._({required this.first}) : super._() {
    BuiltValueNullFieldError.checkNotNull(first, r'GAllPokemonVars', 'first');
  }

  @override
  GAllPokemonVars rebuild(void Function(GAllPokemonVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAllPokemonVarsBuilder toBuilder() =>
      new GAllPokemonVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAllPokemonVars && first == other.first;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, first.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAllPokemonVars')
          ..add('first', first))
        .toString();
  }
}

class GAllPokemonVarsBuilder
    implements Builder<GAllPokemonVars, GAllPokemonVarsBuilder> {
  _$GAllPokemonVars? _$v;

  int? _first;
  int? get first => _$this._first;
  set first(int? first) => _$this._first = first;

  GAllPokemonVarsBuilder();

  GAllPokemonVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _first = $v.first;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAllPokemonVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAllPokemonVars;
  }

  @override
  void update(void Function(GAllPokemonVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAllPokemonVars build() => _build();

  _$GAllPokemonVars _build() {
    final _$result = _$v ??
        new _$GAllPokemonVars._(
            first: BuiltValueNullFieldError.checkNotNull(
                first, r'GAllPokemonVars', 'first'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
