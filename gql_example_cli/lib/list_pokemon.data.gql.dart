// GENERATED CODE - DO NOT MODIFY BY HAND

class $ListPokemon {
  const $ListPokemon(this.data);

  final Map<String, dynamic> data;

  List<$ListPokemon$pokemons> get pokemons => data['pokemons'] == null
      ? null
      : (data['pokemons'] as List)
          .map(
              (dynamic e) => $ListPokemon$pokemons((e as Map<String, dynamic>)))
          .toList();
}

class $ListPokemon$pokemons {
  const $ListPokemon$pokemons(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
  String get name => (data['name'] as String);
}
