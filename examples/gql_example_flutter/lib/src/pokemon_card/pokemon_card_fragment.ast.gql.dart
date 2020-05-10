import 'package:gql/ast.dart' as _i1;
import 'package:gql_example_flutter/src/pokemon_card/nested_fragment.ast.gql.dart'
    as _i2;

const PokemonCard = _i1.FragmentDefinitionNode(
    name: _i1.NameNode(value: 'PokemonCard'),
    typeCondition: _i1.TypeConditionNode(
        on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Pokemon'), isNonNull: false)),
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FragmentSpreadNode(
          name: _i1.NameNode(value: 'NestedFragment'), directives: []),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'maxHP'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'image'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const document =
    _i1.DocumentNode(definitions: [PokemonCard, _i2.NestedFragment]);
