import "package:mockito/annotations.dart";

import "package:http/http.dart" as http;

export "./http.mocks.dart";

@GenerateMocks([http.Client])
void main() {}
