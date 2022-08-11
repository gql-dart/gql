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
    return $jf($jc(0, count.hashCode));
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
