import "package:gql_example_build/fragments/__generated__/shape.data.gql.dart";
import "package:test/test.dart";

String? getShapeInfo(GShapeData data) {
  final shape = data.shape;
  final type = shape?.G__typename;
  final area = shape?.area;

  if (shape is GShapeData_shape__asSquare) {
    return "$type(area: $area, sideLength: ${shape.sideLength})";
  }

  if (shape is GShapeData_shape__asRectangle) {
    return "$type(area: $area, sideLengthA: ${shape.sideLengthA}, sideLengthB: ${shape.sideLengthB})";
  }
  return null;
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
        getShapeInfo(GShapeData.fromJson(shapeData)!),
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
        getShapeInfo(GShapeData.fromJson(shapeData)!),
        "Rectangle(area: 3.0, sideLengthA: 3.0, sideLengthB: 1.0)",
      );
    });
  });

  group("when()", () {
    test("square", () {
      const shapeData = <String, dynamic>{
        "shape": <String, dynamic>{
          "__typename": "Square",
          "area": 4,
          "sideLength": 2,
        },
      };
      final shape = GShapeData.fromJson(shapeData)!;
      expect(
          shape.shape!.when(
            square: (square) => square.sideLength,
            rectangle: (_) => fail("not a rectangle"),
            orElse: () => fail("not a square"),
          ),
          2);
    });

    test("rectangle", () {
      const shapeData = <String, dynamic>{
        "shape": <String, dynamic>{
          "__typename": "Rectangle",
          "area": 3,
          "sideLengthA": 3,
          "sideLengthB": 1,
        },
      };
      final shape = GShapeData.fromJson(shapeData)!;
      expect(
          shape.shape!.when(
            square: (_) => fail("not a square"),
            rectangle: (rectangle) => rectangle.sideLengthA,
            orElse: () => fail("not a rectangle"),
          ),
          3);
    });
  });
}
