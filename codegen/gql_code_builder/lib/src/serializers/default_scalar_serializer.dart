import "package:built_value/serializer.dart";

class DefaultScalarSerializer<T> implements PrimitiveSerializer<T> {
  final T Function(Object serialized) _deserialize;

  DefaultScalarSerializer(this._deserialize);

  @override
  final types = <Type>[T];
  @override
  final wireName = T.toString();

  @override
  Object serialize(Serializers serializers, T scalar,
          {FullType specifiedType = FullType.unspecified}) =>
      (scalar as dynamic).value as Object;

  @override
  T deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      _deserialize(serialized);
}
