GQL Link to transform Requests and Responses.
May be used to update context, document, variables, data, errors, etc.

## Usage

A simple usage example:

```dart
TransformLink(
  requestTransformer: (req) => req.withContextEntry(
    RequestExtensionsThunk((req2) => req2.operation.variables),
  ),
  responseTransformer: (resp) => resp.withContextEntry(
    ResponseExtensions("an extension"),
  ),
);
```

## Features and bugs

Please file feature requests and bugs at the [GitHub][tracker].

[tracker]: https://github.com/gql-dart/gql/issues
