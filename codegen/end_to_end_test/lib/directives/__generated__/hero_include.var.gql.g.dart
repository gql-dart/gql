// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_include.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroIncludeVars> _$gHeroIncludeVarsSerializer =
    new _$GHeroIncludeVarsSerializer();

class _$GHeroIncludeVarsSerializer
    implements StructuredSerializer<GHeroIncludeVars> {
  @override
  final Iterable<Type> types = const [GHeroIncludeVars, _$GHeroIncludeVars];
  @override
  final String wireName = 'GHeroIncludeVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroIncludeVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'includeId',
      serializers.serialize(object.includeId,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GHeroIncludeVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroIncludeVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'includeId':
          result.includeId = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroIncludeVars extends GHeroIncludeVars {
  @override
  final bool includeId;

  factory _$GHeroIncludeVars(
          [void Function(GHeroIncludeVarsBuilder)? updates]) =>
      (new GHeroIncludeVarsBuilder()..update(updates))._build();

  _$GHeroIncludeVars._({required this.includeId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        includeId, r'GHeroIncludeVars', 'includeId');
  }

  @override
  GHeroIncludeVars rebuild(void Function(GHeroIncludeVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroIncludeVarsBuilder toBuilder() =>
      new GHeroIncludeVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroIncludeVars && includeId == other.includeId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, includeId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroIncludeVars')
          ..add('includeId', includeId))
        .toString();
  }
}

class GHeroIncludeVarsBuilder
    implements Builder<GHeroIncludeVars, GHeroIncludeVarsBuilder> {
  _$GHeroIncludeVars? _$v;

  bool? _includeId;
  bool? get includeId => _$this._includeId;
  set includeId(bool? includeId) => _$this._includeId = includeId;

  GHeroIncludeVarsBuilder();

  GHeroIncludeVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _includeId = $v.includeId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroIncludeVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroIncludeVars;
  }

  @override
  void update(void Function(GHeroIncludeVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroIncludeVars build() => _build();

  _$GHeroIncludeVars _build() {
    final _$result = _$v ??
        new _$GHeroIncludeVars._(
            includeId: BuiltValueNullFieldError.checkNotNull(
                includeId, r'GHeroIncludeVars', 'includeId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
