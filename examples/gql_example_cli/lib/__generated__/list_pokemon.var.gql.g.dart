// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_pokemon.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GListPokemonVars> _$gListPokemonVarsSerializer =
    new _$GListPokemonVarsSerializer();

class _$GListPokemonVarsSerializer
    implements StructuredSerializer<GListPokemonVars> {
  @override
  final Iterable<Type> types = const [GListPokemonVars, _$GListPokemonVars];
  @override
  final String wireName = 'GListPokemonVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GListPokemonVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GListPokemonVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GListPokemonVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GListPokemonVars extends GListPokemonVars {
  @override
  final int count;

  factory _$GListPokemonVars(
          [void Function(GListPokemonVarsBuilder)? updates]) =>
      (new GListPokemonVarsBuilder()..update(updates))._build();

  _$GListPokemonVars._({required this.count}) : super._() {
    BuiltValueNullFieldError.checkNotNull(count, r'GListPokemonVars', 'count');
  }

  @override
  GListPokemonVars rebuild(void Function(GListPokemonVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GListPokemonVarsBuilder toBuilder() =>
      new GListPokemonVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GListPokemonVars && count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GListPokemonVars')
          ..add('count', count))
        .toString();
  }
}

class GListPokemonVarsBuilder
    implements Builder<GListPokemonVars, GListPokemonVarsBuilder> {
  _$GListPokemonVars? _$v;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GListPokemonVarsBuilder();

  GListPokemonVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GListPokemonVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GListPokemonVars;
  }

  @override
  void update(void Function(GListPokemonVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GListPokemonVars build() => _build();

  _$GListPokemonVars _build() {
    final _$result = _$v ??
        new _$GListPokemonVars._(
            count: BuiltValueNullFieldError.checkNotNull(
                count, r'GListPokemonVars', 'count'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
