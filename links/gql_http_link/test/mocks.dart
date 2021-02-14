import "package:mockito/annotations.dart";

import "package:http/http.dart" as http;
import "package:gql_link/gql_link.dart";

export "./mocks.mocks.dart";

@GenerateMocks([http.Client, RequestSerializer, ResponseParser])
void main() {}
