import "package:gql/language.dart";

final schema = parseString(r'''
schema {
  query: StarWarsQuery
  mutation: StarWarsMutation
  subscription: Subscription
}

interface Character {
  """
  The ID of the character
  """
  id: String

  """
  The name of the character
  """
  name: String

  """
  The friends of the character, or an empty list if they have none
  """
  friends: [Character]

  """
  The movies this character appears in
  """
  appearsIn: [Episode]
  graphql: String
}

input CharacterInput {
  """
  The ID of the character
  """
  id: String

  """
  The name of the character
  """
  name: String
  friends: [CharacterInput]

  """
  The movies this character appears in
  """
  appearsIn: [Episode]
  graphql: String
}

"""
An ISO-8601 Date.
"""
scalar Date

type Droid implements Character {
  id: String
  name: String
  friends: [Character]
  appearsIn: [Episode]
  primaryFunction: String
  created_at: Date
  updated_at: Date
  graphql: String
  idAsInt: Int
}

"""
The episodes in the Star Wars trilogy
"""
enum Episode {
  NEWHOPE
  EMPIRE
  JEDI
}

type Human implements Character {
  id: String
  name: String
  appearsIn: [Episode]
  homePlanet: String
  height: Float
  mass: Float
  friends: [Character]
  starships: [Starship]
  created_at: Date
  updated_at: Date
  graphql: String
  idAsInt: Int
}

input HumanInput {
  id: String
  name: String
  appearsIn: [Episode]
  homePlanet: String
  height: Float
  mass: Float
  friends: [CharacterInput]
  starships: [StarshipInput]
  created_at: Date
  updated_at: Date
  graphql: String
  idAsInt: Int
}

type Review {
  id: String
  episode: Episode
  stars: Int
  commentary: String
  created_at: Date
  updated_at: Date
  graphql: String
  idAsInt: Int
}

input ReviewInput {
  id: String
  episode: Episode
  stars: Int
  commentary: String
  created_at: Date
  updated_at: Date
  graphql: String
  idAsInt: Int
}

"""
Paginating movie review api. Returns { reviews, page }
"""
type ReviewResults {
  """
  The page index
  """
  page: Int

  """
  The list of reviews
  """
  reviews: [Review!]
}

"""
Droid | Human | Starship
"""
union SearchResult = Droid | Human | Starship

type Starship {
  id: String
  name: String
  length: Float
  coordinates: [Float]
  created_at: Date
  updated_at: Date
  graphql: String
  idAsInt: Int
}

input StarshipInput {
  id: String
  name: String
  length: Float
  coordinates: [Float]
  created_at: Date
  updated_at: Date
  graphql: String
  idAsInt: Int
}

type StarWarsMutation {
  """
  Updates a human in the database.
  """
  updateHuman(id: ID!, data: HumanInput!): Human!

  """
  Delete a human in the database.
  """
  deleteHuman(id: ID!): Human!

  """
  Creates a review
  """
  createReview(data: ReviewInput!): Review!
}

"""
A long time ago, in a galaxy far, far away...
"""
type StarWarsQuery {
  """
  All droids in the known galaxy.
  """
  droids: [Droid!]

  """
  All humans in the known galaxy.
  """
  humans: [Human!]

  """
  All starships in the known galaxy.
  """
  starships: [Starship!]

  """
  Finds a random hero within the known galaxy, whether a Droid or Human.
  """
  hero(ep: Episode): Character

  """
  Finds a random starship, droid, or human
  """
  randomEntity: SearchResult
  reviews(
    """
    which page to get from the api
    """
    page: Int = 0
  ): ReviewResults
}

type Subscription {
  reviewAdded: Review
}
''');
