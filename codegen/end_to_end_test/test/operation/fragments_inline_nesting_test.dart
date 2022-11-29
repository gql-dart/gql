import "package:test/test.dart";

import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_subtyped_fragments.data.gql.dart';

void main() {
  group("Fragments with InlineFragments for different sub-Types", () {
    test('can deserialize correctly from sub-Typed data', () {
      final jsonHuman = {
        "__typename": "Human",
        "id": "luke",
        "name": "Luke",
        "homePlanet": "Tattoine",
        "birthday": 200059200000,
        "friends": [
          {
            "__typename": "Droid",
            "id": "r2d2",
            "name": "R2-D2",
            "primaryFunction": "Astromech"
          },
          {
            "__typename": "Droid",
            "id": "c3po",
            "name": "C3-PO",
            "primaryFunction": "Protocol Droid"
          },
        ],
      };

      final gqlHuman = GheroFieldsFragmentData__asHuman.fromJson(jsonHuman);

      expect(gqlHuman?.id, equals("luke"));
      expect(gqlHuman?.name, equals("Luke"));
      expect(gqlHuman?.homePlanet, equals("Tattoine"));
      expect(gqlHuman?.birthday, equals(DateTime.parse("1976-05-04T08:00:00")));
      expect(gqlHuman?.friends?.first?.G__typename, equals("Droid"));
      // FAILS: "The getter 'primaryFunction' isn't defined for the type 'GheroFieldsFragmentData__asHuman_friends'."
      // expect(gqlHuman?.friends?.first?.primaryFunction, equals("Astromech"));
    });
  });
}
