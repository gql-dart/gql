// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'schema.schema.gql.g.dart';

abstract class pokemonInput
    implements Built<pokemonInput, pokemonInputBuilder> {
  pokemonInput._();

  factory pokemonInput([Function(pokemonInputBuilder b) updates]) =
      _$pokemonInput;

  @nullable
  String get id;
  @nullable
  String get name;
  static Serializer<pokemonInput> get serializer => _$pokemonInputSerializer;
}
