Add `gql_build` to your `pubspec.yaml`

```yaml
dependencies:
  gql: ^0.12.0
  gql_exec: ^0.2.0

dev_dependencies:
  gql_build: ^0.0.1
```

Enable the builders you want by setting `enabled: true`.

```yaml
targets:
  $default:
    builders:
      gql_build|schema_builder:
        enabled: true
      gql_build|ast_builder:
        enabled: true
      gql_build|op_builder:
        enabled: true
        options:
          schema: gql_example_cli|lib/schema.graphql
      gql_build|data_builder:
        enabled: true
        options:
          schema: gql_example_cli|lib/schema.graphql
      gql_build|req_builder:
        enabled: true
        options:
          schema: gql_example_cli|lib/schema.graphql
```

Build using `build_runner`

```bash
pub run build_runner build
```

See [gql_example_cli](https://github.com/gql-dart/gql/tree/master/gql_example_cli) for a usage of the generated classes.
