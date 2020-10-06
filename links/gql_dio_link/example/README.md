See https://github.com/gql-dart/gql/tree/master/examples/gql_example_dio_link

```dart
final client = dio.Dio();

final Link link = DioLink(
  graphqlEndpoint,
  client: client,
);

final res = await link
  .request(Request(
    operation: Operation(document: gql.parseString(
      """{
        countries(filter:{currency:{eq:"EGP"}}){
          name
        }
      }""",
    )),
  ))
  .first;

final countryName = res.data["countries"][0]["name"] as String;

print("The country that uses EGP as a form of curruncy is ${countryName}");
```
