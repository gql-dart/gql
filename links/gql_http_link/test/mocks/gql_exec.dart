import "package:gql_link/gql_link.dart";
import "package:mockito/annotations.dart";

export "./gql_exec.mocks.dart";

@GenerateMocks([RequestSerializer, ResponseParser])
void main() {}
