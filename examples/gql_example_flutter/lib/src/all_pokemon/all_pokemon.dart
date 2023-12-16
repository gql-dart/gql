import 'package:flutter/material.dart';
import 'package:gql_exec/gql_exec.dart';

import './graphql/__generated__/all_pokemon.data.gql.dart';
import './graphql/__generated__/all_pokemon.req.gql.dart';
import '../config.dart';
import '../pokemon_card/pokemon_card.dart';

class AllPokemonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final req = GAllPokemon(
      (b) => b..vars.first = 500,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('All Pokemon'),
      ),
      body: StreamBuilder(
        stream: link.request(
          Request(
            operation: req.operation,
            variables: req.vars.toJson(),
          ),
        ),
        builder: (BuildContext build, AsyncSnapshot<Response> snapshot) {
          if (snapshot.data?.data == null)
            return Center(child: CircularProgressIndicator());

          final data = GAllPokemonData.fromJson(snapshot.data!.data!);

          final pokemons =
              data!.pokemons!.whereType<GAllPokemonData_pokemons>().toList();

          return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (context, index) => PokemonCard(
              pokemon: pokemons[index],
            ),
          );
        },
      ),
    );
  }
}
