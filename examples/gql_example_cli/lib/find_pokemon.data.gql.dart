// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql_example_cli/dimensions.data.gql.dart' as _i1;

class $FindPokemon {
  const $FindPokemon(this.data);

  final Map<String, dynamic> data;

  $FindPokemon$pokemon get pokemon => data['pokemon'] == null
      ? null
      : $FindPokemon$pokemon((data['pokemon'] as Map<String, dynamic>));
}

class $FindPokemon$pokemon {
  const $FindPokemon$pokemon(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
  String get name => (data['name'] as String);
  $FindPokemon$pokemon$weight get weight => data['weight'] == null
      ? null
      : $FindPokemon$pokemon$weight((data['weight'] as Map<String, dynamic>));
  $FindPokemon$pokemon$height get height => data['height'] == null
      ? null
      : $FindPokemon$pokemon$height((data['height'] as Map<String, dynamic>));
}

class $FindPokemon$pokemon$weight implements _i1.$Dimensions {
  const $FindPokemon$pokemon$weight(this.data);

  final Map<String, dynamic> data;

  String get minimum => (data['minimum'] as String);
  String get maximum => (data['maximum'] as String);
}

class $FindPokemon$pokemon$height implements _i1.$Dimensions {
  const $FindPokemon$pokemon$height(this.data);

  final Map<String, dynamic> data;

  String get minimum => (data['minimum'] as String);
  String get maximum => (data['maximum'] as String);
}
