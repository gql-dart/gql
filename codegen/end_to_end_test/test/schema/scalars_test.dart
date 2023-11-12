import "package:test/test.dart";

import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart';
import 'package:end_to_end_test/scalars/__generated__/review_with_date.data.gql.dart';
import 'package:end_to_end_test/scalars/__generated__/review_with_date.var.gql.dart';
import 'package:end_to_end_test/custom_field.dart';
import 'package:end_to_end_test/custom_field_serializer.dart';

void main() {
  group("Custom scalars from non-standard dart types", () {
    final customField = CustomField('hi', 4.5, {
      'subfield': ['some', 'substrings']
    });

    test('correctly serializes and deserializes', () {
      expect(
        serializers.deserializeWith(
          CustomFieldSerializer(),
          customField.toJson(),
        ),
        equals(customField),
      );
      expect(
        serializers.serializeWith(CustomFieldSerializer(), customField),
        equals(
          customField.toJson(),
        ),
      );
    });

    final data = GReviewWithDateData((b) => b
      ..createReview.custom.addAll([customField])
      ..createReview.stars = 1);

    test('can use in GraphQL operation data', () {
      expect(data.createReview!.custom.first, equals(customField));
      expect(
        data.createReview!.toJson()['custom'].first,
        equals(customField.toJson()),
      );
    });
  });

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
    final input = GReviewInput((b) => b
      ..stars = 4
      ..seenOn.add(DateTime.fromMillisecondsSinceEpoch(1591892597000)));
    test('correctly overrides scalars in input types', () {
      expect((input.seenOn!).first, TypeMatcher<DateTime>());
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
      expect((vars.createdAt), TypeMatcher<DateTime>());
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
        ..createReview.stars = 1
        ..createReview
            .seenOn
            .add(DateTime.fromMillisecondsSinceEpoch(1591892597000))
        ..createReview.createdAt =
            DateTime.fromMillisecondsSinceEpoch(1591892597000),
    );

    test('correctly overrides scalars in data types', () {
      expect(data.createReview!.seenOn.first, TypeMatcher<DateTime>());
      expect(data.createReview!.createdAt, TypeMatcher<DateTime>());
    });

    test('can be serialized and deserialized with custom serializer', () {
      final json = {
        "__typename": "Mutation",
        "createReview": {
          "__typename": "Review",
          "stars": 1,
          "seenOn": [1591892597000],
          "createdAt": 1591892597000,
          "custom": [],
        },
      };
      expect(data.toJson(), equals(json));
      expect(GReviewWithDateData.fromJson(json), equals(data));
    });
  });
}
