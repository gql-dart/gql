import "package:test/test.dart";

import 'package:end_to_end_test/graphql/__generated__/schema.schema.gql.dart';
import 'package:end_to_end_test/variables/__generated__/human_with_args.var.gql.dart';
import 'package:end_to_end_test/variables/__generated__/create_review.var.gql.dart';

void main() {
  group("Basic Args", () {
    final args = GHumanWithArgsVars((b) => b..id = "123");
    final json = {
      "id": "123",
    };

    test('basic args object can be serialized / deserialized', () {
      expect(args.toJson(), equals(json));
      expect(GHumanWithArgsVars.fromJson(json), args);
    });
  });

  group("Complex Args", () {
    final args = GCreateReviewVars((b) => b
      ..episode = GEpisode.EMPIRE
      ..review.stars = 5
      ..review.commentary = ("this was amazing!!!")
      ..review.favorite_color.blue = 255
      ..review.favorite_color.green = 120
      ..review.favorite_color.red = 80);

    final json = {
      "episode": "EMPIRE",
      "review": {
        "stars": 5,
        "commentary": "this was amazing!!!",
        "favorite_color": {
          "blue": 255,
          "green": 120,
          "red": 80,
        },
      },
    };

    test('complex args object can be serialized / deserialized', () {
      expect(args.toJson(), equals(json));
      expect(GCreateReviewVars.fromJson(json), args);
    });
  });
}
