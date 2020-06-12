import "package:test/test.dart";

import 'package:end_to_end_test/graphql/schema.schema.gql.dart';
import 'package:end_to_end_test/graphql/serializers.gql.dart';
import 'package:end_to_end_test/scalars/review_with_date.data.gql.dart';
import 'package:end_to_end_test/scalars/review_with_date.var.gql.dart';

void main() {
  group("Custom scalars without user overrides", () {
    final isoString = "2020-06-12T13:23:59Z";
    final scalar = GISODate(isoString);

    test('correctly serializes and deserializes', () {
      expect(serializers.deserializeWith(GISODate.serializer, isoString),
          equals(scalar));
      expect(serializers.serializeWith(GISODate.serializer, scalar),
          equals(isoString));
    });
  });

  group("Custom scalars in input types", () {
    final input = GReviewInput(
      (b) => b
        ..stars = 4
        ..seenOn.add(DateTime.fromMillisecondsSinceEpoch(1591892597000)),
    );
    test('correctly overrides scalars in input types', () {
      expect(input.seenOn.first, TypeMatcher<DateTime>());
    });

    test('can be serialized and deserialized with custom serializer', () {
      final json = {
        "stars": 4,
        "seenOn": [1591892597000],
      };
      expect(input.toJson(), equals(json));
      expect(GReviewInput.fromJson(json), equals(input));
    });
  });

  group("Custom scalars in var types", () {
    final vars = GReviewWithDateVars(
      (b) => b
        ..review.stars = 4
        ..createdAt = DateTime.fromMillisecondsSinceEpoch(1591892597000),
    );

    test('correctly overrides scalars in variable types', () {
      expect(vars.createdAt, TypeMatcher<DateTime>());
    });

    test('can be serialized and deserialized with custom serializer', () {
      final json = {
        "review": {
          "stars": 4,
        },
        "createdAt": 1591892597000,
      };
      expect(vars.toJson(), equals(json));
      expect(GReviewWithDateVars.fromJson(json), equals(vars));
    });
  });

  group("Custom scalars in data types", () {
    final data = GReviewWithDateData(
      (b) => b
        ..createReview.G__typename = "Review"
        ..createReview.stars = 1
        ..createReview
            .seenOn
            .add(DateTime.fromMillisecondsSinceEpoch(1591892597000))
        ..createReview.createdAt =
            DateTime.fromMillisecondsSinceEpoch(1591892597000),
    );

    test('correctly overrides scalars in data types', () {
      expect(data.createReview.seenOn.first, TypeMatcher<DateTime>());
      expect(data.createReview.createdAt, TypeMatcher<DateTime>());
    });

    test('can be serialized and deserialized with custom serializer', () {
      final json = {
        "createReview": {
          "__typename": "Review",
          "stars": 1,
          "seenOn": [1591892597000],
          "createdAt": 1591892597000,
        },
      };
      expect(data.toJson(), equals(json));
      expect(GReviewWithDateData.fromJson(json), equals(data));
    });
  });
}
