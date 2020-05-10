[![MIT License][license-badge]][license-link]
[![PRs Welcome][prs-badge]][prs-link]
[![Watch on GitHub][github-watch-badge]][github-watch-link]
[![Star on GitHub][github-star-badge]][github-star-link]
[![Watch on GitHub][github-forks-badge]][github-forks-link]
[![Discord][discord-badge]][discord-link]

[license-badge]: https://img.shields.io/github/license/gql-dart/gql.svg?style=for-the-badge
[license-link]: https://github.com/gql-dart/gql/blob/master/LICENSE
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge
[prs-link]: https://github.com/gql-dart/gql/issues

[github-watch-badge]: https://img.shields.io/github/watchers/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-watch-link]: https://github.com/gql-dart/gql/watchers
[github-star-badge]: https://img.shields.io/github/stars/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-star-link]: https://github.com/gql-dart/gql/stargazers
[github-forks-badge]: https://img.shields.io/github/forks/gql-dart/gql.svg?style=for-the-badge&logo=github&logoColor=ffffff
[github-forks-link]: https://github.com/gql-dart/gql/network/members

[discord-badge]: https://img.shields.io/discord/559455668810153989.svg?style=for-the-badge&logo=discord&logoColor=ffffff
[discord-link]: https://discord.gg/NryjpVa

A package for Dart code generation from GraphQL source.

## Usage example

Builders in this package let you build your GraphQL requests and view the response in a type-safe way. 

```dart
final result = await link.request(
  FindPokemon()..name = "Charizard",
);
final data = $FindPokemon(result.data);

final pokemon = data.pokemon;

print("Found ${pokemon.name}");
print("ID: ${pokemon.id}");

final weight = pokemon.weight;
final height = pokemon.height;

print(
  "Weight: ${weight.minimum} – ${weight.maximum}",
);
print(
  "Height: ${height.minimum} – ${height.maximum}",
);
````

## Provided builders

### ast_builder
Generates an AST representation of a GraphQL Document

### data_builder
Generates a typed view on top of `data` JSON. The generated classes are not supposed to be used directly as that would introduce tight coupling between your GraphQL documents and your application code.
```dart
class $ListPokemon {
  const $ListPokemon(this.data);

  final Map<String, dynamic> data;

  List<$ListPokemon$pokemons> get pokemons => (data["pokemons"] as List)
      .map((dynamic e) => $ListPokemon$pokemons(e as Map<String, dynamic>))
      .toList();
}

class $ListPokemon$pokemons {
  const $ListPokemon$pokemons(this.data);

  final Map<String, dynamic> data;

  String get id => data["id"] as String;
  String get name => data["name"] as String;
}
```

### op_builder
Wraps AST and operation name into an `Operation`.
```dart
import 'package:gql_exec/gql_exec.dart';
import 'find_pokemon.ast.gql.dart' as find_pokemon;

const FindPokemon = Operation(
  document: find_pokemon.document,
  operationName: 'FindPokemon',
);
```

### req_builder
Extend `Request` class to use specific `Operation` and provide ability to build variables. Builder pattern let's you handle nullable variables correctly (GraphQL spec pretty much requires both `undefined` and `null` values).
```dart
import 'package:gql_exec/gql_exec.dart' as _i1;
import 'find_pokemon.op.gql.dart' as _i2;

class FindPokemon extends _i1.Request {
  FindPokemon()
      : super(operation: _i2.FindPokemon, variables: <String, dynamic>{});

  set name(String value) => variables["name"] = value;
}
```

### enum_builder
Generates an enum-like class per GraphQL enum type. Defines known enum values to be used in your code, and allows unknown enum values to be used without causing runtime error when handling response data.
```dart
class ReleaseType {
  const ReleaseType(this.value);

  final String value;

  static const ReleaseType ALPHA = ReleaseType('ALPHA');

  static const ReleaseType BETA = ReleaseType('BETA');

  static const ReleaseType GAMMA = ReleaseType('GAMMA');

  @override
  int get hashCode => value.hashCode;
  @override
  bool operator ==(Object o) => o is ReleaseType && o.value == value;
}
```

### scalar_builder
Generates a container for a scalar value to be used when viewing the response data and building request variables.
```dart
class ID {
  const ID(this.value);

  final String value;

  @override
  int get hashCode => value.hashCode;
  @override
  bool operator ==(Object o) => o is ID && o.value == value;
}
```

### input_builder
Generates an input builder to be used to build request variables.
```dart
class MutationInput {
  final Map<String, dynamic> input = <String, dynamic>{};

  set a(String value) => input['a'] = value;
}
```

### schema_builder
Combines `enum_builder`, `input_builder` and `scalar_builder`.

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
