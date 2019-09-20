import "dart:core" as core;
import "package:meta/meta.dart";

class Schema {
  Object queryType;
  Object mutationType;
  Object subscriptionType;

  core.List<Type> types;
  core.List<Directive> directives;

  core.List<AppliedDirective> appliedDirectives;

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
  core.String name;
  core.String description;

  core.List<AppliedDirective> appliedDirectives;

  Base({
    @required this.name,
    @required this.description,
    @required this.appliedDirectives,
  });
}

class InputValue extends Base {
  Type type;
  core.String defaultValue;

  InputValue({
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
    this.type,
    this.defaultValue,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class Field extends Base {
  core.List<InputValue> args;
  Type type;

  Field({
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
    this.args,
    this.type,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class Directive extends Base {
  core.List<DirectiveLocation> locations;
  core.List<InputValue> args;

  Directive({
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
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
    @required core.String name,
    @required core.String description,
    core.List<AppliedDirective> appliedDirectives,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class Object extends Type {
  core.List<Field> fields;
  core.List<Interface> interfaces;

  Object({
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
    this.fields,
    this.interfaces,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class Interface extends Type {
  core.List<Field> fields;
  core.List<Type> possibleTypes;

  Interface({
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
    this.fields,
    this.possibleTypes,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class Union extends Type {
  core.List<Type> possibleTypes;

  Union({
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
    this.possibleTypes,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class Enum extends Type {
  core.List<EnumValue> enumValues;

  Enum({
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
    this.enumValues,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class EnumValue extends Base {
  EnumValue({
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class InputObject extends Type {
  core.List<InputValue> inputValues;

  InputObject({
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
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
    @required core.String name,
    @required core.String description,
    core.List<AppliedDirective> appliedDirectives,
    @required this.ofType,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class NonNull<T extends Type> extends WrappedType<T> {
  NonNull({
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
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
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
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
    core.String name,
    core.String description,
    core.List<AppliedDirective> appliedDirectives,
  }) : super(
          name: name,
          description: description,
          appliedDirectives: appliedDirectives,
        );
}

class AppliedDirective {
  Directive directive;
  core.List<AppliedDirectiveArgument> args;

  AppliedDirective({
    this.directive,
    this.args,
  });
}

class AppliedDirectiveArgument {
  core.String name;
  core.String value;

  AppliedDirectiveArgument({
    this.name,
    this.value,
  });
}
