// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_star.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GRemoveStarVars> _$gRemoveStarVarsSerializer =
    new _$GRemoveStarVarsSerializer();

class _$GRemoveStarVarsSerializer
    implements StructuredSerializer<GRemoveStarVars> {
  @override
  final Iterable<Type> types = const [GRemoveStarVars, _$GRemoveStarVars];
  @override
  final String wireName = 'GRemoveStarVars';

  @override
  Iterable<Object?> serialize(Serializers serializers, GRemoveStarVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'starrableId',
      serializers.serialize(object.starrableId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GRemoveStarVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GRemoveStarVarsBuilder();

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

class _$GRemoveStarVars extends GRemoveStarVars {
  @override
  final String starrableId;

  factory _$GRemoveStarVars([void Function(GRemoveStarVarsBuilder)? updates]) =>
      (new GRemoveStarVarsBuilder()..update(updates))._build();

  _$GRemoveStarVars._({required this.starrableId}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        starrableId, r'GRemoveStarVars', 'starrableId');
  }

  @override
  GRemoveStarVars rebuild(void Function(GRemoveStarVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GRemoveStarVarsBuilder toBuilder() =>
      new GRemoveStarVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GRemoveStarVars && starrableId == other.starrableId;
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
    return (newBuiltValueToStringHelper(r'GRemoveStarVars')
          ..add('starrableId', starrableId))
        .toString();
  }
}

class GRemoveStarVarsBuilder
    implements Builder<GRemoveStarVars, GRemoveStarVarsBuilder> {
  _$GRemoveStarVars? _$v;

  String? _starrableId;
  String? get starrableId => _$this._starrableId;
  set starrableId(String? starrableId) => _$this._starrableId = starrableId;

  GRemoveStarVarsBuilder();

  GRemoveStarVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _starrableId = $v.starrableId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GRemoveStarVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GRemoveStarVars;
  }

  @override
  void update(void Function(GRemoveStarVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GRemoveStarVars build() => _build();

  _$GRemoveStarVars _build() {
    final _$result = _$v ??
        new _$GRemoveStarVars._(
            starrableId: BuiltValueNullFieldError.checkNotNull(
                starrableId, r'GRemoveStarVars', 'starrableId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
