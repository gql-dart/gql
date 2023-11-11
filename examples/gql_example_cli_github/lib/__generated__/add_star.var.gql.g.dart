// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_star.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GAddStarVars> _$gAddStarVarsSerializer =
    new _$GAddStarVarsSerializer();

class _$GAddStarVarsSerializer implements StructuredSerializer<GAddStarVars> {
  @override
  final Iterable<Type> types = const [GAddStarVars, _$GAddStarVars];
  @override
  final String wireName = 'GAddStarVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GAddStarVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'starrableId',
      serializers.serialize(object.starrableId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAddStarVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddStarVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'starrableId':
          result.starrableId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAddStarVars extends GAddStarVars {
  @override
  final String starrableId;

  factory _$GAddStarVars([void Function(GAddStarVarsBuilder)? updates]) =>
      (new GAddStarVarsBuilder()..update(updates))._build();

  _$GAddStarVars._({required this.starrableId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        starrableId, r'GAddStarVars', 'starrableId');
  }

  @override
  GAddStarVars rebuild(void Function(GAddStarVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GAddStarVarsBuilder toBuilder() => new GAddStarVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GAddStarVars && starrableId == other.starrableId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, starrableId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GAddStarVars')
          ..add('starrableId', starrableId))
        .toString();
  }
}

class GAddStarVarsBuilder
    implements Builder<GAddStarVars, GAddStarVarsBuilder> {
  _$GAddStarVars? _$v;

  String? _starrableId;
  String? get starrableId => _$this._starrableId;
  set starrableId(String? starrableId) => _$this._starrableId = starrableId;

  GAddStarVarsBuilder();

  GAddStarVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _starrableId = $v.starrableId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddStarVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GAddStarVars;
  }

  @override
  void update(void Function(GAddStarVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GAddStarVars build() => _build();

  _$GAddStarVars _build() {
    final _$result = _$v ??
        new _$GAddStarVars._(
            starrableId: BuiltValueNullFieldError.checkNotNull(
                starrableId, r'GAddStarVars', 'starrableId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
