class FindPokemonVarBuilder {
  final Map<String, dynamic> variables = <String, dynamic>{};

  set name(String value) => variables['name'] = value;
}
