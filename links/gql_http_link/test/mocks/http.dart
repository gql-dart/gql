import "package:mockito/annotations.dart";
import "package:http/http.dart" as http;

export "./http.mocks.dart";

@GenerateMocks([], customMocks: [
  MockSpec<http.Client>(returnNullOnMissingStub: true, as: #MockHttpClient)
])
void main() {}
