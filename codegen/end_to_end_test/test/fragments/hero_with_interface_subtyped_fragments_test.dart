import 'package:end_to_end_test/fragments/__generated__/hero_with_interface_subtyped_fragments.data.gql.dart';
import 'package:test/test.dart';

void main() {
  group('hero with interface subtyped fragments', () {
    // Create shared test data
    late GHeroWithInterfaceSubTypedFragmentsData heroData;
    late GhumanFieldsFragmentData_friends__asDroid r2d2Friend;
    late GhumanFieldsFragmentData_friends__asHuman leiaFriend;

    setUp(() {
      // Create a droid friend
      r2d2Friend = GhumanFieldsFragmentData_friends__asDroid((b) => b
        ..G__typename = 'Droid'
        ..id = 'droid-1'
        ..name = 'R2-D2'
        ..primaryFunction = 'Astromech');

      // Create a human friend
      leiaFriend = GhumanFieldsFragmentData_friends__asHuman((b) => b
        ..G__typename = 'Human'
        ..id = 'human-2'
        ..name = 'Leia Organa'
        ..homePlanet = 'Alderaan');

      // Create raw JSON data for our hero that includes all fields
      final Map<String, dynamic> heroJson = {
        '__typename': 'Human',
        'id': 'human-1',
        'name': 'Luke Skywalker',
        'homePlanet': 'Tatooine',
        'friends': [
          {'__typename': 'Droid', 'id': 'droid-1', 'name': 'R2-D2', 'primaryFunction': 'Astromech'},
          {'__typename': 'Human', 'id': 'human-2', 'name': 'Leia Organa', 'homePlanet': 'Alderaan'}
        ]
      };

      // Deserialize directly to the correct concrete type
      final humanHero = GHeroWithInterfaceSubTypedFragmentsData_hero.fromJson(heroJson)!;

      // Create the query data with our hero
      heroData = GHeroWithInterfaceSubTypedFragmentsData((b) => b
        ..G__typename = 'Query'
        ..hero = humanHero.toBuilder());
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
      final friendNames = [r2d2Friend, leiaFriend]
          .map((friend) => friend.when(
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
