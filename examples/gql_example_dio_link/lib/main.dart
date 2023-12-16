import "package:dio/dio.dart" as dio;
import "package:gql/language.dart" as gql;
import "package:gql_dio_link/gql_dio_link.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";

const query = """{
  countries(filter:{currency:{eq:"EGP"}}){
    name
  }
}""";

const graphqlEndpoint = "https://countries.trevorblades.com/";

void main(List<String> arguments) async {
  final client = dio.Dio();

  final Link link = DioLink(
    graphqlEndpoint,
    client: client,
  );

  final res = await link
      .request(Request(
        operation: Operation(document: gql.parseString(query)),
      ))
      .first;

  final countryName = res.data!["countries"][0]["name"] as String;

  print("The country that uses EGP as a form of curruncy is ${countryName}");
}
