import "package:built_value/serializer.dart";
import "package:built_value/standard_json_plugin.dart";

/// A serializer which can be implemented to easily build a Json Serializer
abstract class JsonSerializer<T> implements StructuredSerializer<T> {
  final _jsonPlugin = StandardJsonPlugin();

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson(T object);

  @override
  T deserialize(
    Serializers serializers,
    Iterable serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final json = _jsonPlugin.afterSerialize(serialized, specifiedType)
        as Map<String, dynamic>;
    return fromJson(json);
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    T object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final json = toJson(object);
    final serialized = _jsonPlugin.beforeDeserialize(json, FullType(T));
    return serialized is Iterable ? serialized : [serialized];
  }

  @override
  Iterable<Type> get types => [T];

  @override
  String get wireName => T.toString();
}
