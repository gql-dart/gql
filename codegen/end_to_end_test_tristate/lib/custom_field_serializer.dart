import 'package:gql_code_builder/src/serializers/json_serializer.dart';

import './custom_field.dart';

class CustomFieldSerializer extends JsonSerializer<CustomField> {
  @override
  CustomField fromJson(Map<String, dynamic> json) => CustomField.fromJson(json);

  @override
  Map<String, dynamic> toJson(CustomField customField) => customField.toJson();
}
