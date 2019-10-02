import "package:build/build.dart";
import "package:build_test/build_test.dart";
import "package:gql_code_gen/ast_builder.dart";
import "package:test/test.dart";

void main() {
  test("Gives name to schema", () async {
    final Builder builder = astBuilder(null);

    await testBuilder(
      builder,
      <String, String>{
        "a|some_file.graphql": "schema { query: Query }",
      },
      outputs: <String, String>{
        "a|some_file.ast.g.dart": r"""import 'package:gql/ast.dart' as _i1;

const schema = _i1.SchemaDefinitionNode(directives: [], operationTypes: [
  _i1.OperationTypeDefinitionNode(
      operation: _i1.OperationType.query,
      type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Query'), isNonNull: false))
]);
const document = _i1.DocumentNode(definitions: [schema]);
""",
      },
    );
  });

  test("Gives name to anonymous query", () async {
    final Builder builder = astBuilder(null);

    await testBuilder(
      builder,
      <String, String>{
        "a|some_file.graphql": "query { field }",
      },
      outputs: <String, String>{
        "a|some_file.ast.g.dart": r"""import 'package:gql/ast.dart' as _i1;

const query = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: null,
    variableDefinitions: [],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'field'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const document = _i1.DocumentNode(definitions: [query]);
""",
      },
    );
  });

  test("Gives name to anonymous mutation", () async {
    final Builder builder = astBuilder(null);

    await testBuilder(
      builder,
      <String, String>{
        "a|some_file.graphql": "mutation { field }",
      },
      outputs: <String, String>{
        "a|some_file.ast.g.dart": r"""import 'package:gql/ast.dart' as _i1;

const mutation = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: null,
    variableDefinitions: [],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'field'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const document = _i1.DocumentNode(definitions: [mutation]);
""",
      },
    );
  });

  test("Gives name to anonymous subscription", () async {
    final Builder builder = astBuilder(null);

    await testBuilder(
      builder,
      <String, String>{
        "a|some_file.graphql": "subscription { field }",
      },
      outputs: <String, String>{
        "a|some_file.ast.g.dart": r"""import 'package:gql/ast.dart' as _i1;

const subscription = _i1.OperationDefinitionNode(
    type: _i1.OperationType.subscription,
    name: null,
    variableDefinitions: [],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'field'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const document = _i1.DocumentNode(definitions: [subscription]);
""",
      },
    );
  });

  test("Uses name from named definitions", () async {
    final Builder builder = astBuilder(null);

    await testBuilder(
      builder,
      <String, String>{
        "a|some_file.graphql": """
          type ObjectType { field: Field }
  
          query NamedQuery { field }
          
          mutation NamedMutation { field }
          
          subscription NamedSubscription { field }
          """,
      },
      outputs: <String, String>{
        "a|some_file.ast.g.dart": r"""import 'package:gql/ast.dart' as _i1;

const ObjectType = _i1.ObjectTypeDefinitionNode(
    name: _i1.NameNode(value: 'ObjectType'),
    description: null,
    directives: [],
    interfaces: [],
    fields: [
      _i1.FieldDefinitionNode(
          name: _i1.NameNode(value: 'field'),
          description: null,
          directives: [],
          args: [],
          type: _i1.NamedTypeNode(
              name: _i1.NameNode(value: 'Field'), isNonNull: false))
    ]);
const NamedQuery = _i1.OperationDefinitionNode(
    type: _i1.OperationType.query,
    name: _i1.NameNode(value: 'NamedQuery'),
    variableDefinitions: [],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'field'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const NamedMutation = _i1.OperationDefinitionNode(
    type: _i1.OperationType.mutation,
    name: _i1.NameNode(value: 'NamedMutation'),
    variableDefinitions: [],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'field'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const NamedSubscription = _i1.OperationDefinitionNode(
    type: _i1.OperationType.subscription,
    name: _i1.NameNode(value: 'NamedSubscription'),
    variableDefinitions: [],
    directives: [],
    selectionSet: _i1.SelectionSetNode(selections: [
      _i1.FieldNode(
          name: _i1.NameNode(value: 'field'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const document = _i1.DocumentNode(
    definitions: [ObjectType, NamedQuery, NamedMutation, NamedSubscription]);
""",
      },
    );
  });
}
