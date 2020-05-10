// GENERATED CODE - DO NOT MODIFY BY HAND

class Scalar {
  const Scalar(this.value);

  final String value;

  @override
  int get hashCode => value.hashCode;
  @override
  bool operator ==(Object o) => o is Scalar && o.value == value;
}

class Enum {
  const Enum(this.value);

  final String value;

  static const Enum ON = Enum('ON');

  static const Enum OFF = Enum('OFF');

  @override
  int get hashCode => value.hashCode;
  @override
  bool operator ==(Object o) => o is Enum && o.value == value;
}

class Input {
  final Map<String, dynamic> input = <String, dynamic>{};

  set id(String value) => input['id'] = value;
  set bool(bool value) => input['bool'] = value;
  set int(int value) => input['int'] = value;
  set float(double value) => input['float'] = value;
  set string(String value) => input['string'] = value;
  set scalar(Scalar value) => input['scalar'] = value.value;
  set enum$(Enum value) => input['enum'] = value.value;
  set input(Input value) => input['input'] = value.input;
  set idRequired(String value) => input['idRequired'] = value;
  set boolRequired(bool value) => input['boolRequired'] = value;
  set intRequired(int value) => input['intRequired'] = value;
  set floatRequired(double value) => input['floatRequired'] = value;
  set stringRequired(String value) => input['stringRequired'] = value;
  set scalarRequired(Scalar value) => input['scalarRequired'] = value.value;
  set enumRequired(Enum value) => input['enumRequired'] = value.value;
  set inputRequired(Input value) => input['inputRequired'] = value.input;
}
