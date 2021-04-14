import 'dart:io';
import 'dart:convert';

import 'package:yaml/yaml.dart';

import './cat_model.dart';

class CatBuilder {
  Suite buildSuite(String suitePath) {
    var dir = Directory(suitePath);

    var folders = dir.listSync().whereType<Directory>();

    var scenarios = folders.expand(
      (folder) => folder
          .listSync()
          .whereType<File>()
          .where(
            (file) => file.path.endsWith('.yaml'),
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
    var doc = loadYaml(
      file.readAsStringSync(),
      sourceUrl: Uri.file(file.path),
    );

    var schema;
    var testData;

    var background = doc['background'];

    if (background != null) {
      schema = background['schema'];
      if (background['schema-file'] != null) {
        schema = File(
          '${folder.path}${Platform.pathSeparator}${background['schema-file']}',
        ).readAsStringSync();
      }

      testData = json.decode(
        json.encode(background['test-data']),
      );
      if (background['test-data-file'] != null) {
        testData = File(
          '${folder.path}${Platform.pathSeparator}${background['test-data-file']}',
        ).readAsStringSync();
      }
    }

    return Scenario(
      folder: folder.path,
      file: file.path,
      name: doc['scenario'],
      tests: buildTests(doc['tests'], folder),
      schema: schema,
      testData: testData,
    );
  }

  Iterable<TestCase>? buildTests(YamlNode? node, Directory folder) {
    if (node is YamlList) {
      return node.map((n) => buildTest(n, folder));
    }

    return null;
  }

  TestCase buildTest(YamlMap node, Directory folder) {
    var background = node['given'];
    var query = background['query'];

    var schema;
    var testData;

    if (background != null) {
      schema = background['schema'];
      if (background['schema-file'] != null) {
        schema = File(
          '${folder.path}${Platform.pathSeparator}${background['schema-file']}',
        ).readAsStringSync();
      }

      testData = json.decode(
        json.encode(background['test-data']),
      );
      if (background['test-data-file'] != null) {
        testData = File(
          '${folder.path}${Platform.pathSeparator}${background['test-data-file']}',
        ).readAsStringSync();
      }
    }

    return TestCase(
      name: node['name'],
      query: query,
      schema: schema,
      testData: testData,
      action: buildAction(node['when']),
      assertions: buildAssertions(node['then']),
    );
  }

  Action? buildAction(YamlMap node) {
    if (node.containsKey('parse')) {
      return ParsingAction();
    }
    if (node.containsKey('validate')) {
      return ValidationAction(
        (node['validate'] as YamlList).map(
          (rule) => rule,
        ),
      );
    }
    if (node.containsKey('execute')) {
      return ExecutionAction(
        operationName: node['operation-name'],
        variables: json.decode(
          json.encode(node['variables']),
        ),
        validateQuery: node['validate-query'],
        testValue: node['test-value'],
      );
    }

    return null;
  }

  Iterable<Assertion?>? buildAssertions(YamlNode? node) {
    if (node is YamlList) {
      return node.map((n) => buildAssertion(n));
    }

    if (node is YamlMap) {
      return [buildAssertion(node)];
    }

    return null;
  }

  Assertion? buildAssertion(YamlNode? node) {
    if (node is YamlMap) {
      if (node.containsKey('passes')) {
        return PassesAssertion(
          passes: node['passes'] as bool?,
        );
      }

      if (node.containsKey('syntax-error')) {
        return SyntaxErrorAssertion(
          syntaxError: node['syntax-error'] as bool?,
        );
      }

      if (node.containsKey('error-count')) {
        return ErrorCountAssertion(
          count: node['error-count'],
        );
      }

      if (node.containsKey('error-code')) {
        return ErrorCodeAssertion(
          errorCode: node['error-code'],
//          args: node['args'],
//          locations: node['error-code'],
        );
      }
    }

    return null;
  }
}
