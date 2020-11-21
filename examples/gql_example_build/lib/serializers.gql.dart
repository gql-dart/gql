import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:gql_example_build/fragments/shape.data.gql.dart'
    show
        GShapeData_shape,
        GShapeData,
        GShapeData_shape__asRectangle,
        GShapeData_shape__asSquare,
        GShapeData_shape__base;
import 'package:gql_example_build/fragments/shape.req.gql.dart' show GShape;
import 'package:gql_example_build/fragments/shape.var.gql.dart' show GShapeVars;
import 'package:gql_example_build/kitchen_sink/query.data.gql.dart'
    show
        GQueryOperationData,
        GQueryOperationData_field,
        GQueryOperationData_field_field,
        GQueryOperationData_field_fieldRequired;
import 'package:gql_example_build/kitchen_sink/query.req.gql.dart'
    show GQueryOperation;
import 'package:gql_example_build/kitchen_sink/query.var.gql.dart'
    show GQueryOperationVars;
import 'package:gql_example_build/schema.schema.gql.dart'
    show GEnum, GInput, GScalar;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(GShapeData_shape.serializer)
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GEnum,
  GInput,
  GQueryOperation,
  GQueryOperationData,
  GQueryOperationData_field,
  GQueryOperationData_field_field,
  GQueryOperationData_field_fieldRequired,
  GQueryOperationVars,
  GScalar,
  GShape,
  GShapeData,
  GShapeData_shape__asRectangle,
  GShapeData_shape__asSquare,
  GShapeData_shape__base,
  GShapeVars
])
final Serializers serializers = _serializersBuilder.build();
