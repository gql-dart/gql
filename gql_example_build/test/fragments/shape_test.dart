import "package:gql_example_build/fragments/shape.data.gql.dart";
import "package:test/test.dart";

String getShapeInfo($Shape data) {
  final shape = data.shape;
  final type = shape.$__typename;
  final area = shape.area;

  if (shape is $Shape$shape$asSquare) {
    return "$type(area: $area, sideLength: ${shape.sideLength})";
  }

  if (shape is $Shape$shape$asRectangle) {
    return "$type(area: $area, sideLengthA: ${shape.sideLengthA}, sideLengthB: ${shape.sideLengthB})";
  }
}

String getShapeInfoNoRefs($Shape data) {
  final shape = data.shape;
  final type = shape.$__typename;
  final area = shape.area;

  final square = shape.asSquare();
  if (square != null) {
    return "$type(area: $area, sideLength: ${square.sideLength})";
  }

  final rectangle = shape.asRectangle();
  if (rectangle != null) {
    return "$type(area: $area, sideLengthA: ${rectangle.sideLengthA}, sideLengthB: ${rectangle.sideLengthB})";
  }
}

void main() {
  group("shape", () {
    test("square", () async {
      const shapeData = <String, dynamic>{
        "shape": <String, dynamic>{
          "__typename": "Square",
          "area": 4,
          "sideLength": 2,
        },
      };

      expect(
        getShapeInfo($Shape(shapeData)),
        "Square(area: 4.0, sideLength: 2.0)",
      );
    });

    test("rectangle", () async {
      const shapeData = <String, dynamic>{
        "shape": <String, dynamic>{
          "__typename": "Rectangle",
          "area": 3,
          "sideLengthA": 3,
          "sideLengthB": 1,
        },
      };

      expect(
        getShapeInfo($Shape(shapeData)),
        "Rectangle(area: 3.0, sideLengthA: 3.0, sideLengthB: 1.0)",
      );
    });
  });

  group("shape without ref to generated classes", () {
    test("square", () async {
      const shapeData = <String, dynamic>{
        "shape": <String, dynamic>{
          "__typename": "Square",
          "area": 4,
          "sideLength": 2,
        },
      };

      expect(
        getShapeInfoNoRefs($Shape(shapeData)),
        "Square(area: 4.0, sideLength: 2.0)",
      );
    });

    test("rectangle", () async {
      const shapeData = <String, dynamic>{
        "shape": <String, dynamic>{
          "__typename": "Rectangle",
          "area": 3,
          "sideLengthA": 3,
          "sideLengthB": 1,
        },
      };

      expect(
        getShapeInfoNoRefs($Shape(shapeData)),
        "Rectangle(area: 3.0, sideLengthA: 3.0, sideLengthB: 1.0)",
      );
    });
  });
}
