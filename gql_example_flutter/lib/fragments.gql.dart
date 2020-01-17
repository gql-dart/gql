import 'package:gql_example_flutter/fragments.gql.dart' as _i1;

class $SubFragment {
  const $SubFragment(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
  String get name => (data['name'] as String);
}

class $PokemonCard implements _i1.$SubFragment {
  const $PokemonCard(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
  String get name => (data['name'] as String);
  int get maxHP => (data['maxHP'] as int);
  String get image => (data['image'] as String);
}
