import "package:test/test.dart";

import 'package:end_to_end_test_tristate/aliases/__generated__/aliased_hero.data.gql.dart';
import 'package:end_to_end_test_tristate/graphql/__generated__/schema.schema.gql.dart';

void main() {
  group("Aliases", () {
    test('can be instantiated with aliased fields', () {
      GAliasedHeroData(
        (b) => b
          ..empireHero.G__typename = "Human"
          ..empireHero.id = "leia"
          ..empireHero.name = "Leia"
          ..empireHero.from.add(GEpisode.NEWHOPE),
      );
    });

    test('can be serialized with aliased fields', () {
      final data = GAliasedHeroData(
        (b) => b
          ..empireHero.G__typename = "Human"
          ..empireHero.id = "leia"
          ..empireHero.name = "Leia"
          ..empireHero.from.add(GEpisode.NEWHOPE),
      );
      final json = {
        "__typename": "Query",
        "empireHero": {
          "__typename": "Human",
          "id": "leia",
          "name": "Leia",
          "from": ["NEWHOPE"],
        },
      };
      expect(data.toJson(), equals(json));
    });
  });
}
