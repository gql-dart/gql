// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const Dimensions = _i1.FragmentDefinitionNode(
  name: _i1.NameNode(value: 'Dimensions'),
  typeCondition: _i1.TypeConditionNode(
      on: _i1.NamedTypeNode(
    name: _i1.NameNode(value: 'PokemonDimension'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'minimum'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'maximum'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const document = _i1.DocumentNode(definitions: [Dimensions]);
