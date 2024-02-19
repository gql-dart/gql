import 'package:built_value/serializer.dart';
import 'package:end_to_end_test_tristate/custom_date.dart';

class CustomDateSerializer implements PrimitiveSerializer<CustomDate> {
  @override
  CustomDate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    assert(serialized is String,
        "CustomDateSerializer expected 'String' but got ${serialized.runtimeType}");
    return CustomDate.parse(serialized as String).toLocal();
  }

  @override
  String serialize(
    Serializers serializers,
    CustomDate date, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return date.toUtc().toIso8601String().split('T').first;
  }

  @override
  Iterable<Type> get types => [CustomDate];

  @override
  String get wireName => 'Date';
}
