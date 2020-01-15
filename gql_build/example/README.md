Add `gql_code_gen` to your `pubspec.yaml`
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
