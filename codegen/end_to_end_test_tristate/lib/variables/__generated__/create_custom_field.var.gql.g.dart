// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_custom_field.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GCreateCustomFieldVars extends GCreateCustomFieldVars {
  @override
  final _i1.GCustomFieldInput input;

  factory _$GCreateCustomFieldVars(
          [void Function(GCreateCustomFieldVarsBuilder)? updates]) =>
      (GCreateCustomFieldVarsBuilder()..update(updates))._build();

  _$GCreateCustomFieldVars._({required this.input}) : super._();
  @override
  GCreateCustomFieldVars rebuild(
          void Function(GCreateCustomFieldVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GCreateCustomFieldVarsBuilder toBuilder() =>
      GCreateCustomFieldVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GCreateCustomFieldVars && input == other.input;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, input.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GCreateCustomFieldVars')
          ..add('input', input))
        .toString();
  }
}

class GCreateCustomFieldVarsBuilder
    implements Builder<GCreateCustomFieldVars, GCreateCustomFieldVarsBuilder> {
  _$GCreateCustomFieldVars? _$v;

  _i1.GCustomFieldInputBuilder? _input;
  _i1.GCustomFieldInputBuilder get input =>
      _$this._input ??= _i1.GCustomFieldInputBuilder();
  set input(_i1.GCustomFieldInputBuilder? input) => _$this._input = input;

  GCreateCustomFieldVarsBuilder();

  GCreateCustomFieldVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _input = $v.input.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GCreateCustomFieldVars other) {
    _$v = other as _$GCreateCustomFieldVars;
  }

  @override
  void update(void Function(GCreateCustomFieldVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GCreateCustomFieldVars build() => _build();

  _$GCreateCustomFieldVars _build() {
    _$GCreateCustomFieldVars _$result;
    try {
      _$result = _$v ??
          _$GCreateCustomFieldVars._(
            input: input.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'input';
        input.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GCreateCustomFieldVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
