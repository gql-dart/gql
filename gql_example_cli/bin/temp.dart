import "package:gql_exec/gql_exec.dart";

class FindPokemon extends Request {
  set name(String value) => variables["name"] = value;

  const FindPokemon()
      : super(
          operation: null,
        );
}

class FindPokemonData {
  Map<String, dynamic> data;

  FindPokemonData(this.data);

  $FindPokemon$pokemon pokemon;
}

class $FindPokemon$pokemon {
  String id;
  String name;
  $FindPokemon$pokemon$weight weight;
  $FindPokemon$pokemon$height height;
}

class $FindPokemon$pokemon$weight {
  int minimum;
  int maximum;
}

class $FindPokemon$pokemon$height {
  int minimum;
  int maximum;
}


class ListPokemon extends Request {
  set count(int value) => variables["count"] = value;

  const ListPokemon()
    : super(
    operation: null,
  );
}

class ListPokemonData {
  Map<String, dynamic> data;

  ListPokemonData(this.data);

  List<$ListPokemon$pokemon> pokemons;
}

class $ListPokemon$pokemon {
  String id;
  String name;
}
