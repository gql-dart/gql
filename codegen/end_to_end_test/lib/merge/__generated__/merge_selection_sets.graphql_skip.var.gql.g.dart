// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merge_selection_sets.graphql_skip.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroMergeSkipVars> _$gHeroMergeSkipVarsSerializer =
    new _$GHeroMergeSkipVarsSerializer();

class _$GHeroMergeSkipVarsSerializer
    implements StructuredSerializer<GHeroMergeSkipVars> {
  @override
  final Iterable<Type> types = const [GHeroMergeSkipVars, _$GHeroMergeSkipVars];
  @override
  final String wireName = 'GHeroMergeSkipVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroMergeSkipVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'withName',
      serializers.serialize(object.withName,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GHeroMergeSkipVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroMergeSkipVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'withName':
          result.withName = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroMergeSkipVars extends GHeroMergeSkipVars {
  @override
  final bool withName;

  factory _$GHeroMergeSkipVars(
          [void Function(GHeroMergeSkipVarsBuilder)? updates]) =>
      (new GHeroMergeSkipVarsBuilder()..update(updates))._build();

  _$GHeroMergeSkipVars._({required this.withName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        withName, r'GHeroMergeSkipVars', 'withName');
  }

  @override
  GHeroMergeSkipVars rebuild(
          void Function(GHeroMergeSkipVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroMergeSkipVarsBuilder toBuilder() =>
      new GHeroMergeSkipVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroMergeSkipVars && withName == other.withName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, withName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroMergeSkipVars')
          ..add('withName', withName))
        .toString();
  }
}

class GHeroMergeSkipVarsBuilder
    implements Builder<GHeroMergeSkipVars, GHeroMergeSkipVarsBuilder> {
  _$GHeroMergeSkipVars? _$v;

  bool? _withName;
  bool? get withName => _$this._withName;
  set withName(bool? withName) => _$this._withName = withName;

  GHeroMergeSkipVarsBuilder();

  GHeroMergeSkipVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _withName = $v.withName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroMergeSkipVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroMergeSkipVars;
  }

  @override
  void update(void Function(GHeroMergeSkipVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroMergeSkipVars build() => _build();

  _$GHeroMergeSkipVars _build() {
    final _$result = _$v ??
        new _$GHeroMergeSkipVars._(
            withName: BuiltValueNullFieldError.checkNotNull(
                withName, r'GHeroMergeSkipVars', 'withName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
