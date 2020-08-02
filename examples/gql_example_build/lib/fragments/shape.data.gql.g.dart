// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shape.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GShapeData> _$gShapeDataSerializer = new _$GShapeDataSerializer();
Serializer<GShapeData_shape__base> _$gShapeDataShapeBaseSerializer =
    new _$GShapeData_shape__baseSerializer();
Serializer<GShapeData_shape__asSquare> _$gShapeDataShapeAsSquareSerializer =
    new _$GShapeData_shape__asSquareSerializer();
Serializer<GShapeData_shape__asRectangle>
    _$gShapeDataShapeAsRectangleSerializer =
    new _$GShapeData_shape__asRectangleSerializer();

class _$GShapeDataSerializer implements StructuredSerializer<GShapeData> {
  @override
  final Iterable<Type> types = const [GShapeData, _$GShapeData];
  @override
  final String wireName = 'GShapeData';

  @override
  Iterable<Object> serialize(Serializers serializers, GShapeData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.shape != null) {
      result
        ..add('shape')
        ..add(serializers.serialize(object.shape,
            specifiedType: const FullType(GShapeData_shape)));
    }
    return result;
  }

  @override
  GShapeData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GShapeDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'shape':
          result.shape = serializers.deserialize(value,
                  specifiedType: const FullType(GShapeData_shape))
              as GShapeData_shape;
          break;
      }
    }

    return result.build();
  }
}

