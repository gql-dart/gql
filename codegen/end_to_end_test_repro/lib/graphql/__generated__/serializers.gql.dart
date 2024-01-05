import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:end_to_end_test_repro/graphql/__generated__/query.data.gql.dart'
    show
        GChildFragmentData,
        GChildFragmentData__asChildReproA_childs,
        GChildFragmentData__asChildReproA,
        GChildFragmentData__asChildReproA_childs__asChildReproB,
        GChildFragmentData__asChildReproA_childs__base,
        GChildFragmentData__base,
        GReproQueryData,
        GReproQueryData_repro;
import 'package:end_to_end_test_repro/graphql/__generated__/query.req.gql.dart'
    show GReproQuery;
import 'package:end_to_end_test_repro/graphql/__generated__/query.var.gql.dart'
    show GChildFragmentVars, GReproQueryVars;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..add(GChildFragmentData.serializer)
  ..add(GChildFragmentData__asChildReproA_childs.serializer)
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GChildFragmentData__asChildReproA,
  GChildFragmentData__asChildReproA_childs__asChildReproB,
  GChildFragmentData__asChildReproA_childs__base,
  GChildFragmentData__base,
  GChildFragmentVars,
  GReproQuery,
  GReproQueryData,
  GReproQueryData_repro,
  GReproQueryVars,
])
final Serializers serializers = _serializersBuilder.build();
