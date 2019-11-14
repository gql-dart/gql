[![MIT License][license-badge]][license-link]
[![PRs Welcome][prs-badge]][prs-link]
[![Star on GitHub][github-star-badge]][github-star-link]
[![Watch on GitHub][github-watch-badge]][github-watch-link]

# Normalize

## About

This project allows for the normalization and denormalization of GraphQL Documents.

The `normalize` function creates a flat map of normalized documents and can be used to cache results of GraphQL queries. It traverses the [GraphQL AST](https://github.com/gql-dart/gql/blob/master/gql/README.md) and only includes the fields specified in the GraphQL Document in the normalized results.

The `normalize` function only normalizes entities that include a `__typename` field and a valid ID.

IDs are determined by the following:

2. If a `TypePolicy` is provided for the given type, it's `TypePolicy.keyFields` are used.
3. If a `dataIdFromObject` funciton is provided, the result is used.
4. The `id` or `_id` field (respectively) are used.

## Features

| Feature                                                                                                                           | Progress |
| :-------------------------------------------------------------------------------------------------------------------------------- | :------: |
| Fragments                                                                                                                         |    ✅    |
| Variables                                                                                                                         |    ✅    |
| Interface & Union types                                                                                                           |    ✅    |
| Aliases                                                                                                                           |    ✅    |
| `TypePolicy`s (see [Apollo](https://www.apollographql.com/docs/react/v3.0-beta/caching/cache-configuration/#the-typepolicy-type)) |    ✅    |

## Usage

Assuming we have the following query...

```dart
import 'package:gql/language.dart';
import 'package:gql/ast.dart';
import 'package:normalize/normalize.dart';

final DocumentNode query = parseString("""
    query TestQuery {
      posts {
        id
        __typename
        author {
          id
          __typename
          name
        }
        title
        comments {
          id
          __typename
          commenter {
            id
            __typename
            name
          }
        }
      }
    }
  """)
```

... and executing that query produces the following response data:

```dart
final Map<String, Object> data = {
  "posts": [
    {
      "id": "123",
      "__typename": "Post",
      "author": {"id": "1", "__typename": "Author", "name": "Paul"},
      "title": "My awesome blog post",
      "comments": [
        {
          "id": "324",
          "__typename": "Comment",
          "commenter": {"id": "2", "__typename": "Author", "name": "Nicole"}
        }
      ]
    }
  ]
};
```

We can then run our normalize function:

```dart
final Map<String, Object> normalizedMap = normalize(query: query, data: data);
print(normalized);
```

Which will produce the following normalized result:

```dart
{
  "Query": {
    "posts": [
      {"$ref": "Post:123"}
    ]
  },
  "Post:123": {
    "id": "123",
    "__typename": "Post",
    "author": {"$ref": "Author:1"},
    "title": "My awesome blog post",
    "comments": [
      {"$ref": "Comment:324"}
    ]
  },
  "Author:1": {"id": "1", "__typename": "Author", "name": "Paul"},
  "Comment:324": {
    "id": "324",
    "__typename": "Comment",
    "commenter": {"$ref": "Author:2"}
  },
  "Author:2": {"id": "2", "__typename": "Author", "name": "Nicole"}
}
```

If we later want to denormalize this data (for example, when reading from a cache), we can call `denormalize` on the normalizedMap from above. This will give us back the original data response object.

```dart
denormalize(query: query, normalizedMap: normalizedMap)
```

## Limitations

`TypePolicy.keyFields` and `FieldPolicy.keyArgs` currently only accept a flat list of `String`s. Functions and nested lists of strings and are not yet supported. `FieldPolicy.merge` and `FieldPolicy.read` are also not yet supported.

## Dependencies

This library depends on the [gql](https://github.com/gql-dart/gql) library.

[license-badge]: https://img.shields.io/github/license/smkhalsa/normalize.svg?style=flat-square
[license-link]: https://github.com/smkhalsa/normalize/blob/master/LICENSE
[prs-badge]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square
[prs-link]: http://makeapullrequest.com
[github-watch-badge]: https://img.shields.io/github/watchers/smkhalsa/normalize.svg?style=flat-square&logo=github&logoColor=ffffff
[github-watch-link]: https://github.com/smkhalsa/normalize/watchers
[github-star-badge]: https://img.shields.io/github/stars/smkhalsa/normalize.svg?style=flat-square&logo=github&logoColor=ffffff
[github-star-link]: https://github.com/smkhalsa/normalize/stargazers