class _$GShapeData_shape__baseSerializer
    implements StructuredSerializer<GShapeData_shape__base> {
  @override
  final Iterable<Type> types = const [
    GShapeData_shape__base,
    _$GShapeData_shape__base
  ];
  @override
  final String wireName = 'GShapeData_shape__base';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GShapeData_shape__base object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.area != null) {
      result
        ..add('area')
        ..add(serializers.serialize(object.area,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GShapeData_shape__base deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GShapeData_shape__baseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'area':
          result.area = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GShapeData_shape__asSquareSerializer
    implements StructuredSerializer<GShapeData_shape__asSquare> {
  @override
  final Iterable<Type> types = const [
    GShapeData_shape__asSquare,
    _$GShapeData_shape__asSquare
  ];
  @override
  final String wireName = 'GShapeData_shape__asSquare';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GShapeData_shape__asSquare object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.area != null) {
      result
        ..add('area')
        ..add(serializers.serialize(object.area,
            specifiedType: const FullType(double)));
    }
    if (object.sideLength != null) {
      result
        ..add('sideLength')
        ..add(serializers.serialize(object.sideLength,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GShapeData_shape__asSquare deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GShapeData_shape__asSquareBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'area':
          result.area = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'sideLength':
          result.sideLength = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GShapeData_shape__asRectangleSerializer
    implements StructuredSerializer<GShapeData_shape__asRectangle> {
  @override
  final Iterable<Type> types = const [
    GShapeData_shape__asRectangle,
    _$GShapeData_shape__asRectangle
  ];
  @override
  final String wireName = 'GShapeData_shape__asRectangle';

  @override
  Iterable<Object> serialize(
      Serializers serializers, GShapeData_shape__asRectangle object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    if (object.area != null) {
      result
        ..add('area')
        ..add(serializers.serialize(object.area,
            specifiedType: const FullType(double)));
    }
    if (object.sideLengthA != null) {
      result
        ..add('sideLengthA')
        ..add(serializers.serialize(object.sideLengthA,
            specifiedType: const FullType(double)));
    }
    if (object.sideLengthB != null) {
      result
        ..add('sideLengthB')
        ..add(serializers.serialize(object.sideLengthB,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  GShapeData_shape__asRectangle deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GShapeData_shape__asRectangleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'area':
          result.area = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'sideLengthA':
          result.sideLengthA = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'sideLengthB':
          result.sideLengthB = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
      }
    }

    return result.build();
  }
}

class _$GShapeData extends GShapeData {
  @override
  final GShapeData_shape shape;

  factory _$GShapeData([void Function(GShapeDataBuilder) updates]) =>
      (new GShapeDataBuilder()..update(updates)).build();

  _$GShapeData._({this.shape}) : super._();

  @override
  GShapeData rebuild(void Function(GShapeDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GShapeDataBuilder toBuilder() => new GShapeDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GShapeData && shape == other.shape;
  }

  @override
  int get hashCode {
    return $jf($jc(0, shape.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GShapeData')..add('shape', shape))
        .toString();
  }
}

class GShapeDataBuilder implements Builder<GShapeData, GShapeDataBuilder> {
  _$GShapeData _$v;

  GShapeData_shape _shape;
  GShapeData_shape get shape => _$this._shape;
  set shape(GShapeData_shape shape) => _$this._shape = shape;

  GShapeDataBuilder();

  GShapeDataBuilder get _$this {
    if (_$v != null) {
      _shape = _$v.shape;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GShapeData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GShapeData;
  }

  @override
  void update(void Function(GShapeDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GShapeData build() {
    final _$result = _$v ?? new _$GShapeData._(shape: shape);
    replace(_$result);
    return _$result;
  }
}

abstract class GShapeData_shapeBuilder {
  void replace(GShapeData_shape other);
  void update(void Function(GShapeData_shapeBuilder) updates);
  String get G__typename;
  set G__typename(String G__typename);

  double get area;
  set area(double area);
}

class _$GShapeData_shape__base extends GShapeData_shape__base {
  @override
  final String G__typename;
  @override
  final double area;

  factory _$GShapeData_shape__base(
          [void Function(GShapeData_shape__baseBuilder) updates]) =>
      (new GShapeData_shape__baseBuilder()..update(updates)).build();

  _$GShapeData_shape__base._({this.G__typename, this.area}) : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GShapeData_shape__base', 'G__typename');
    }
  }

  @override
  GShapeData_shape__base rebuild(
          void Function(GShapeData_shape__baseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GShapeData_shape__baseBuilder toBuilder() =>
      new GShapeData_shape__baseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GShapeData_shape__base &&
        G__typename == other.G__typename &&
        area == other.area;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, G__typename.hashCode), area.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GShapeData_shape__base')
          ..add('G__typename', G__typename)
          ..add('area', area))
        .toString();
  }
}

class GShapeData_shape__baseBuilder
    implements
        Builder<GShapeData_shape__base, GShapeData_shape__baseBuilder>,
        GShapeData_shapeBuilder {
  _$GShapeData_shape__base _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  double _area;
  double get area => _$this._area;
  set area(double area) => _$this._area = area;

  GShapeData_shape__baseBuilder() {
    GShapeData_shape__base._initializeBuilder(this);
  }

  GShapeData_shape__baseBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _area = _$v.area;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GShapeData_shape__base other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GShapeData_shape__base;
  }

  @override
  void update(void Function(GShapeData_shape__baseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GShapeData_shape__base build() {
    final _$result = _$v ??
        new _$GShapeData_shape__base._(G__typename: G__typename, area: area);
    replace(_$result);
    return _$result;
  }
}

class _$GShapeData_shape__asSquare extends GShapeData_shape__asSquare {
  @override
  final String G__typename;
  @override
  final double area;
  @override
  final double sideLength;

  factory _$GShapeData_shape__asSquare(
          [void Function(GShapeData_shape__asSquareBuilder) updates]) =>
      (new GShapeData_shape__asSquareBuilder()..update(updates)).build();

  _$GShapeData_shape__asSquare._({this.G__typename, this.area, this.sideLength})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GShapeData_shape__asSquare', 'G__typename');
    }
  }

  @override
  GShapeData_shape__asSquare rebuild(
          void Function(GShapeData_shape__asSquareBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GShapeData_shape__asSquareBuilder toBuilder() =>
      new GShapeData_shape__asSquareBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GShapeData_shape__asSquare &&
        G__typename == other.G__typename &&
        area == other.area &&
        sideLength == other.sideLength;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, G__typename.hashCode), area.hashCode), sideLength.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GShapeData_shape__asSquare')
          ..add('G__typename', G__typename)
          ..add('area', area)
          ..add('sideLength', sideLength))
        .toString();
  }
}

class GShapeData_shape__asSquareBuilder
    implements
        Builder<GShapeData_shape__asSquare, GShapeData_shape__asSquareBuilder>,
        GShapeData_shapeBuilder {
  _$GShapeData_shape__asSquare _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  double _area;
  double get area => _$this._area;
  set area(double area) => _$this._area = area;

  double _sideLength;
  double get sideLength => _$this._sideLength;
  set sideLength(double sideLength) => _$this._sideLength = sideLength;

  GShapeData_shape__asSquareBuilder() {
    GShapeData_shape__asSquare._initializeBuilder(this);
  }

  GShapeData_shape__asSquareBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _area = _$v.area;
      _sideLength = _$v.sideLength;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GShapeData_shape__asSquare other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GShapeData_shape__asSquare;
  }

  @override
  void update(void Function(GShapeData_shape__asSquareBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GShapeData_shape__asSquare build() {
    final _$result = _$v ??
        new _$GShapeData_shape__asSquare._(
            G__typename: G__typename, area: area, sideLength: sideLength);
    replace(_$result);
    return _$result;
  }
}

class _$GShapeData_shape__asRectangle extends GShapeData_shape__asRectangle {
  @override
  final String G__typename;
  @override
  final double area;
  @override
  final double sideLengthA;
  @override
  final double sideLengthB;

  factory _$GShapeData_shape__asRectangle(
          [void Function(GShapeData_shape__asRectangleBuilder) updates]) =>
      (new GShapeData_shape__asRectangleBuilder()..update(updates)).build();

  _$GShapeData_shape__asRectangle._(
      {this.G__typename, this.area, this.sideLengthA, this.sideLengthB})
      : super._() {
    if (G__typename == null) {
      throw new BuiltValueNullFieldError(
          'GShapeData_shape__asRectangle', 'G__typename');
    }
  }

  @override
  GShapeData_shape__asRectangle rebuild(
          void Function(GShapeData_shape__asRectangleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GShapeData_shape__asRectangleBuilder toBuilder() =>
      new GShapeData_shape__asRectangleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GShapeData_shape__asRectangle &&
        G__typename == other.G__typename &&
        area == other.area &&
        sideLengthA == other.sideLengthA &&
        sideLengthB == other.sideLengthB;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, G__typename.hashCode), area.hashCode),
            sideLengthA.hashCode),
        sideLengthB.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GShapeData_shape__asRectangle')
          ..add('G__typename', G__typename)
          ..add('area', area)
          ..add('sideLengthA', sideLengthA)
          ..add('sideLengthB', sideLengthB))
        .toString();
  }
}

class GShapeData_shape__asRectangleBuilder
    implements
        Builder<GShapeData_shape__asRectangle,
            GShapeData_shape__asRectangleBuilder>,
        GShapeData_shapeBuilder {
  _$GShapeData_shape__asRectangle _$v;

  String _G__typename;
  String get G__typename => _$this._G__typename;
  set G__typename(String G__typename) => _$this._G__typename = G__typename;

  double _area;
  double get area => _$this._area;
  set area(double area) => _$this._area = area;

  double _sideLengthA;
  double get sideLengthA => _$this._sideLengthA;
  set sideLengthA(double sideLengthA) => _$this._sideLengthA = sideLengthA;

  double _sideLengthB;
  double get sideLengthB => _$this._sideLengthB;
  set sideLengthB(double sideLengthB) => _$this._sideLengthB = sideLengthB;

  GShapeData_shape__asRectangleBuilder() {
    GShapeData_shape__asRectangle._initializeBuilder(this);
  }

  GShapeData_shape__asRectangleBuilder get _$this {
    if (_$v != null) {
      _G__typename = _$v.G__typename;
      _area = _$v.area;
      _sideLengthA = _$v.sideLengthA;
      _sideLengthB = _$v.sideLengthB;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant GShapeData_shape__asRectangle other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GShapeData_shape__asRectangle;
  }

  @override
  void update(void Function(GShapeData_shape__asRectangleBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GShapeData_shape__asRectangle build() {
    final _$result = _$v ??
        new _$GShapeData_shape__asRectangle._(
            G__typename: G__typename,
            area: area,
            sideLengthA: sideLengthA,
            sideLengthB: sideLengthB);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
