import "package:gql/language.dart";

final importedFragments = [
  r"""
      fragment home on Human {
        home: homePlanet
        planet: homePlanet
      }

      fragment dimensions on Human {
        height
        mass
      }
  """,
  r"""
      fragment friendNetwork on Character {
        name
        friends {
          name
          nestedFriends: friends {
            name
          }
          # trying to get lots of nesting for testing
          # test those nests!
          ... on Human {
            ...info
          }
        }
      }
  """,
  r"""
      fragment relationships on Human {
        friends {
          name
          ...friendNetwork
        }
        starships {
          name
          length
          coordinates
        }
      }

      fragment info on Human {
        appearsIn
        ...dimensions
        ...home
      }
  """,
].map(parseString);

final query = parseString(r"""
query HeroForEpisode($ep: Episode!) {
  hero(episode: $ep) {
    __typename
    name
    ... on Droid {
      primaryFunction
    }
    ... on Human {
      appearsIn
      ...info
      ...relationships
    }
  }
}
""");

final mutation = parseString(r"""
mutation UpdateHuman($id: ID!, $data: HumanInput!) {
  updateHuman(id: $id, data: $data) {
    id
    name
    ...info
    ...relationships
  }
}
""");
