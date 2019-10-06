A package for Dart code generation from GraphQL source.

Includes:
- `package:gql/dart.dart` for generating Dart code from GraphQL AST nodes;
- `package:gql/ast_builder.dart` for pre-parsing GraphQL into Dart source files.

## Usage

A simple usage example `build.yaml`:

```yaml
targets:
  $default:
    builders:
      ast_builder:
```

The generated source depends on `package:gql/ast.dart` so you'll need to add it to your `pubspec.yaml`
```yaml
dependencies:
  gql: ^0.10.0
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
