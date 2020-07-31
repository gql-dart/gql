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
  Iterable<Object> serialize(Serializers serializers, GAddStarVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'starrableId',
      serializers.serialize(object.starrableId,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GAddStarVars deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GAddStarVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'starrableId':
          result.starrableId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GAddStarVars extends GAddStarVars {
  @override
  final String starrableId;

  factory _$GAddStarVars([void Function(GAddStarVarsBuilder) updates]) =>
      (new GAddStarVarsBuilder()..update(updates)).build();

  _$GAddStarVars._({this.starrableId}) : super._() {
    if (starrableId == null) {
      throw new BuiltValueNullFieldError('GAddStarVars', 'starrableId');
    }
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
    return $jf($jc(0, starrableId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GAddStarVars')
          ..add('starrableId', starrableId))
        .toString();
  }
}

class GAddStarVarsBuilder
    implements Builder<GAddStarVars, GAddStarVarsBuilder> {
  _$GAddStarVars _$v;

  String _starrableId;
  String get starrableId => _$this._starrableId;
  set starrableId(String starrableId) => _$this._starrableId = starrableId;

  GAddStarVarsBuilder();

  GAddStarVarsBuilder get _$this {
    if (_$v != null) {
      _starrableId = _$v.starrableId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GAddStarVars other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GAddStarVars;
  }

  @override
  void update(void Function(GAddStarVarsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GAddStarVars build() {
    final _$result = _$v ?? new _$GAddStarVars._(starrableId: starrableId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
