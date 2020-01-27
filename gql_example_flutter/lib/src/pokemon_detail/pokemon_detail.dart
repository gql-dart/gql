import 'package:flutter/material.dart';
import 'package:gql_exec/gql_exec.dart';

import './pokemon_detail.data.gql.dart';
import './pokemon_detail.req.gql.dart';
import '../config.dart';
import '../pokemon_card/pokemon_card.dart';

class PokemonDetailScreen extends StatelessWidget {
  final String id;

  const PokemonDetailScreen({this.id});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: link.request(
        PokemonDetail(
          (vars) => vars..id = id,
        ),
      ),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        if (snapshot.data?.data == null)
          return Scaffold(
              appBar: AppBar(),
              body: Center(child: CircularProgressIndicator()));

        final data = $PokemonDetail(snapshot.data.data);

        return Scaffold(
          appBar: AppBar(
              title: Text(
            data.pokemon.name,
          )),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              PokemonCard(
                pokemon: data.pokemon,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Text(
                'Height',
                style: Theme.of(context).textTheme.title,
              ),
              Text('min: ${data.pokemon.height.minimum}'),
              Text('max: ${data.pokemon.height.maximum}'),
              Padding(
                padding: const EdgeInsets.all(8.0),
              ),
              Text(
                'Weight',
                style: Theme.of(context).textTheme.title,
              ),
              Text('min: ${data.pokemon.weight.minimum}'),
              Text('max: ${data.pokemon.weight.maximum}'),
            ],
          ),
        );
      },
    );
  }
}
