class Schema {
  Type queryType;
  Type mutationType;
  Type subscriptionType;

  Iterable<Type> types;
  Iterable<Directive> directives;

  Iterable<AppliedDirective> appliedDirectives;

  Schema({
    this.types,
    this.queryType,
    this.mutationType,
    this.subscriptionType,
    this.directives,
  });
}

enum DirectiveLocation {
  query,
  mutation,
  subscription,
  field,
  fragmentDefinition,
  fragmentSpread,
  inlineFragment,
  schema,
  scalar,
  object,
  fieldDefinition,
  argumentDefinition,
  interface,
  union,
  enumDefinition,
  enumValue,
  inputObject,
  inputFieldDefinition,
}

class InputValue {
  String name;
  String description;
  Type type;
  String defaultValue;
  Iterable<AppliedDirective> appliedDirectives;

  InputValue({
    this.name,
    this.description,
    this.type,
    this.defaultValue,
  });
}

class EnumValue {
  String name;
  String description;
  bool isDeprecated;
  String deprecationReason;
  Iterable<AppliedDirective> appliedDirectives;

  EnumValue({
    this.name,
    this.description,
    this.isDeprecated,
    this.deprecationReason,
  });
}

class Field {
  String name;
  String description;
  bool isDeprecated;
  String deprecationReason;
  Iterable<AppliedDirective> appliedDirectives;
  Iterable<InputValue> args;
  Type type;

  Field({
    this.name,
    this.description,
    this.isDeprecated,
    this.deprecationReason,
    this.args,
    this.type,
  });
}

class Directive {
  String name;
  String description;
  Iterable<DirectiveLocation> locations;
  Iterable<InputValue> args;
  Iterable<AppliedDirective> appliedDirectives;

  Directive({
    this.name,
    this.description,
    this.locations,
    this.args,
  });
}

abstract class WrappingType {
  String name;
  String description;

  WrappingType({
    this.name,
    this.description,
  });
}

abstract class Type extends WrappingType {
  Iterable<AppliedDirective> appliedDirectives;

  Type({
    String name,
    String description,
    this.appliedDirectives,
  }) : super(
          name: name,
          description: description,
        );
}

class Object extends Type {
  Iterable<Field> fields;
  Iterable<Interface> interfaces;

  Object({
    String name,
    String description,
    this.fields,
    this.interfaces,
  }) : super(
          name: name,
          description: description,
        );
}

class Interface extends Type {
  Iterable<Field> fields;
  Iterable<Type> possibleTypes;

  Interface({
    String name,
    String description,
    this.fields,
    this.possibleTypes,
  }) : super(
          name: name,
          description: description,
        );
}

class Union extends Type {
  Iterable<Type> possibleTypes;

  Union({
    String name,
    String description,
    this.possibleTypes,
  }) : super(
          name: name,
          description: description,
        );
}

class Enum extends Type {
  Iterable<EnumValue> enumValues;

  Enum({
    String name,
    String description,
    this.enumValues,
  }) : super(
          name: name,
          description: description,
        );
}

class InputObject extends Type {
  Iterable<InputValue> inputValues;

  InputObject({
    String name,
    String description,
    this.inputValues,
  }) : super(
          name: name,
          description: description,
        );
}

class NonNull<T extends Type> extends Type {
  T ofType;

  NonNull({
    String name,
    String description,
    this.ofType,
  }) : super(
          name: name,
          description: description,
        );
}

class List<T extends Type> extends Type {
  T ofType;

  List({
    String name,
    String description,
    this.ofType,
  }) : super(
          name: name,
          description: description,
        );
}

class Scalar extends Type {
  Scalar({
    String name,
    String description,
  }) : super(
          name: name,
          description: description,
        );
}

class AppliedDirective {
  Directive directive;
  Iterable<AppliedDirectiveArgument> args;

  AppliedDirective({
    this.directive,
    this.args,
  });
}

class AppliedDirectiveArgument {
  String name;
  String value;

  AppliedDirectiveArgument({
    this.name,
    this.value,
  });
}
