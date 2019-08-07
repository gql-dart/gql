A library for working with GraphQL documents.

## Usage

Simply use  `parse`,  `transform` and/or  `printNode`.

```dart
import 'package:gql/language.dart';

main() {
  final SourceFile sourceFile = SourceFile.fromString(
    """
    type Foo {
      bar: Bar
      baz: [Baz!]!
    }

    type Bar {
      boo: Boo
    }
    """,
  );

  final DocumentNode document = parse(sourceFile);

  final DocumentNode transformedDocument = transform(
    document,
    [
      MyTransformer(),
      MyOtherTransformer(),
    ],
  );

  final String printed = printNode(transformedDocument);

  print(printed);
}
```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
