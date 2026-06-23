// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nested_fragments_on_interface.req.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GGetBooks> _$gGetBooksSerializer = _$GGetBooksSerializer();

class _$GGetBooksSerializer implements StructuredSerializer<GGetBooks> {
  @override
  final Iterable<Type> types = const [GGetBooks, _$GGetBooks];
  @override
  final String wireName = 'GGetBooks';

  @override
  Iterable<Object?> serialize(Serializers serializers, GGetBooks object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'vars',
      serializers.serialize(object.vars,
          specifiedType: const FullType(_i3.GGetBooksVars)),
      'operation',
      serializers.serialize(object.operation,
          specifiedType: const FullType(_i1.Operation)),
    ];

    return result;
  }

  @override
  GGetBooks deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GGetBooksBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vars':
          result.vars.replace(serializers.deserialize(value,
                  specifiedType: const FullType(_i3.GGetBooksVars))!
              as _i3.GGetBooksVars);
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(_i1.Operation))! as _i1.Operation;
          break;
      }
    }

    return result.build();
  }
}

class _$GGetBooks extends GGetBooks {
  @override
  final _i3.GGetBooksVars vars;
  @override
  final _i1.Operation operation;

  factory _$GGetBooks([void Function(GGetBooksBuilder)? updates]) =>
      (GGetBooksBuilder()..update(updates))._build();

  _$GGetBooks._({required this.vars, required this.operation}) : super._();
  @override
  GGetBooks rebuild(void Function(GGetBooksBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GGetBooksBuilder toBuilder() => GGetBooksBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GGetBooks &&
        vars == other.vars &&
        operation == other.operation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vars.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GGetBooks')
          ..add('vars', vars)
          ..add('operation', operation))
        .toString();
  }
}

class GGetBooksBuilder implements Builder<GGetBooks, GGetBooksBuilder> {
  _$GGetBooks? _$v;

  _i3.GGetBooksVarsBuilder? _vars;
  _i3.GGetBooksVarsBuilder get vars =>
      _$this._vars ??= _i3.GGetBooksVarsBuilder();
  set vars(_i3.GGetBooksVarsBuilder? vars) => _$this._vars = vars;

  _i1.Operation? _operation;
  _i1.Operation? get operation => _$this._operation;
  set operation(_i1.Operation? operation) => _$this._operation = operation;

  GGetBooksBuilder() {
    GGetBooks._initializeBuilder(this);
  }

  GGetBooksBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vars = $v.vars.toBuilder();
      _operation = $v.operation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GGetBooks other) {
    _$v = other as _$GGetBooks;
  }

  @override
  void update(void Function(GGetBooksBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GGetBooks build() => _build();

  _$GGetBooks _build() {
    _$GGetBooks _$result;
    try {
      _$result = _$v ??
          _$GGetBooks._(
            vars: vars.build(),
            operation: BuiltValueNullFieldError.checkNotNull(
                operation, r'GGetBooks', 'operation'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'vars';
        vars.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GGetBooks', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
