import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";

export "./http.mocks.dart";

@GenerateMocks([], customMocks: [
  MockSpec<http.Client>(
      onMissingStub: OnMissingStub.returnDefault, as: #MockHttpClient)
])
void main() {}
