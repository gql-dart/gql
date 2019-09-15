## 0.5.0

- Implement `package:gql/ast_builder` to parse `*.graphql` documents at build-time
- Stricter lint rules

## 0.4.0

- Define `name` on `DefinitionNode` to simplify `name` access for `DocumentNode.definitions`
- Rework `Node.visitChildren` and implement `Node.==` and `Node.hashCode`
- Lower SDK requirement to `>=2.2.2`

## 0.3.0

- Dart code generation via `fromNode` from `package:gql/dart.dart` using `code_gen`

## 0.2.0

- `parseString` to parse directly from `String`
- Improve parsing exceptions
- `AccumulatingVisitor` for validation rules
- Expose experimental Validation API

## 0.1.0

- A functional GraphQL parser, transformer and printer
