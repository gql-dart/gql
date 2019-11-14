import "package:code_builder/code_builder.dart";
import "package:dart_style/dart_style.dart";
import "package:gql/language.dart" as lang;
import "package:gql_code_gen/src/schema.dart";

void main() {
  final document = lang.parseString('''
  """
  Position foo x bar y
  """
  input Position { id: ID!, x: Int!, y: Int!, z: [Int], name: String!, another: Position}
  
  scalar Date
  
  scalar DateTime
  
  scalar GitObjectID
  
  enum LockReason {
    OFF_TOPIC
    RESOLVED
    SPAM
    TOO_HEATED
  }
  ''');

  final Spec schemaLib = buildSchema(
    document,
//    const BuildOptions(
//      typeMap: {
//        "Int": Reference("Zint"),
//      },
//    ),
  );

  final formatted = DartFormatter().format(
    "${schemaLib.accept(
      DartEmitter.scoped(),
    )}",
  );

  print(formatted);
}
