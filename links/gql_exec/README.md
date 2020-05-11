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

Basis for GraphQL execution layer to support Link and Client.

This package defines containers for a GraphQL document to be executed.

Used by `package:gql_link`.


### `Operation`

Parsing a GraphQL file will give you a `DocumentNode`, which may contain
multiple operation definitions. In such case GraphQL requires you to
explicitly define the name of the operation to be executed. It can be
done by passing `operationName` to the `Operation` constructor.


### `Request`

While `Operation` only carries the document and the operation name,
`Request` respresents the invocation of an operation. Alongside the operation,
it also carries the variables.

To execute a `Request` you must pass it to some execution layer.


### `Response`

When some execution layer has processed the `Request` it returns `Response`
possibly carrying a list of errors and/or data.


### `Context`

Both `Request` and `Response` may carry additional context. Context is used
by the execution layer.

Context is a collection of context entries. A Context may only appear once
per type.

```dart
// Create a context entry
final entry = FooBarContextEntry(
  foo: 1,
  bar: 2,
);

// Create a context with an entry
final context = Context().withEntry(entry);

// Update context somewhere in the execution layer
final context2 = context.updateEntry(
  (FooBarContextEntry entry) => FooBarContextEntry(
    foo: entry.foo,
    bar: entry.bar * 2,
  ), 
);

// Retrieve context entry somewhere else in the execution layer
final fooBarEntry = context.entry<FooBarContextEntry>();
```

`Request` and `Response` also exposes helper methods to work with the context. 

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
