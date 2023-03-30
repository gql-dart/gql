// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const schema = _i1.SchemaDefinitionNode(
  directives: [],
  operationTypes: [
    _i1.OperationTypeDefinitionNode(
      operation: _i1.OperationType.query,
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Query'),
        isNonNull: false,
      ),
    ),
    _i1.OperationTypeDefinitionNode(
      operation: _i1.OperationType.mutation,
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Mutation'),
        isNonNull: false,
      ),
    ),
    _i1.OperationTypeDefinitionNode(
      operation: _i1.OperationType.subscription,
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Subscription'),
        isNonNull: false,
      ),
    ),
  ],
);
const Gextends = _i1.DirectiveDefinitionNode(
  name: _i1.NameNode(value: 'extends'),
  args: [],
  locations: [
    _i1.DirectiveLocation.object,
    _i1.DirectiveLocation.interface,
  ],
  repeatable: false,
);
const Query = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Query'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'hero'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'episode'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Episode'),
            isNonNull: false,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Character'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'reviews'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'episode'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Episode'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Review'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'search'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'text'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'String'),
            isNonNull: false,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'SearchResult'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'character'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ID'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Character'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'droid'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ID'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Droid'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'human'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ID'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Human'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'starship'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'id'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ID'),
            isNonNull: true,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Starship'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'posts'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'userId'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ID'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'filter'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Json'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Post'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
  ],
);
const Mutation = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Mutation'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createReview'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'episode'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Episode'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'review'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ReviewInput'),
            isNonNull: true,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'createdAt'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Date'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Review'),
        isNonNull: false,
      ),
    )
  ],
);
const Subscription = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Subscription'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'reviewAdded'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'episode'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Episode'),
            isNonNull: false,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Review'),
        isNonNull: false,
      ),
    )
  ],
);
const Episode = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'Episode'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'NEWHOPE'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'EMPIRE'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'JEDI'),
      directives: [],
    ),
  ],
);
const Character = _i1.InterfaceTypeDefinitionNode(
  name: _i1.NameNode(value: 'Character'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ID'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'friends'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Character'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'friendsConnection'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'first'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'after'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ID'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'FriendsConnection'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'appearsIn'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Episode'),
          isNonNull: false,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const LengthUnit = _i1.EnumTypeDefinitionNode(
  name: _i1.NameNode(value: 'LengthUnit'),
  directives: [],
  values: [
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'METER'),
      directives: [],
    ),
    _i1.EnumValueDefinitionNode(
      name: _i1.NameNode(value: 'FOOT'),
      directives: [],
    ),
  ],
);
const Human = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Human'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'Character'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ID'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'homePlanet'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'height'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'unit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'LengthUnit'),
            isNonNull: false,
          ),
          defaultValue: _i1.EnumValueNode(name: _i1.NameNode(value: 'METER')),
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'mass'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'friends'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Character'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'friendsConnection'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'first'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'after'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ID'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'FriendsConnection'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'appearsIn'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Episode'),
          isNonNull: false,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'starships'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Starship'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'birthday'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Date'),
        isNonNull: true,
      ),
    ),
  ],
);
const Droid = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Droid'),
  directives: [],
  interfaces: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'Character'),
      isNonNull: false,
    )
  ],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ID'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'friends'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Character'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'friendsConnection'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'first'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Int'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'after'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'ID'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'FriendsConnection'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'appearsIn'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Episode'),
          isNonNull: false,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'primaryFunction'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
  ],
);
const FriendsConnection = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'FriendsConnection'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'totalCount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'edges'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'FriendsEdge'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'friends'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Character'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'pageInfo'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'PageInfo'),
        isNonNull: true,
      ),
    ),
  ],
);
const FriendsEdge = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'FriendsEdge'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'cursor'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ID'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'node'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Character'),
        isNonNull: false,
      ),
    ),
  ],
);
const PageInfo = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'PageInfo'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'startCursor'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ID'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'endCursor'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ID'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'hasNextPage'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Boolean'),
        isNonNull: true,
      ),
    ),
  ],
);
const Review = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Review'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'episode'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Episode'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'stars'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'commentary'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'createdAt'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Date'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'seenOn'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Date'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'custom'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'CustomField'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
    ),
  ],
);
const ReviewInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ReviewInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'stars'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'commentary'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'favorite_color'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ColorInput'),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'seenOn'),
      directives: [],
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'Date'),
          isNonNull: false,
        ),
        isNonNull: false,
      ),
      defaultValue: null,
    ),
  ],
);
const ColorInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'ColorInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'red'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'green'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'blue'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: null,
    ),
  ],
);
const Starship = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Starship'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ID'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'name'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'length'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'unit'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'LengthUnit'),
            isNonNull: false,
          ),
          defaultValue: _i1.EnumValueNode(name: _i1.NameNode(value: 'METER')),
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'coordinates'),
      directives: [],
      args: [],
      type: _i1.ListTypeNode(
        type: _i1.ListTypeNode(
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Float'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        isNonNull: false,
      ),
    ),
  ],
);
const Post = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'Post'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ID'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'body'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'favoritedUsers'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'PostLikesInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'filter'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'Json'),
            isNonNull: false,
          ),
          defaultValue: null,
        ),
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'PostLikes'),
        isNonNull: false,
      ),
    ),
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'likedUsers'),
      directives: [],
      args: [
        _i1.InputValueDefinitionNode(
          name: _i1.NameNode(value: 'where'),
          directives: [],
          type: _i1.NamedTypeNode(
            name: _i1.NameNode(value: 'PostFavoritesInput'),
            isNonNull: false,
          ),
          defaultValue: null,
        )
      ],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'PostFavorites'),
        isNonNull: false,
      ),
    ),
  ],
);
const PostLikes = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'PostLikes'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'totalCount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    )
  ],
);
const PostFavorites = _i1.ObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'PostFavorites'),
  directives: [],
  interfaces: [],
  fields: [
    _i1.FieldDefinitionNode(
      name: _i1.NameNode(value: 'totalCount'),
      directives: [],
      args: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
    )
  ],
);
const PostLikesInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'PostLikesInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ID'),
        isNonNull: true,
      ),
      defaultValue: null,
    )
  ],
);
const PostFavoritesInput = _i1.InputObjectTypeDefinitionNode(
  name: _i1.NameNode(value: 'PostFavoritesInput'),
  directives: [],
  fields: [
    _i1.InputValueDefinitionNode(
      name: _i1.NameNode(value: 'id'),
      directives: [],
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'ID'),
        isNonNull: true,
      ),
      defaultValue: null,
    )
  ],
);
const SearchResult = _i1.UnionTypeDefinitionNode(
  name: _i1.NameNode(value: 'SearchResult'),
  directives: [],
  types: [
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'Human'),
      isNonNull: false,
    ),
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'Droid'),
      isNonNull: false,
    ),
    _i1.NamedTypeNode(
      name: _i1.NameNode(value: 'Starship'),
      isNonNull: false,
    ),
  ],
);
const Date = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'Date'),
  directives: [],
);
const ISODate = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'ISODate'),
  directives: [],
);
const CustomField = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'CustomField'),
  directives: [],
);
const Json = _i1.ScalarTypeDefinitionNode(
  name: _i1.NameNode(value: 'Json'),
  directives: [],
);
const document = _i1.DocumentNode(definitions: [
  schema,
  Gextends,
  Query,
  Mutation,
  Subscription,
  Episode,
  Character,
  LengthUnit,
  Human,
  Droid,
  FriendsConnection,
  FriendsEdge,
  PageInfo,
  Review,
  ReviewInput,
  ColorInput,
  Starship,
  Post,
  PostLikes,
  PostFavorites,
  PostLikesInput,
  PostFavoritesInput,
  SearchResult,
  Date,
  ISODate,
  CustomField,
  Json,
]);
