// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:gql_example_build/schema.schema.gql.dart' as _i1;

class $QueryOperation {
  const $QueryOperation(this.data);

  final Map<String, dynamic> data;

  $QueryOperation$field get field => data['field'] == null
      ? null
      : $QueryOperation$field((data['field'] as Map<String, dynamic>));
}

class $QueryOperation$field {
  const $QueryOperation$field(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
  bool get bool => (data['bool'] as bool);
  int get int => (data['int'] as int);
  double get float => data['float']?.toDouble();
  String get string => (data['string'] as String);
  _i1.Scalar get scalar => _i1.Scalar((data['scalar'] as String));
  _i1.Enum get enum$ => _i1.Enum((data['enum'] as String));
  $QueryOperation$field$field get field => data['field'] == null
      ? null
      : $QueryOperation$field$field((data['field'] as Map<String, dynamic>));
  String get idRequired => (data['idRequired'] as String);
  bool get boolRequired => (data['boolRequired'] as bool);
  int get intRequired => (data['intRequired'] as int);
  double get floatRequired => data['floatRequired']?.toDouble();
  String get stringRequired => (data['stringRequired'] as String);
  _i1.Scalar get scalarRequired =>
      _i1.Scalar((data['scalarRequired'] as String));
  _i1.Enum get enumRequired => _i1.Enum((data['enumRequired'] as String));
  $QueryOperation$field$fieldRequired get fieldRequired =>
      data['fieldRequired'] == null
          ? null
          : $QueryOperation$field$fieldRequired(
              (data['fieldRequired'] as Map<String, dynamic>));
}

class $QueryOperation$field$field {
  const $QueryOperation$field$field(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
}

class $QueryOperation$field$fieldRequired {
  const $QueryOperation$field$fieldRequired(this.data);

  final Map<String, dynamic> data;

  String get id => (data['id'] as String);
}
