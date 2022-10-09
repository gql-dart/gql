// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_skip.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroSkipVars> _$gHeroSkipVarsSerializer =
    new _$GHeroSkipVarsSerializer();

class _$GHeroSkipVarsSerializer implements StructuredSerializer<GHeroSkipVars> {
  @override
  final Iterable<Type> types = const [GHeroSkipVars, _$GHeroSkipVars];
  @override
  final String wireName = 'GHeroSkipVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroSkipVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'skipName',
      serializers.serialize(object.skipName,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GHeroSkipVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroSkipVarsBuilder();

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

class _$GHeroSkipVars extends GHeroSkipVars {
  @override
  final bool skipName;

  factory _$GHeroSkipVars([void Function(GHeroSkipVarsBuilder)? updates]) =>
      (new GHeroSkipVarsBuilder()..update(updates))._build();

  _$GHeroSkipVars._({required this.skipName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        skipName, r'GHeroSkipVars', 'skipName');
  }

  @override
  GHeroSkipVars rebuild(void Function(GHeroSkipVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroSkipVarsBuilder toBuilder() => new GHeroSkipVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroSkipVars && skipName == other.skipName;
  }

  @override
  int get hashCode {
    return $jf($jc(0, skipName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroSkipVars')
          ..add('skipName', skipName))
        .toString();
  }
}

class GHeroSkipVarsBuilder
    implements Builder<GHeroSkipVars, GHeroSkipVarsBuilder> {
  _$GHeroSkipVars? _$v;

  bool? _skipName;
  bool? get skipName => _$this._skipName;
  set skipName(bool? skipName) => _$this._skipName = skipName;

  GHeroSkipVarsBuilder();

  GHeroSkipVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skipName = $v.skipName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroSkipVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroSkipVars;
  }

  @override
  void update(void Function(GHeroSkipVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroSkipVars build() => _build();

  _$GHeroSkipVars _build() {
    final _$result = _$v ??
        new _$GHeroSkipVars._(
            skipName: BuiltValueNullFieldError.checkNotNull(
                skipName, r'GHeroSkipVars', 'skipName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
