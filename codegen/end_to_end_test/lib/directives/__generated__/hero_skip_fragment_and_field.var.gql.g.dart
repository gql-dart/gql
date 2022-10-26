// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_skip_fragment_and_field.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GHeroSkipFragmentVars> _$gHeroSkipFragmentVarsSerializer =
    new _$GHeroSkipFragmentVarsSerializer();
Serializer<GHeroDetailVars> _$gHeroDetailVarsSerializer =
    new _$GHeroDetailVarsSerializer();

class _$GHeroSkipFragmentVarsSerializer
    implements StructuredSerializer<GHeroSkipFragmentVars> {
  @override
  final Iterable<Type> types = const [
    GHeroSkipFragmentVars,
    _$GHeroSkipFragmentVars
  ];
  @override
  final String wireName = 'GHeroSkipFragmentVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GHeroSkipFragmentVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'skipDetails',
      serializers.serialize(object.skipDetails,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GHeroSkipFragmentVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GHeroSkipFragmentVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'skipDetails':
          result.skipDetails = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GHeroDetailVarsSerializer
    implements StructuredSerializer<GHeroDetailVars> {
  @override
  final Iterable<Type> types = const [GHeroDetailVars, _$GHeroDetailVars];
  @override
  final String wireName = 'GHeroDetailVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GHeroDetailVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GHeroDetailVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GHeroDetailVarsBuilder().build();
  }
}

class _$GHeroSkipFragmentVars extends GHeroSkipFragmentVars {
  @override
  final bool skipDetails;

  factory _$GHeroSkipFragmentVars(
          [void Function(GHeroSkipFragmentVarsBuilder)? updates]) =>
      (new GHeroSkipFragmentVarsBuilder()..update(updates))._build();

  _$GHeroSkipFragmentVars._({required this.skipDetails}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        skipDetails, r'GHeroSkipFragmentVars', 'skipDetails');
  }

  @override
  GHeroSkipFragmentVars rebuild(
          void Function(GHeroSkipFragmentVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroSkipFragmentVarsBuilder toBuilder() =>
      new GHeroSkipFragmentVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroSkipFragmentVars && skipDetails == other.skipDetails;
  }

  @override
  int get hashCode {
    return $jf($jc(0, skipDetails.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GHeroSkipFragmentVars')
          ..add('skipDetails', skipDetails))
        .toString();
  }
}

class GHeroSkipFragmentVarsBuilder
    implements Builder<GHeroSkipFragmentVars, GHeroSkipFragmentVarsBuilder> {
  _$GHeroSkipFragmentVars? _$v;

  bool? _skipDetails;
  bool? get skipDetails => _$this._skipDetails;
  set skipDetails(bool? skipDetails) => _$this._skipDetails = skipDetails;

  GHeroSkipFragmentVarsBuilder();

  GHeroSkipFragmentVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _skipDetails = $v.skipDetails;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GHeroSkipFragmentVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroSkipFragmentVars;
  }

  @override
  void update(void Function(GHeroSkipFragmentVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroSkipFragmentVars build() => _build();

  _$GHeroSkipFragmentVars _build() {
    final _$result = _$v ??
        new _$GHeroSkipFragmentVars._(
            skipDetails: BuiltValueNullFieldError.checkNotNull(
                skipDetails, r'GHeroSkipFragmentVars', 'skipDetails'));
    replace(_$result);
    return _$result;
  }
}

class _$GHeroDetailVars extends GHeroDetailVars {
  factory _$GHeroDetailVars([void Function(GHeroDetailVarsBuilder)? updates]) =>
      (new GHeroDetailVarsBuilder()..update(updates))._build();

  _$GHeroDetailVars._() : super._();

  @override
  GHeroDetailVars rebuild(void Function(GHeroDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GHeroDetailVarsBuilder toBuilder() =>
      new GHeroDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GHeroDetailVars;
  }

  @override
  int get hashCode {
    return 140740630;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'GHeroDetailVars').toString();
  }
}

class GHeroDetailVarsBuilder
    implements Builder<GHeroDetailVars, GHeroDetailVarsBuilder> {
  _$GHeroDetailVars? _$v;

  GHeroDetailVarsBuilder();

  @override
  void replace(GHeroDetailVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GHeroDetailVars;
  }

  @override
  void update(void Function(GHeroDetailVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GHeroDetailVars build() => _build();

  _$GHeroDetailVars _build() {
    final _$result = _$v ?? new _$GHeroDetailVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
