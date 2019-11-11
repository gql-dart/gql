import "package:test/test.dart";
import 'package:gql/language.dart';

import 'package:normalize/normalize.dart';

void main() {
  group("Array of Strings query", () {
    final query = parseString("""
    query TestQuery {
      posts {
        id
        __typename
        tags
      }
    }
  """);

    final data = {
      "posts": [
        {
          "id": "123",
          "__typename": "Post",
          "tags": ["olle", "kalle"]
        }
      ]
    };

    final normalizedMap = {
      "Query": {
        "posts": [
          {"\$ref": "Post:123"}
        ]
      },
      "Post:123": {
        "id": "123",
        "__typename": "Post",
        "tags": ["olle", "kalle"]
      }
    };

    test("Produces correct normalized object", () {
      expect(normalize(query: query, data: data), equals(normalizedMap));
    });

    test("Produces correct nested data object", () {
      expect(denormalize(query: query, normalizedMap: normalizedMap),
          equals(data));
    }, skip: true);
  });
}
