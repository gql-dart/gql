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

  final undefined = Vars(
    name: null,
  );

  final nulled = Vars(
    name: Value(null),
  );

  final valued = Vars(
    name: Value("John Doe"),
  );
}

class Vars {
  final Optional<String> name;

  const Vars({this.name});
}

abstract class Optional<T> {
  final T value;

  const Optional(this.value);
}

class Value<T> extends Optional<T> {
  const Value(T value) : super(value);
}
