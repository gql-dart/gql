import "package:built_value/serializer.dart";
import "package:built_value/standard_json_plugin.dart";

/// Deserializes a GraphQL selection with inline fragments into it's
/// appropriate concrete data class based on its `__typename` field.
///
/// If no `__typename` is found, it will simply return a base data class that
/// only includes the common fields.
class InlineFragmentSerializer<T> implements StructuredSerializer<T> {
  final String rootName;
  final Type baseClass;
  final List<Type> asTypeClasses;

  InlineFragmentSerializer(
    this.rootName,
    this.baseClass,
    this.asTypeClasses,
  );

  Type _typeForTypename(String name) => asTypeClasses.firstWhere(
        (c) => c.toString() == "${rootName}__as${name}",
        orElse: () => baseClass,
      );

  @override
  T deserialize(
    Serializers serializers,
    Iterable serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    try {
      // Get JSON representation of object
      final json = StandardJsonPlugin()
          .afterSerialize(serialized, specifiedType) as Map<String, dynamic>;
      final typeName = (json["__typename"] ?? "") as String;
      final type = _typeForTypename(typeName);
      final serializer =
          serializers.serializerForType(type) as StructuredSerializer;
      return serializer.deserialize(serializers, serialized,
          specifiedType: specifiedType) as T;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    T object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    try {
      final typeName = (object as dynamic).G__typename as String;
      final type = _typeForTypename(typeName);
      final serializer =
          serializers.serializerForType(type) as StructuredSerializer;
      return serializer.serialize(serializers, object,
          specifiedType: specifiedType);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Iterable<Type> get types => [T];

  @override
  String get wireName => rootName;
}
