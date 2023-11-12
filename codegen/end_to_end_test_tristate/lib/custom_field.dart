import 'package:collection/collection.dart';

class CustomField {
  String someString;
  double someDouble;
  Map<String, dynamic> someJSON;

  CustomField(this.someString, this.someDouble, this.someJSON);

  Map<String, dynamic> toJson() => {
        'someString': someString,
        'someDouble': someDouble,
        'someJSON': someJSON,
      };

  factory CustomField.fromJson(Map<String, dynamic> json) => CustomField(
        json['someString'],
        json['someDouble'],
        json['someJSON'],
      );

  @override
  bool operator ==(Object other) =>
      other is CustomField &&
      other.someString == this.someString &&
      other.someDouble == this.someDouble &&
      const DeepCollectionEquality().equals(other.someJSON, this.someJSON);

  @override
  int get hashCode => DeepCollectionEquality().hash(toJson());
}
