import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";

export "./http.mocks.dart";

@GenerateMocks([], customMocks: [
  MockSpec<http.Client>(returnNullOnMissingStub: true, as: #MockHttpClient)
])
void main() {}
