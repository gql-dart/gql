import 'package:flutter/material.dart';
import 'package:gql_exec/gql_exec.dart';

import './graphql/all_pokemon.data.gql.dart' as dataClass;
import './graphql/all_pokemon.req.gql.dart' as reqClass;
import '../config.dart';
import '../pokemon_card/pokemon_card.dart';

class AllPokemonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Pokemon'),
      ),
      body: StreamBuilder(
        stream: link.request(
          reqClass.AllPokemon(
            (vars) => vars..first = 500,
          ),
        ),
        builder: (BuildContext build, AsyncSnapshot<Response> snapshot) {
          if (snapshot.data?.data == null)
            return Center(child: CircularProgressIndicator());

          final data = dataClass.AllPokemon(snapshot.data.data);

          return ListView.builder(
            itemCount: data.pokemons.length,
            itemBuilder: (context, index) => PokemonCard(
              pokemon: data.pokemons[index],
            ),
          );
        },
      ),
    );
  }
}
