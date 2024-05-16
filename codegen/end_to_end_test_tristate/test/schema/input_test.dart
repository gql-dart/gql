import 'package:gql_tristate_value/gql_tristate_value.dart';
import "package:test/test.dart";

import 'package:end_to_end_test_tristate/graphql/__generated__/schema.schema.gql.dart';

void main() {
  group("Inputs", () {
    test('can be instantiated', () {
      GReviewInput((b) => b
        ..stars = 4
        ..commentary = Value.present("This was a great movie!")
        ..favorite_color = Value.present(GColorInput((b) => b
          ..red = 225
          ..blue = 255
          ..green = 123)));
    });

    test('can be serialized and deserialized', () {
      final input = GReviewInput((b) => b
        ..stars = 4
        ..favorite_color = Value.present(GColorInput((b) => b
          ..red = 225
          ..blue = 255
          ..green = 123)));
      final json = {
        "stars": 4,
        "favorite_color": {
          "red": 225,
          "blue": 255,
          "green": 123,
        },
      };
      expect(input.toJson(), equals(json));
      expect(GReviewInput.fromJson(json), equals(input));
    });
  });
}
