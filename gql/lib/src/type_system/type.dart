import "package:meta/meta.dart";

class Schema {
  Object queryType;
  Object mutationType;
  Object subscriptionType;

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

abstract class Base {
  String name;
  String description;

  Iterable<AppliedDirective> appliedDirectives;

  Base({
    @required this.name,
    @required this.description,
    @required this.appliedDirectives,
  });
}

class InputValue extends Base {
  Type type;
  String defaultValue;

  InputValue({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
    this.type,
    this.defaultValue,
  });
}

class Field extends Base {
  Iterable<InputValue> args;
  Type type;

  Field({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
    this.args,
    this.type,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class Directive extends Base {
  Iterable<DirectiveLocation> locations;
  Iterable<InputValue> args;

  Directive({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
    this.locations,
    this.args,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

abstract class Type extends Base {
  Type({
    @required String name,
    @required String description,
    @required Iterable<AppliedDirective> appliedDirectives,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class Object extends Type {
  Iterable<Field> fields;
  Iterable<Interface> interfaces;

  Object({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
    this.fields,
    this.interfaces,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class Interface extends Type {
  Iterable<Field> fields;
  Iterable<Type> possibleTypes;

  Interface({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
    this.fields,
    this.possibleTypes,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class Union extends Type {
  Iterable<Type> possibleTypes;

  Union({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
    this.possibleTypes,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class Enum extends Type {
  Iterable<EnumValue> enumValues;

  Enum({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
    this.enumValues,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class EnumValue extends Base {
  EnumValue({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class InputObject extends Type {
  Iterable<InputValue> inputValues;

  InputObject({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
    this.inputValues,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

abstract class WrappedType<T extends Type> extends Type {
  T ofType;

  WrappedType({
    @required String name,
    @required String description,
    @required Iterable<AppliedDirective> appliedDirectives,
    @required T ofType,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class NonNull<T extends Type> extends WrappedType<T> {
  NonNull({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
    T ofType,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
          ofType: ofType,
        );
}

class List<T extends Type> extends WrappedType<T> {
  List({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
    T ofType,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
          ofType: ofType,
        );
}

class Scalar extends Type {
  Scalar({
    String name,
    String description,
    Iterable<AppliedDirective> appliedDirectives,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
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
