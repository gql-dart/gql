import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";
import "package:gql_link/gql_link.dart";

class MyLinkContext extends ContextEntry {
  final int value;

  const MyLinkContext(this.value);

  @override
  List<Object> get fieldsForEquality => [];
}

class MyLink extends Link {
  @override
  Stream<Response> request(Request request, [forward]) => Stream.fromIterable(
        [
          Response(
            data: <String, dynamic>{
              "context": request.context.entry<MyLinkContext>()?.value,
            },
            response: <String, dynamic>{
              "data": <String, dynamic>{
                "context": request.context.entry<MyLinkContext>()?.value,
              }
            },
          ),
        ],
      );
}

void main() async {
  final link = MyLink();

  for (var i = 0; i < 10; i++) {
    final first = await link
        .request(
          Request(
            operation: Operation(
              document: parseString(""),
            ),
            context: Context.fromMap(
              <Type, ContextEntry>{
                MyLinkContext: MyLinkContext(i),
              },
            ),
          ),
        )
        .first;

    print(first.data);
  }
}
