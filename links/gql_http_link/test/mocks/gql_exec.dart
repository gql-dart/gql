import "package:mockito/annotations.dart";

import "package:gql_link/gql_link.dart";

export "./gql_exec.mocks.dart";

@GenerateMocks([RequestSerializer, ResponseParser])
void main() {}
