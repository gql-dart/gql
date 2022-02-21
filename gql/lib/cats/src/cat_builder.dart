import "dart:convert";
import "dart:io";

import "package:gql/cats/cats.dart";
import "package:yaml/yaml.dart";

class CatBuilder {
  Suite buildSuite(String suitePath) {
    final dir = Directory(suitePath);

    final folders = dir.listSync().whereType<Directory>();

    final scenarios = folders.expand(
      (folder) => folder
          .listSync()
          .whereType<File>()
          .where(
            (file) => file.path.endsWith(".yaml"),
          )
          .map(
            (file) => buildScenario(file, folder),
          ),
    );

    return Suite(
      scenarios: scenarios,
    );
  }

  Scenario buildScenario(File file, Directory folder) {
    final dynamic doc = loadYaml(
      file.readAsStringSync(),
      sourceUrl: Uri.file(file.path),
    );

    String? schema;
    Map<String, dynamic>? testData;

    final YamlMap? background = doc["background"] as YamlMap?;

    if (background != null) {
      schema = background["schema"] as String?;
      if (background["schema-file"] != null) {
        schema = File(
          "${folder.path}${Platform.pathSeparator}${background["schema-file"]}",
        ).readAsStringSync();
      }

      testData = json.decode(
        json.encode(background["test-data"]),
      ) as Map<String, dynamic>?;
    }

    return Scenario(
      folder: folder.path,
      file: file.path,
      name: doc["scenario"] as String?,
      tests: buildTests(doc["tests"] as YamlNode?, folder),
      schema: schema,
      testData: testData,
    );
  }

  Iterable<TestCase>? buildTests(YamlNode? node, Directory folder) {
    if (node is YamlList) {
      return node.map((dynamic n) => buildTest(n as YamlMap, folder));
    }

    return null;
  }

  TestCase buildTest(YamlMap node, Directory folder) {
    final YamlMap? background = node["given"] as YamlMap?;
    String? query;

    String? schema;
    Map<String, dynamic>? testData;

    if (background != null) {
      query = background["query"] as String?;
      schema = background["schema"] as String?;
      if (background["schema-file"] != null) {
        schema = File(
          "${folder.path}${Platform.pathSeparator}${background["schema-file"]}",
        ).readAsStringSync();
      }

      testData = json.decode(
        json.encode(background["test-data"]),
      ) as Map<String, dynamic>?;
    }

    return TestCase(
      name: node["name"] as String?,
      query: query ?? "",
      schema: schema,
      testData: testData,
      action: buildAction(node["when"] as YamlMap),
      assertions: buildAssertions(node["then"] as YamlNode?),
    );
  }

  Action? buildAction(YamlMap node) {
    if (node.containsKey("parse")) {
      return ParsingAction();
    }
    if (node.containsKey("validate")) {
      return ValidationAction(
        (node["validate"] as YamlList).map(
          (dynamic rule) => rule as String?,
        ),
      );
    }
    if (node.containsKey("execute")) {
      return ExecutionAction(
        operationName: node["operation-name"] as String?,
        variables: json.decode(
          json.encode(node["variables"]),
        ) as Map<String, dynamic>?,
        validateQuery: node["validate-query"] == true,
        testValue: node["test-value"] as String?,
      );
    }

    return null;
  }

  Iterable<Assertion?>? buildAssertions(YamlNode? node) {
    if (node is YamlList) {
      return node.map((dynamic n) => buildAssertion(n as YamlNode?));
    }

    if (node is YamlMap) {
      return [buildAssertion(node)];
    }

    return null;
  }

  Assertion? buildAssertion(YamlNode? node) {
    if (node is YamlMap) {
      if (node.containsKey("passes")) {
        return PassesAssertion(
          passes: node["passes"] as bool?,
        );
      }

      if (node.containsKey("syntax-error")) {
        return SyntaxErrorAssertion(
          syntaxError: node["syntax-error"] as bool?,
        );
      }

      if (node.containsKey("error-count")) {
        return ErrorCountAssertion(
          count: node["error-count"] as int?,
        );
      }

      if (node.containsKey("error-code")) {
        return ErrorCodeAssertion(
          errorCode: node["error-code"] as String?,
//          args: node["args"],
//          locations: node["error-code"],
        );
      }
    }

    return null;
  }
}
