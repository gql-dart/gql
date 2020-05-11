// GENERATED CODE - DO NOT MODIFY BY HAND

class $Shape {
  const $Shape(this.data);

  final Map<String, dynamic> data;

  $Shape$shape get shape => data['shape'] == null
      ? null
      : $Shape$shape((data['shape'] as Map<String, dynamic>));
}

class $Shape$shape {
  const $Shape$shape.fromData(this.data);

  factory $Shape$shape(data) {
    switch (data['__typename']) {
      case "Square":
        return $Shape$shape$asSquare(data);
      case "Rectangle":
        return $Shape$shape$asRectangle(data);
      default:
        return $Shape$shape.fromData(data);
    }
  }

  final Map<String, dynamic> data;

  String get $__typename => (data['__typename'] as String);
  double get area => data['area']?.toDouble();
}

class $Shape$shape$asSquare implements $Shape$shape {
  const $Shape$shape$asSquare(this.data);

  final Map<String, dynamic> data;

  String get $__typename => (data['__typename'] as String);
  double get area => data['area']?.toDouble();
  double get sideLength => data['sideLength']?.toDouble();
}

class $Shape$shape$asRectangle implements $Shape$shape {
  const $Shape$shape$asRectangle(this.data);

  final Map<String, dynamic> data;

  String get $__typename => (data['__typename'] as String);
  double get area => data['area']?.toDouble();
  double get sideLengthA => data['sideLengthA']?.toDouble();
  double get sideLengthB => data['sideLengthB']?.toDouble();
}
