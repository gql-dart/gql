Add `gql_code_gen` tou your `pubspec.yaml`
```yaml
dev_dependencies:
  gql_code_gen: ^0.2.0
```

Enable the builders you want by setting `enabled: true`.
```yaml
targets:
  $default:
    builders:
      gql_code_gen|schema_builder:
        enabled: true
      gql_code_gen|ast_builder:
        enabled: true
      gql_code_gen|op_builder:
        enabled: true
        options:
          schema: gql_example_cli|lib/schema.graphql
      gql_code_gen|data_builder:
        enabled: true
        options:
          schema: gql_example_cli|lib/schema.graphql
      gql_code_gen|req_builder:
        enabled: true
        options:
          schema: gql_example_cli|lib/schema.graphql
```

Build using `build_runner`
```bash
pub run build_runner build
```
