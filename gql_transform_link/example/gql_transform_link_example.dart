import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";
import "package:gql_transform_link/gql_transform_link.dart";

void main() {
  // ignore: unused_local_variable
  final link = Link.from([
    // SomeLink(),
    TransformLink(
      requestTransformer: (req) => req.withContextEntry(
        RequestExtensionsThunk(
          (req2) => req2.variables,
        ),
      ),
      responseTransformer: (resp) => resp.withContextEntry(
        ResponseExtensions(
          "an extension",
        ),
      ),
    ),
    // SomeTerminatingLink(),
  ]);
}
