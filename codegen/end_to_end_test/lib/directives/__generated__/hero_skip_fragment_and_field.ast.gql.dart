// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const HeroSkipFragment = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'HeroSkipFragment'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'skipDetails')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Boolean'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'hero'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            _i1.FragmentSpreadNode(
                name: _i1.NameNode(value: 'HeroDetail'),
                directives: [
                  _i1.DirectiveNode(
                      name: _i1.NameNode(value: 'skip'),
                      arguments: [
                        _i1.ArgumentNode(
                            name: _i1.NameNode(value: 'if'),
                            value: _i1.VariableNode(
                                name: _i1.NameNode(value: 'skipDetails')))
                      ])
                ])
          ]))
    ]));
const HeroDetail = _i1.FragmentDefinitionNode(
    name: _i1.NameNode(value: 'HeroDetail'),
    typeCondition: _i1.TypeConditionNode(
        on: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Character'), isNonNull: false)),
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      _i1.FieldNode(
          name: _i1.NameNode(value: 'name'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const document = _i1.DocumentNode(definitions: [HeroSkipFragment, HeroDetail]);
