import "package:gql/execution.dart";
import "package:gql/language.dart";
import "package:gql/link.dart";

class MyLinkContext {
  final int value;

  MyLinkContext(this.value);
}

class MyLink implements Link {
  @override
  Stream<Response> request(Request request, [forward]) => Stream.fromIterable(
        [
          Response(
            data: <String, dynamic>{
              "context": request.context.entry<MyLinkContext>().value,
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
              <Type, Object>{
                MyLinkContext: MyLinkContext(i),
              },
            ),
          ),
        )
        .first;

    print(first.data);
  }
}
