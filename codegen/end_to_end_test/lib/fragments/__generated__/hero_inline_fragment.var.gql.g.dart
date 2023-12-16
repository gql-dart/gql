// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_inline_fragment.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroWithInlineFragmentsVars>
    _$gHeroWithInlineFragmentsVarsSerializer =
    new _$GHeroWithInlineFragmentsVarsSerializer();

class _$GHeroWithInlineFragmentsVarsSerializer
    implements StructuredSerializer<GHeroWithInlineFragmentsVars> {
  @override
  final Iterable<Type> types = const [
    GHeroWithInlineFragmentsVars,
    _$GHeroWithInlineFragmentsVars
  ];
  @override
  final String wireName = 'GHeroWithInlineFragmentsVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroWithInlineFragmentsVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'skipName',
      serializers.serialize(object.skipName,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GHeroWithInlineFragmentsVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroWithInlineFragmentsVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'skipName':
          result.skipName = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroWithInlineFragmentsVars extends GHeroWithInlineFragmentsVars {
  @override
  final bool skipName;

  factory _$GHeroWithInlineFragmentsVars(
          [void Function(GHeroWithInlineFragmentsVarsBuilder)? updates]) =>
      (new GHeroWithInlineFragmentsVarsBuilder()..update(updates))._build();

  _$GHeroWithInlineFragmentsVars._({required this.skipName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        skipName, r'GHeroWithInlineFragmentsVars', 'skipName');
  }

  @override
  GHeroWithInlineFragmentsVars rebuild(
          void Function(GHeroWithInlineFragmentsVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroWithInlineFragmentsVarsBuilder toBuilder() =>
      new GHeroWithInlineFragmentsVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroWithInlineFragmentsVars && skipName == other.skipName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, skipName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroWithInlineFragmentsVars')
          ..add('skipName', skipName))
        .toString();
  }
}

class GHeroWithInlineFragmentsVarsBuilder
    implements
        Builder<GHeroWithInlineFragmentsVars,
            GHeroWithInlineFragmentsVarsBuilder> {
  _$GHeroWithInlineFragmentsVars? _$v;

  bool? _skipName;
  bool? get skipName => _$this._skipName;
  set skipName(bool? skipName) => _$this._skipName = skipName;

  GHeroWithInlineFragmentsVarsBuilder();

  GHeroWithInlineFragmentsVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skipName = $v.skipName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroWithInlineFragmentsVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroWithInlineFragmentsVars;
  }

  @override
  void update(void Function(GHeroWithInlineFragmentsVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroWithInlineFragmentsVars build() => _build();

  _$GHeroWithInlineFragmentsVars _build() {
    final _$result = _$v ??
        new _$GHeroWithInlineFragmentsVars._(
            skipName: BuiltValueNullFieldError.checkNotNull(
                skipName, r'GHeroWithInlineFragmentsVars', 'skipName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
