// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql/ast.dart' as _i1;

const RemoveStar = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: _i1.NameNode(value: 'RemoveStar'),
    variableDefinitions: [
      _i1.VariableDefinitionNode(
          variable: _i1.VariableNode(name: _i1.NameNode(value: 'starrableId')),
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'ID'), isNonNull: true),
          defaultValue: _i1.DefaultValueNode(value: null),
          directives: [])
    ],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'removeStar'),
          alias: _i1.NameNode(value: 'action'),
          arguments: [
            _i1.ArgumentNode(
                name: _i1.NameNode(value: 'input'),
                value: _i1.ObjectValueNode(fields: [
                  _i1.ObjectFieldNode(
                      name: _i1.NameNode(value: 'starrableId'),
                      value: _i1.VariableNode(
                          name: _i1.NameNode(value: 'starrableId')))
                ]))
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
                name: _i1.NameNode(value: 'starrable'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: _i1.SelectionSetNode(selections: [
                  _i1.FieldNode(
                      name: _i1.NameNode(value: 'viewerHasStarred'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ]))
          ]))
    ]));
const document = _i1.DocumentNode(definitions: [RemoveStar]);
