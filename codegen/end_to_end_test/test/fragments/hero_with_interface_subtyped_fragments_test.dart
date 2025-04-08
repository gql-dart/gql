import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_subtyped_fragments.data.gql.dart';
import 'package:test/test.dart';

void main() {
  group('hero with interface subtyped fragments', () {
    // Create shared test data
    late GHeroWithInterfaceSubTypedFragmentsData heroData;
    late GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman humanHero;

    setUp(() {
      // Create raw JSON data for our hero that includes all fields
      final Map<String, dynamic> queryJson = {
        '__typename': 'Query',
        'hero': {
          '__typename': 'Human',
          'id': 'human-1',
          'name': 'Luke Skywalker',
          'homePlanet': 'Tatooine',
          'friends': [
            {
              '__typename': 'Droid',
              'id': 'droid-1',
              'name': 'R2-D2',
              'primaryFunction': 'Astromech'
            },
            {
              '__typename': 'Human',
              'id': 'human-2',
              'name': 'Leia Organa',
              'homePlanet': 'Alderaan'
            }
          ]
        }
      };

      // Deserialize the entire query response
      heroData = GHeroWithInterfaceSubTypedFragmentsData.fromJson(queryJson)!;
      humanHero = heroData.hero!
          as GHeroWithInterfaceSubTypedFragmentsData_hero__asHuman;
    });

    test('when extension correctly retrieves hero name', () {
      final heroName = heroData.hero!.when(
        human: (human) => human.name,
        droid: (droid) => droid.name,
        orElse: () => 'Unknown',
      );
      expect(heroName, equals('Luke Skywalker'));
    });

    test('when extension correctly retrieves friends information', () {
      final friendNames = humanHero.friends!
          .map((friend) => friend!.when(
                droid: (droid) => '${droid.name} (${droid.primaryFunction})',
                human: (human) => '${human.name} (${human.homePlanet})',
                orElse: () => 'Unknown friend',
              ))
          .toList();

      expect(
          friendNames,
          equals([
            'R2-D2 (Astromech)',
            'Leia Organa (Alderaan)',
          ]));
    });
  });
}
