import 'package:gql_example_flutter/src/pokemon_card/nested_fragment.data.gql.dart'
    as _i1;

class $PokemonCard implements _i1.$NestedFragment {
  const $PokemonCard(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
  String get name => (data['name'] as String);
  int get maxHP => (data['maxHP'] as int);
  String get image => (data['image'] as String);
}
