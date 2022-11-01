// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_example_cli_github/__generated__/serializers.gql.dart'
    as _i1;

part 'read_repos.var.gql.g.dart';

abstract class GReadRepositoriesVars
    implements Built<GReadRepositoriesVars, GReadRepositoriesVarsBuilder> {
  GReadRepositoriesVars._();

  factory GReadRepositoriesVars(
          [Function(GReadRepositoriesVarsBuilder b) updates]) =
      _$GReadRepositoriesVars;

  int get nRepositories;
  static Serializer<GReadRepositoriesVars> get serializer =>
      _$gReadRepositoriesVarsSerializer;
  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GReadRepositoriesVars.serializer,
        this,
      ) as Map<String, dynamic>);
  static GReadRepositoriesVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GReadRepositoriesVars.serializer,
        json,
      );
}
