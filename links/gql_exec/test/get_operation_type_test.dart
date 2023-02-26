import "package:gql/ast.dart";
import "package:gql/language.dart";
import "package:gql_exec/gql_exec.dart";
import "package:test/test.dart";

void main() {
  group("getOperationType", () {
    test("returns the operation type for query", () {
      final query = parseString("""
        query MyQuery {
          foo
        }
      """);

      final type = Operation(document: query, operationName: "MyQuery")
          .getOperationType();

      expect(type, OperationType.query);
    });

    test("returns the operation type for mutation", () {
      final query = parseString("""
        mutation MyMutation {
          foo
        }
      """);

      final type = Operation(document: query, operationName: "MyMutation")
          .getOperationType();

      expect(type, OperationType.mutation);
    });

    test("returns the operation type for subscription", () {
      final query = parseString("""
        subscription MySubscription {
          foo
        }
      """);

      final type = Operation(document: query, operationName: "MySubscription")
          .getOperationType();

      expect(type, OperationType.subscription);
    });

    test("return type of not name is passed to operation", () {
      final query = parseString("""
        query MyQuery {
          foo
        }
      """);

      final type = Operation(document: query).getOperationType();

      expect(type, OperationType.query);
    });

    test("returns type if multiple operations are present", () {
      final query = parseString("""
        query MyQuery {
          foo
        }
        
        mutation MyMutation {
          foo
        }
      """);

      final type = Operation(document: query, operationName: "MyMutation")
          .getOperationType();

      expect(type, OperationType.mutation);
    });

    test("returns null if no operation is found", () {
      final query = parseString("""
        query MyQuery {
          foo
        }
        
        mutation MyMutation {
          foo
        }
      """);

      final type = Operation(document: query, operationName: "MyOperation")
          .getOperationType();

      expect(type, null);
    });

    test("returns null if documents has no operations", () {
      final query = parseString("""
        fragment MyFragment on Foo {
          foo
        }
      """);

      final type = Operation(document: query, operationName: "MyFragment")
          .getOperationType();

      expect(type, null);
    });
  });
}
