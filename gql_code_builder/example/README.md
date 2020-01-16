<<<<<<< HEAD
The API is currently unstable. See [`package:gql_build`](https://pub.dev/packages/gql_build) for usage examples.
=======
Add `gql_code_gen` to your `pubspec.yaml`

```yaml
dependencies:
  gql: ^0.12.0
  gql_exec: ^0.2.0

dev_dependencies:
  gql_build: ^0.2.0
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
>>>>>>> updates following rebase
