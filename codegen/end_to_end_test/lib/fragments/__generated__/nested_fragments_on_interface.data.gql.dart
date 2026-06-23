// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:end_to_end_test/graphql/__generated__/serializers.gql.dart'
    as _i1;
import 'package:gql_code_builder_serializers/gql_code_builder_serializers.dart'
    as _i2;

part 'nested_fragments_on_interface.data.gql.g.dart';

abstract class GGetBooksData
    implements Built<GGetBooksData, GGetBooksDataBuilder> {
  GGetBooksData._();

  factory GGetBooksData([void Function(GGetBooksDataBuilder b) updates]) =
      _$GGetBooksData;

  static void _initializeBuilder(GGetBooksDataBuilder b) =>
      b..G__typename = 'Query';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GGetBooksData_books> get books;
  static Serializer<GGetBooksData> get serializer => _$gGetBooksDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData.serializer,
        json,
      );
}

abstract class GGetBooksData_books implements GBookFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GGetBooksData_books_author get author;
  @override
  String get title;
  static Serializer<GGetBooksData_books> get serializer =>
      _i2.InlineFragmentSerializer<GGetBooksData_books>(
        'GGetBooksData_books',
        GGetBooksData_books__base,
        {
          'Textbook': GGetBooksData_books__asTextbook,
          'ColoringBook': GGetBooksData_books__asColoringBook,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books.serializer,
        json,
      );
}

extension GGetBooksData_booksWhenExtension on GGetBooksData_books {
  _T when<_T>({
    required _T Function(GGetBooksData_books__asTextbook) textbook,
    required _T Function(GGetBooksData_books__asColoringBook) coloringBook,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Textbook':
        return textbook((this as GGetBooksData_books__asTextbook));
      case 'ColoringBook':
        return coloringBook((this as GGetBooksData_books__asColoringBook));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetBooksData_books__asTextbook)? textbook,
    _T Function(GGetBooksData_books__asColoringBook)? coloringBook,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Textbook':
        return textbook != null
            ? textbook((this as GGetBooksData_books__asTextbook))
            : orElse();
      case 'ColoringBook':
        return coloringBook != null
            ? coloringBook((this as GGetBooksData_books__asColoringBook))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GGetBooksData_books__base
    implements
        Built<GGetBooksData_books__base, GGetBooksData_books__baseBuilder>,
        GGetBooksData_books,
        GBookFragment {
  GGetBooksData_books__base._();

  factory GGetBooksData_books__base(
          [void Function(GGetBooksData_books__baseBuilder b) updates]) =
      _$GGetBooksData_books__base;

  static void _initializeBuilder(GGetBooksData_books__baseBuilder b) =>
      b..G__typename = 'Book';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GGetBooksData_books__base_author get author;
  @override
  String get title;
  static Serializer<GGetBooksData_books__base> get serializer =>
      _$gGetBooksDataBooksBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__base? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__base.serializer,
        json,
      );
}

abstract class GGetBooksData_books__base_author
    implements
        GGetBooksData_books_author,
        GBookFragment_author,
        GAuthorFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GGetBooksData_books__base_author> get serializer =>
      _i2.InlineFragmentSerializer<GGetBooksData_books__base_author>(
        'GGetBooksData_books__base_author',
        GGetBooksData_books__base_author__base,
        {
          'Person': GGetBooksData_books__base_author__asPerson,
          'Company': GGetBooksData_books__base_author__asCompany,
          'Group': GGetBooksData_books__base_author__asGroup,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__base_author.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__base_author? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__base_author.serializer,
        json,
      );
}

extension GGetBooksData_books__base_authorWhenExtension
    on GGetBooksData_books__base_author {
  _T when<_T>({
    required _T Function(GGetBooksData_books__base_author__asPerson) person,
    required _T Function(GGetBooksData_books__base_author__asCompany) company,
    required _T Function(GGetBooksData_books__base_author__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GGetBooksData_books__base_author__asPerson));
      case 'Company':
        return company((this as GGetBooksData_books__base_author__asCompany));
      case 'Group':
        return group((this as GGetBooksData_books__base_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetBooksData_books__base_author__asPerson)? person,
    _T Function(GGetBooksData_books__base_author__asCompany)? company,
    _T Function(GGetBooksData_books__base_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GGetBooksData_books__base_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GGetBooksData_books__base_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GGetBooksData_books__base_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GGetBooksData_books__base_author__base
    implements
        Built<GGetBooksData_books__base_author__base,
            GGetBooksData_books__base_author__baseBuilder>,
        GGetBooksData_books__base_author,
        GAuthorFragment {
  GGetBooksData_books__base_author__base._();

  factory GGetBooksData_books__base_author__base(
      [void Function(GGetBooksData_books__base_author__baseBuilder b)
          updates]) = _$GGetBooksData_books__base_author__base;

  static void _initializeBuilder(
          GGetBooksData_books__base_author__baseBuilder b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GGetBooksData_books__base_author__base> get serializer =>
      _$gGetBooksDataBooksBaseAuthorBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__base_author__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__base_author__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__base_author__base.serializer,
        json,
      );
}

abstract class GGetBooksData_books__base_author__asPerson
    implements
        Built<GGetBooksData_books__base_author__asPerson,
            GGetBooksData_books__base_author__asPersonBuilder>,
        GGetBooksData_books_author,
        GBookFragment_author,
        GAuthorFragment,
        GGetBooksData_books_author__asPerson,
        GBookFragment_author__asPerson,
        GAuthorFragment__asPerson,
        GGetBooksData_books__base_author,
        GAuthorPersonFragment {
  GGetBooksData_books__base_author__asPerson._();

  factory GGetBooksData_books__base_author__asPerson(
      [void Function(GGetBooksData_books__base_author__asPersonBuilder b)
          updates]) = _$GGetBooksData_books__base_author__asPerson;

  static void _initializeBuilder(
          GGetBooksData_books__base_author__asPersonBuilder b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GGetBooksData_books__base_author__asPerson>
      get serializer => _$gGetBooksDataBooksBaseAuthorAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__base_author__asPerson.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__base_author__asPerson? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__base_author__asPerson.serializer,
        json,
      );
}

abstract class GGetBooksData_books__base_author__asCompany
    implements
        Built<GGetBooksData_books__base_author__asCompany,
            GGetBooksData_books__base_author__asCompanyBuilder>,
        GGetBooksData_books_author,
        GBookFragment_author,
        GAuthorFragment,
        GGetBooksData_books_author__asCompany,
        GBookFragment_author__asCompany,
        GAuthorFragment__asCompany,
        GGetBooksData_books__base_author,
        GAuthorCompanyFragment {
  GGetBooksData_books__base_author__asCompany._();

  factory GGetBooksData_books__base_author__asCompany(
      [void Function(GGetBooksData_books__base_author__asCompanyBuilder b)
          updates]) = _$GGetBooksData_books__base_author__asCompany;

  static void _initializeBuilder(
          GGetBooksData_books__base_author__asCompanyBuilder b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<GGetBooksData_books__base_author__asCompany>
      get serializer => _$gGetBooksDataBooksBaseAuthorAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__base_author__asCompany.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__base_author__asCompany? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__base_author__asCompany.serializer,
        json,
      );
}

abstract class GGetBooksData_books__base_author__asGroup
    implements
        Built<GGetBooksData_books__base_author__asGroup,
            GGetBooksData_books__base_author__asGroupBuilder>,
        GGetBooksData_books_author,
        GBookFragment_author,
        GAuthorFragment,
        GGetBooksData_books_author__asGroup,
        GBookFragment_author__asGroup,
        GAuthorFragment__asGroup,
        GGetBooksData_books__base_author {
  GGetBooksData_books__base_author__asGroup._();

  factory GGetBooksData_books__base_author__asGroup(
      [void Function(GGetBooksData_books__base_author__asGroupBuilder b)
          updates]) = _$GGetBooksData_books__base_author__asGroup;

  static void _initializeBuilder(
          GGetBooksData_books__base_author__asGroupBuilder b) =>
      b..G__typename = 'Group';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GGetBooksData_books__base_author__asGroup_members> get members;
  static Serializer<GGetBooksData_books__base_author__asGroup> get serializer =>
      _$gGetBooksDataBooksBaseAuthorAsGroupSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__base_author__asGroup.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__base_author__asGroup? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__base_author__asGroup.serializer,
        json,
      );
}

abstract class GGetBooksData_books__base_author__asGroup_members
    implements
        GGetBooksData_books_author__asGroup_members,
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GGetBooksData_books__base_author__asGroup_members>
      get serializer => _i2.InlineFragmentSerializer<
              GGetBooksData_books__base_author__asGroup_members>(
            'GGetBooksData_books__base_author__asGroup_members',
            GGetBooksData_books__base_author__asGroup_members__base,
            {
              'Person':
                  GGetBooksData_books__base_author__asGroup_members__asPerson,
              'Company':
                  GGetBooksData_books__base_author__asGroup_members__asCompany,
            },
          );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__base_author__asGroup_members.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__base_author__asGroup_members? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__base_author__asGroup_members.serializer,
        json,
      );
}

extension GGetBooksData_books__base_author__asGroup_membersWhenExtension
    on GGetBooksData_books__base_author__asGroup_members {
  _T when<_T>({
    required _T Function(
            GGetBooksData_books__base_author__asGroup_members__asPerson)
        person,
    required _T Function(
            GGetBooksData_books__base_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this
            as GGetBooksData_books__base_author__asGroup_members__asPerson));
      case 'Company':
        return company((this
            as GGetBooksData_books__base_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetBooksData_books__base_author__asGroup_members__asPerson)?
        person,
    _T Function(GGetBooksData_books__base_author__asGroup_members__asCompany)?
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this
                as GGetBooksData_books__base_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this
                as GGetBooksData_books__base_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GGetBooksData_books__base_author__asGroup_members__base
    implements
        Built<GGetBooksData_books__base_author__asGroup_members__base,
            GGetBooksData_books__base_author__asGroup_members__baseBuilder>,
        GGetBooksData_books__base_author__asGroup_members,
        GAuthorGroupFragment {
  GGetBooksData_books__base_author__asGroup_members__base._();

  factory GGetBooksData_books__base_author__asGroup_members__base(
      [void Function(
              GGetBooksData_books__base_author__asGroup_members__baseBuilder b)
          updates]) = _$GGetBooksData_books__base_author__asGroup_members__base;

  static void _initializeBuilder(
          GGetBooksData_books__base_author__asGroup_members__baseBuilder b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GGetBooksData_books__base_author__asGroup_members__base>
      get serializer =>
          _$gGetBooksDataBooksBaseAuthorAsGroupMembersBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__base_author__asGroup_members__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__base_author__asGroup_members__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__base_author__asGroup_members__base.serializer,
        json,
      );
}

abstract class GGetBooksData_books__base_author__asGroup_members__asPerson
    implements
        Built<GGetBooksData_books__base_author__asGroup_members__asPerson,
            GGetBooksData_books__base_author__asGroup_members__asPersonBuilder>,
        GGetBooksData_books_author__asGroup_members,
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GGetBooksData_books_author__asGroup_members__asPerson,
        GBookFragment_author__asGroup_members__asPerson,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GGetBooksData_books__base_author__asGroup_members,
        GAuthorPersonFragment {
  GGetBooksData_books__base_author__asGroup_members__asPerson._();

  factory GGetBooksData_books__base_author__asGroup_members__asPerson(
      [void Function(
              GGetBooksData_books__base_author__asGroup_members__asPersonBuilder
                  b)
          updates]) = _$GGetBooksData_books__base_author__asGroup_members__asPerson;

  static void _initializeBuilder(
          GGetBooksData_books__base_author__asGroup_members__asPersonBuilder
              b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GGetBooksData_books__base_author__asGroup_members__asPerson>
      get serializer =>
          _$gGetBooksDataBooksBaseAuthorAsGroupMembersAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__base_author__asGroup_members__asPerson.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__base_author__asGroup_members__asPerson? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__base_author__asGroup_members__asPerson.serializer,
        json,
      );
}

abstract class GGetBooksData_books__base_author__asGroup_members__asCompany
    implements
        Built<GGetBooksData_books__base_author__asGroup_members__asCompany,
            GGetBooksData_books__base_author__asGroup_members__asCompanyBuilder>,
        GGetBooksData_books_author__asGroup_members,
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GGetBooksData_books_author__asGroup_members__asCompany,
        GBookFragment_author__asGroup_members__asCompany,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GGetBooksData_books__base_author__asGroup_members,
        GAuthorCompanyFragment {
  GGetBooksData_books__base_author__asGroup_members__asCompany._();

  factory GGetBooksData_books__base_author__asGroup_members__asCompany(
          [void Function(
                  GGetBooksData_books__base_author__asGroup_members__asCompanyBuilder
                      b)
              updates]) =
      _$GGetBooksData_books__base_author__asGroup_members__asCompany;

  static void _initializeBuilder(
          GGetBooksData_books__base_author__asGroup_members__asCompanyBuilder
              b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<
          GGetBooksData_books__base_author__asGroup_members__asCompany>
      get serializer =>
          _$gGetBooksDataBooksBaseAuthorAsGroupMembersAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__base_author__asGroup_members__asCompany.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__base_author__asGroup_members__asCompany? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__base_author__asGroup_members__asCompany.serializer,
        json,
      );
}

abstract class GGetBooksData_books__asTextbook
    implements
        Built<GGetBooksData_books__asTextbook,
            GGetBooksData_books__asTextbookBuilder>,
        GBookFragment,
        GBookFragment__asTextbook,
        GGetBooksData_books {
  GGetBooksData_books__asTextbook._();

  factory GGetBooksData_books__asTextbook(
          [void Function(GGetBooksData_books__asTextbookBuilder b) updates]) =
      _$GGetBooksData_books__asTextbook;

  static void _initializeBuilder(GGetBooksData_books__asTextbookBuilder b) =>
      b..G__typename = 'Textbook';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GGetBooksData_books__asTextbook_author get author;
  @override
  String get title;
  @override
  BuiltList<String> get courses;
  static Serializer<GGetBooksData_books__asTextbook> get serializer =>
      _$gGetBooksDataBooksAsTextbookSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asTextbook.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asTextbook? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asTextbook.serializer,
        json,
      );
}

abstract class GGetBooksData_books__asTextbook_author
    implements
        GBookFragment_author,
        GBookFragment__asTextbook_author,
        GGetBooksData_books_author,
        GAuthorFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GGetBooksData_books__asTextbook_author> get serializer =>
      _i2.InlineFragmentSerializer<GGetBooksData_books__asTextbook_author>(
        'GGetBooksData_books__asTextbook_author',
        GGetBooksData_books__asTextbook_author__base,
        {
          'Person': GGetBooksData_books__asTextbook_author__asPerson,
          'Company': GGetBooksData_books__asTextbook_author__asCompany,
          'Group': GGetBooksData_books__asTextbook_author__asGroup,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asTextbook_author.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asTextbook_author? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asTextbook_author.serializer,
        json,
      );
}

extension GGetBooksData_books__asTextbook_authorWhenExtension
    on GGetBooksData_books__asTextbook_author {
  _T when<_T>({
    required _T Function(GGetBooksData_books__asTextbook_author__asPerson)
        person,
    required _T Function(GGetBooksData_books__asTextbook_author__asCompany)
        company,
    required _T Function(GGetBooksData_books__asTextbook_author__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(
            (this as GGetBooksData_books__asTextbook_author__asPerson));
      case 'Company':
        return company(
            (this as GGetBooksData_books__asTextbook_author__asCompany));
      case 'Group':
        return group((this as GGetBooksData_books__asTextbook_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetBooksData_books__asTextbook_author__asPerson)? person,
    _T Function(GGetBooksData_books__asTextbook_author__asCompany)? company,
    _T Function(GGetBooksData_books__asTextbook_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GGetBooksData_books__asTextbook_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company(
                (this as GGetBooksData_books__asTextbook_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GGetBooksData_books__asTextbook_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GGetBooksData_books__asTextbook_author__base
    implements
        Built<GGetBooksData_books__asTextbook_author__base,
            GGetBooksData_books__asTextbook_author__baseBuilder>,
        GGetBooksData_books__asTextbook_author,
        GAuthorFragment {
  GGetBooksData_books__asTextbook_author__base._();

  factory GGetBooksData_books__asTextbook_author__base(
      [void Function(GGetBooksData_books__asTextbook_author__baseBuilder b)
          updates]) = _$GGetBooksData_books__asTextbook_author__base;

  static void _initializeBuilder(
          GGetBooksData_books__asTextbook_author__baseBuilder b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GGetBooksData_books__asTextbook_author__base>
      get serializer => _$gGetBooksDataBooksAsTextbookAuthorBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asTextbook_author__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asTextbook_author__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asTextbook_author__base.serializer,
        json,
      );
}

abstract class GGetBooksData_books__asTextbook_author__asPerson
    implements
        Built<GGetBooksData_books__asTextbook_author__asPerson,
            GGetBooksData_books__asTextbook_author__asPersonBuilder>,
        GBookFragment_author,
        GBookFragment__asTextbook_author,
        GGetBooksData_books_author,
        GAuthorFragment,
        GBookFragment_author__asPerson,
        GBookFragment__asTextbook_author__asPerson,
        GGetBooksData_books_author__asPerson,
        GAuthorFragment__asPerson,
        GGetBooksData_books__asTextbook_author,
        GAuthorPersonFragment {
  GGetBooksData_books__asTextbook_author__asPerson._();

  factory GGetBooksData_books__asTextbook_author__asPerson(
      [void Function(GGetBooksData_books__asTextbook_author__asPersonBuilder b)
          updates]) = _$GGetBooksData_books__asTextbook_author__asPerson;

  static void _initializeBuilder(
          GGetBooksData_books__asTextbook_author__asPersonBuilder b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GGetBooksData_books__asTextbook_author__asPerson>
      get serializer => _$gGetBooksDataBooksAsTextbookAuthorAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asTextbook_author__asPerson.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asTextbook_author__asPerson? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asTextbook_author__asPerson.serializer,
        json,
      );
}

abstract class GGetBooksData_books__asTextbook_author__asCompany
    implements
        Built<GGetBooksData_books__asTextbook_author__asCompany,
            GGetBooksData_books__asTextbook_author__asCompanyBuilder>,
        GBookFragment_author,
        GBookFragment__asTextbook_author,
        GGetBooksData_books_author,
        GAuthorFragment,
        GBookFragment_author__asCompany,
        GBookFragment__asTextbook_author__asCompany,
        GGetBooksData_books_author__asCompany,
        GAuthorFragment__asCompany,
        GGetBooksData_books__asTextbook_author,
        GAuthorCompanyFragment {
  GGetBooksData_books__asTextbook_author__asCompany._();

  factory GGetBooksData_books__asTextbook_author__asCompany(
      [void Function(GGetBooksData_books__asTextbook_author__asCompanyBuilder b)
          updates]) = _$GGetBooksData_books__asTextbook_author__asCompany;

  static void _initializeBuilder(
          GGetBooksData_books__asTextbook_author__asCompanyBuilder b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<GGetBooksData_books__asTextbook_author__asCompany>
      get serializer => _$gGetBooksDataBooksAsTextbookAuthorAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asTextbook_author__asCompany.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asTextbook_author__asCompany? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asTextbook_author__asCompany.serializer,
        json,
      );
}

abstract class GGetBooksData_books__asTextbook_author__asGroup
    implements
        Built<GGetBooksData_books__asTextbook_author__asGroup,
            GGetBooksData_books__asTextbook_author__asGroupBuilder>,
        GBookFragment_author,
        GBookFragment__asTextbook_author,
        GGetBooksData_books_author,
        GAuthorFragment,
        GBookFragment_author__asGroup,
        GBookFragment__asTextbook_author__asGroup,
        GGetBooksData_books_author__asGroup,
        GAuthorFragment__asGroup,
        GGetBooksData_books__asTextbook_author {
  GGetBooksData_books__asTextbook_author__asGroup._();

  factory GGetBooksData_books__asTextbook_author__asGroup(
      [void Function(GGetBooksData_books__asTextbook_author__asGroupBuilder b)
          updates]) = _$GGetBooksData_books__asTextbook_author__asGroup;

  static void _initializeBuilder(
          GGetBooksData_books__asTextbook_author__asGroupBuilder b) =>
      b..G__typename = 'Group';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GGetBooksData_books__asTextbook_author__asGroup_members>
      get members;
  static Serializer<GGetBooksData_books__asTextbook_author__asGroup>
      get serializer => _$gGetBooksDataBooksAsTextbookAuthorAsGroupSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asTextbook_author__asGroup.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asTextbook_author__asGroup? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asTextbook_author__asGroup.serializer,
        json,
      );
}

abstract class GGetBooksData_books__asTextbook_author__asGroup_members
    implements
        GBookFragment_author__asGroup_members,
        GBookFragment__asTextbook_author__asGroup_members,
        GGetBooksData_books_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GGetBooksData_books__asTextbook_author__asGroup_members>
      get serializer => _i2.InlineFragmentSerializer<
              GGetBooksData_books__asTextbook_author__asGroup_members>(
            'GGetBooksData_books__asTextbook_author__asGroup_members',
            GGetBooksData_books__asTextbook_author__asGroup_members__base,
            {
              'Person':
                  GGetBooksData_books__asTextbook_author__asGroup_members__asPerson,
              'Company':
                  GGetBooksData_books__asTextbook_author__asGroup_members__asCompany,
            },
          );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asTextbook_author__asGroup_members.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asTextbook_author__asGroup_members? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asTextbook_author__asGroup_members.serializer,
        json,
      );
}

extension GGetBooksData_books__asTextbook_author__asGroup_membersWhenExtension
    on GGetBooksData_books__asTextbook_author__asGroup_members {
  _T when<_T>({
    required _T Function(
            GGetBooksData_books__asTextbook_author__asGroup_members__asPerson)
        person,
    required _T Function(
            GGetBooksData_books__asTextbook_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this
            as GGetBooksData_books__asTextbook_author__asGroup_members__asPerson));
      case 'Company':
        return company((this
            as GGetBooksData_books__asTextbook_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            GGetBooksData_books__asTextbook_author__asGroup_members__asPerson)?
        person,
    _T Function(
            GGetBooksData_books__asTextbook_author__asGroup_members__asCompany)?
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this
                as GGetBooksData_books__asTextbook_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this
                as GGetBooksData_books__asTextbook_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GGetBooksData_books__asTextbook_author__asGroup_members__base
    implements
        Built<GGetBooksData_books__asTextbook_author__asGroup_members__base,
            GGetBooksData_books__asTextbook_author__asGroup_members__baseBuilder>,
        GGetBooksData_books__asTextbook_author__asGroup_members,
        GAuthorGroupFragment {
  GGetBooksData_books__asTextbook_author__asGroup_members__base._();

  factory GGetBooksData_books__asTextbook_author__asGroup_members__base(
          [void Function(
                  GGetBooksData_books__asTextbook_author__asGroup_members__baseBuilder
                      b)
              updates]) =
      _$GGetBooksData_books__asTextbook_author__asGroup_members__base;

  static void _initializeBuilder(
          GGetBooksData_books__asTextbook_author__asGroup_members__baseBuilder
              b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<
          GGetBooksData_books__asTextbook_author__asGroup_members__base>
      get serializer =>
          _$gGetBooksDataBooksAsTextbookAuthorAsGroupMembersBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asTextbook_author__asGroup_members__base
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asTextbook_author__asGroup_members__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetBooksData_books__asTextbook_author__asGroup_members__base
                .serializer,
            json,
          );
}

abstract class GGetBooksData_books__asTextbook_author__asGroup_members__asPerson
    implements
        Built<GGetBooksData_books__asTextbook_author__asGroup_members__asPerson,
            GGetBooksData_books__asTextbook_author__asGroup_members__asPersonBuilder>,
        GBookFragment_author__asGroup_members,
        GBookFragment__asTextbook_author__asGroup_members,
        GGetBooksData_books_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asPerson,
        GBookFragment__asTextbook_author__asGroup_members__asPerson,
        GGetBooksData_books_author__asGroup_members__asPerson,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GGetBooksData_books__asTextbook_author__asGroup_members,
        GAuthorPersonFragment {
  GGetBooksData_books__asTextbook_author__asGroup_members__asPerson._();

  factory GGetBooksData_books__asTextbook_author__asGroup_members__asPerson(
          [void Function(
                  GGetBooksData_books__asTextbook_author__asGroup_members__asPersonBuilder
                      b)
              updates]) =
      _$GGetBooksData_books__asTextbook_author__asGroup_members__asPerson;

  static void _initializeBuilder(
          GGetBooksData_books__asTextbook_author__asGroup_members__asPersonBuilder
              b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<
          GGetBooksData_books__asTextbook_author__asGroup_members__asPerson>
      get serializer =>
          _$gGetBooksDataBooksAsTextbookAuthorAsGroupMembersAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asTextbook_author__asGroup_members__asPerson
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asTextbook_author__asGroup_members__asPerson?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetBooksData_books__asTextbook_author__asGroup_members__asPerson
                .serializer,
            json,
          );
}

abstract class GGetBooksData_books__asTextbook_author__asGroup_members__asCompany
    implements
        Built<
            GGetBooksData_books__asTextbook_author__asGroup_members__asCompany,
            GGetBooksData_books__asTextbook_author__asGroup_members__asCompanyBuilder>,
        GBookFragment_author__asGroup_members,
        GBookFragment__asTextbook_author__asGroup_members,
        GGetBooksData_books_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asCompany,
        GBookFragment__asTextbook_author__asGroup_members__asCompany,
        GGetBooksData_books_author__asGroup_members__asCompany,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GGetBooksData_books__asTextbook_author__asGroup_members,
        GAuthorCompanyFragment {
  GGetBooksData_books__asTextbook_author__asGroup_members__asCompany._();

  factory GGetBooksData_books__asTextbook_author__asGroup_members__asCompany(
          [void Function(
                  GGetBooksData_books__asTextbook_author__asGroup_members__asCompanyBuilder
                      b)
              updates]) =
      _$GGetBooksData_books__asTextbook_author__asGroup_members__asCompany;

  static void _initializeBuilder(
          GGetBooksData_books__asTextbook_author__asGroup_members__asCompanyBuilder
              b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<
          GGetBooksData_books__asTextbook_author__asGroup_members__asCompany>
      get serializer =>
          _$gGetBooksDataBooksAsTextbookAuthorAsGroupMembersAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asTextbook_author__asGroup_members__asCompany
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asTextbook_author__asGroup_members__asCompany?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetBooksData_books__asTextbook_author__asGroup_members__asCompany
                .serializer,
            json,
          );
}

abstract class GGetBooksData_books__asColoringBook
    implements
        Built<GGetBooksData_books__asColoringBook,
            GGetBooksData_books__asColoringBookBuilder>,
        GBookFragment,
        GBookFragment__asColoringBook,
        GGetBooksData_books {
  GGetBooksData_books__asColoringBook._();

  factory GGetBooksData_books__asColoringBook(
      [void Function(GGetBooksData_books__asColoringBookBuilder b)
          updates]) = _$GGetBooksData_books__asColoringBook;

  static void _initializeBuilder(
          GGetBooksData_books__asColoringBookBuilder b) =>
      b..G__typename = 'ColoringBook';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GGetBooksData_books__asColoringBook_author get author;
  @override
  String get title;
  @override
  BuiltList<String> get colors;
  static Serializer<GGetBooksData_books__asColoringBook> get serializer =>
      _$gGetBooksDataBooksAsColoringBookSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asColoringBook.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asColoringBook? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asColoringBook.serializer,
        json,
      );
}

abstract class GGetBooksData_books__asColoringBook_author
    implements
        GBookFragment_author,
        GBookFragment__asColoringBook_author,
        GGetBooksData_books_author,
        GAuthorFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GGetBooksData_books__asColoringBook_author>
      get serializer => _i2.InlineFragmentSerializer<
              GGetBooksData_books__asColoringBook_author>(
            'GGetBooksData_books__asColoringBook_author',
            GGetBooksData_books__asColoringBook_author__base,
            {
              'Person': GGetBooksData_books__asColoringBook_author__asPerson,
              'Company': GGetBooksData_books__asColoringBook_author__asCompany,
              'Group': GGetBooksData_books__asColoringBook_author__asGroup,
            },
          );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asColoringBook_author.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asColoringBook_author? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asColoringBook_author.serializer,
        json,
      );
}

extension GGetBooksData_books__asColoringBook_authorWhenExtension
    on GGetBooksData_books__asColoringBook_author {
  _T when<_T>({
    required _T Function(GGetBooksData_books__asColoringBook_author__asPerson)
        person,
    required _T Function(GGetBooksData_books__asColoringBook_author__asCompany)
        company,
    required _T Function(GGetBooksData_books__asColoringBook_author__asGroup)
        group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(
            (this as GGetBooksData_books__asColoringBook_author__asPerson));
      case 'Company':
        return company(
            (this as GGetBooksData_books__asColoringBook_author__asCompany));
      case 'Group':
        return group(
            (this as GGetBooksData_books__asColoringBook_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetBooksData_books__asColoringBook_author__asPerson)? person,
    _T Function(GGetBooksData_books__asColoringBook_author__asCompany)? company,
    _T Function(GGetBooksData_books__asColoringBook_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person(
                (this as GGetBooksData_books__asColoringBook_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company(
                (this as GGetBooksData_books__asColoringBook_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group(
                (this as GGetBooksData_books__asColoringBook_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GGetBooksData_books__asColoringBook_author__base
    implements
        Built<GGetBooksData_books__asColoringBook_author__base,
            GGetBooksData_books__asColoringBook_author__baseBuilder>,
        GGetBooksData_books__asColoringBook_author,
        GAuthorFragment {
  GGetBooksData_books__asColoringBook_author__base._();

  factory GGetBooksData_books__asColoringBook_author__base(
      [void Function(GGetBooksData_books__asColoringBook_author__baseBuilder b)
          updates]) = _$GGetBooksData_books__asColoringBook_author__base;

  static void _initializeBuilder(
          GGetBooksData_books__asColoringBook_author__baseBuilder b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GGetBooksData_books__asColoringBook_author__base>
      get serializer => _$gGetBooksDataBooksAsColoringBookAuthorBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asColoringBook_author__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asColoringBook_author__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asColoringBook_author__base.serializer,
        json,
      );
}

abstract class GGetBooksData_books__asColoringBook_author__asPerson
    implements
        Built<GGetBooksData_books__asColoringBook_author__asPerson,
            GGetBooksData_books__asColoringBook_author__asPersonBuilder>,
        GBookFragment_author,
        GBookFragment__asColoringBook_author,
        GGetBooksData_books_author,
        GAuthorFragment,
        GBookFragment_author__asPerson,
        GBookFragment__asColoringBook_author__asPerson,
        GGetBooksData_books_author__asPerson,
        GAuthorFragment__asPerson,
        GGetBooksData_books__asColoringBook_author,
        GAuthorPersonFragment {
  GGetBooksData_books__asColoringBook_author__asPerson._();

  factory GGetBooksData_books__asColoringBook_author__asPerson(
      [void Function(
              GGetBooksData_books__asColoringBook_author__asPersonBuilder b)
          updates]) = _$GGetBooksData_books__asColoringBook_author__asPerson;

  static void _initializeBuilder(
          GGetBooksData_books__asColoringBook_author__asPersonBuilder b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GGetBooksData_books__asColoringBook_author__asPerson>
      get serializer =>
          _$gGetBooksDataBooksAsColoringBookAuthorAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asColoringBook_author__asPerson.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asColoringBook_author__asPerson? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asColoringBook_author__asPerson.serializer,
        json,
      );
}

abstract class GGetBooksData_books__asColoringBook_author__asCompany
    implements
        Built<GGetBooksData_books__asColoringBook_author__asCompany,
            GGetBooksData_books__asColoringBook_author__asCompanyBuilder>,
        GBookFragment_author,
        GBookFragment__asColoringBook_author,
        GGetBooksData_books_author,
        GAuthorFragment,
        GBookFragment_author__asCompany,
        GBookFragment__asColoringBook_author__asCompany,
        GGetBooksData_books_author__asCompany,
        GAuthorFragment__asCompany,
        GGetBooksData_books__asColoringBook_author,
        GAuthorCompanyFragment {
  GGetBooksData_books__asColoringBook_author__asCompany._();

  factory GGetBooksData_books__asColoringBook_author__asCompany(
      [void Function(
              GGetBooksData_books__asColoringBook_author__asCompanyBuilder b)
          updates]) = _$GGetBooksData_books__asColoringBook_author__asCompany;

  static void _initializeBuilder(
          GGetBooksData_books__asColoringBook_author__asCompanyBuilder b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<GGetBooksData_books__asColoringBook_author__asCompany>
      get serializer =>
          _$gGetBooksDataBooksAsColoringBookAuthorAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asColoringBook_author__asCompany.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asColoringBook_author__asCompany? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asColoringBook_author__asCompany.serializer,
        json,
      );
}

abstract class GGetBooksData_books__asColoringBook_author__asGroup
    implements
        Built<GGetBooksData_books__asColoringBook_author__asGroup,
            GGetBooksData_books__asColoringBook_author__asGroupBuilder>,
        GBookFragment_author,
        GBookFragment__asColoringBook_author,
        GGetBooksData_books_author,
        GAuthorFragment,
        GBookFragment_author__asGroup,
        GBookFragment__asColoringBook_author__asGroup,
        GGetBooksData_books_author__asGroup,
        GAuthorFragment__asGroup,
        GGetBooksData_books__asColoringBook_author {
  GGetBooksData_books__asColoringBook_author__asGroup._();

  factory GGetBooksData_books__asColoringBook_author__asGroup(
      [void Function(
              GGetBooksData_books__asColoringBook_author__asGroupBuilder b)
          updates]) = _$GGetBooksData_books__asColoringBook_author__asGroup;

  static void _initializeBuilder(
          GGetBooksData_books__asColoringBook_author__asGroupBuilder b) =>
      b..G__typename = 'Group';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GGetBooksData_books__asColoringBook_author__asGroup_members>
      get members;
  static Serializer<GGetBooksData_books__asColoringBook_author__asGroup>
      get serializer =>
          _$gGetBooksDataBooksAsColoringBookAuthorAsGroupSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asColoringBook_author__asGroup.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asColoringBook_author__asGroup? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asColoringBook_author__asGroup.serializer,
        json,
      );
}

abstract class GGetBooksData_books__asColoringBook_author__asGroup_members
    implements
        GBookFragment_author__asGroup_members,
        GBookFragment__asColoringBook_author__asGroup_members,
        GGetBooksData_books_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GGetBooksData_books__asColoringBook_author__asGroup_members>
      get serializer => _i2.InlineFragmentSerializer<
              GGetBooksData_books__asColoringBook_author__asGroup_members>(
            'GGetBooksData_books__asColoringBook_author__asGroup_members',
            GGetBooksData_books__asColoringBook_author__asGroup_members__base,
            {
              'Person':
                  GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson,
              'Company':
                  GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany,
            },
          );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asColoringBook_author__asGroup_members.serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asColoringBook_author__asGroup_members? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GGetBooksData_books__asColoringBook_author__asGroup_members.serializer,
        json,
      );
}

extension GGetBooksData_books__asColoringBook_author__asGroup_membersWhenExtension
    on GGetBooksData_books__asColoringBook_author__asGroup_members {
  _T when<_T>({
    required _T Function(
            GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson)
        person,
    required _T Function(
            GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this
            as GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson));
      case 'Company':
        return company((this
            as GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson)?
        person,
    _T Function(
            GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany)?
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this
                as GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this
                as GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GGetBooksData_books__asColoringBook_author__asGroup_members__base
    implements
        Built<GGetBooksData_books__asColoringBook_author__asGroup_members__base,
            GGetBooksData_books__asColoringBook_author__asGroup_members__baseBuilder>,
        GGetBooksData_books__asColoringBook_author__asGroup_members,
        GAuthorGroupFragment {
  GGetBooksData_books__asColoringBook_author__asGroup_members__base._();

  factory GGetBooksData_books__asColoringBook_author__asGroup_members__base(
          [void Function(
                  GGetBooksData_books__asColoringBook_author__asGroup_members__baseBuilder
                      b)
              updates]) =
      _$GGetBooksData_books__asColoringBook_author__asGroup_members__base;

  static void _initializeBuilder(
          GGetBooksData_books__asColoringBook_author__asGroup_members__baseBuilder
              b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<
          GGetBooksData_books__asColoringBook_author__asGroup_members__base>
      get serializer =>
          _$gGetBooksDataBooksAsColoringBookAuthorAsGroupMembersBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asColoringBook_author__asGroup_members__base
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asColoringBook_author__asGroup_members__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetBooksData_books__asColoringBook_author__asGroup_members__base
                .serializer,
            json,
          );
}

abstract class GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson
    implements
        Built<
            GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson,
            GGetBooksData_books__asColoringBook_author__asGroup_members__asPersonBuilder>,
        GBookFragment_author__asGroup_members,
        GBookFragment__asColoringBook_author__asGroup_members,
        GGetBooksData_books_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asPerson,
        GBookFragment__asColoringBook_author__asGroup_members__asPerson,
        GGetBooksData_books_author__asGroup_members__asPerson,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GGetBooksData_books__asColoringBook_author__asGroup_members,
        GAuthorPersonFragment {
  GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson._();

  factory GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson(
          [void Function(
                  GGetBooksData_books__asColoringBook_author__asGroup_members__asPersonBuilder
                      b)
              updates]) =
      _$GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson;

  static void _initializeBuilder(
          GGetBooksData_books__asColoringBook_author__asGroup_members__asPersonBuilder
              b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<
          GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson>
      get serializer =>
          _$gGetBooksDataBooksAsColoringBookAuthorAsGroupMembersAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetBooksData_books__asColoringBook_author__asGroup_members__asPerson
                .serializer,
            json,
          );
}

abstract class GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany
    implements
        Built<
            GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany,
            GGetBooksData_books__asColoringBook_author__asGroup_members__asCompanyBuilder>,
        GBookFragment_author__asGroup_members,
        GBookFragment__asColoringBook_author__asGroup_members,
        GGetBooksData_books_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asCompany,
        GBookFragment__asColoringBook_author__asGroup_members__asCompany,
        GGetBooksData_books_author__asGroup_members__asCompany,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GGetBooksData_books__asColoringBook_author__asGroup_members,
        GAuthorCompanyFragment {
  GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany._();

  factory GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany(
          [void Function(
                  GGetBooksData_books__asColoringBook_author__asGroup_members__asCompanyBuilder
                      b)
              updates]) =
      _$GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany;

  static void _initializeBuilder(
          GGetBooksData_books__asColoringBook_author__asGroup_members__asCompanyBuilder
              b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<
          GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany>
      get serializer =>
          _$gGetBooksDataBooksAsColoringBookAuthorAsGroupMembersAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GGetBooksData_books__asColoringBook_author__asGroup_members__asCompany
                .serializer,
            json,
          );
}

abstract class GGetBooksData_books_author
    implements GBookFragment_author, GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GGetBooksData_books_authorWhenExtension
    on GGetBooksData_books_author {
  _T when<_T>({
    required _T Function(GGetBooksData_books_author__asPerson) person,
    required _T Function(GGetBooksData_books_author__asCompany) company,
    required _T Function(GGetBooksData_books_author__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GGetBooksData_books_author__asPerson));
      case 'Company':
        return company((this as GGetBooksData_books_author__asCompany));
      case 'Group':
        return group((this as GGetBooksData_books_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetBooksData_books_author__asPerson)? person,
    _T Function(GGetBooksData_books_author__asCompany)? company,
    _T Function(GGetBooksData_books_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GGetBooksData_books_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GGetBooksData_books_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GGetBooksData_books_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GGetBooksData_books_author__base
    implements GGetBooksData_books_author, GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GGetBooksData_books_author__asPerson
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asPerson,
        GAuthorFragment__asPerson,
        GGetBooksData_books_author,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GGetBooksData_books_author__asCompany
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asCompany,
        GAuthorFragment__asCompany,
        GGetBooksData_books_author,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GGetBooksData_books_author__asGroup
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asGroup,
        GAuthorFragment__asGroup,
        GGetBooksData_books_author {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GGetBooksData_books_author__asGroup_members> get members;
}

abstract class GGetBooksData_books_author__asGroup_members
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GGetBooksData_books_author__asGroup_membersWhenExtension
    on GGetBooksData_books_author__asGroup_members {
  _T when<_T>({
    required _T Function(GGetBooksData_books_author__asGroup_members__asPerson)
        person,
    required _T Function(GGetBooksData_books_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(
            (this as GGetBooksData_books_author__asGroup_members__asPerson));
      case 'Company':
        return company(
            (this as GGetBooksData_books_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetBooksData_books_author__asGroup_members__asPerson)? person,
    _T Function(GGetBooksData_books_author__asGroup_members__asCompany)?
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person(
                (this as GGetBooksData_books_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this
                as GGetBooksData_books_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GGetBooksData_books_author__asGroup_members__base
    implements
        GGetBooksData_books_author__asGroup_members,
        GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GGetBooksData_books_author__asGroup_members__asPerson
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asPerson,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GGetBooksData_books_author__asGroup_members,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GGetBooksData_books_author__asGroup_members__asCompany
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asCompany,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GGetBooksData_books_author__asGroup_members,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GBookFragment {
  String get G__typename;
  GBookFragment_author get author;
  String get title;
}

extension GBookFragmentWhenExtension on GBookFragment {
  _T when<_T>({
    required _T Function(GBookFragment__asTextbook) textbook,
    required _T Function(GBookFragment__asColoringBook) coloringBook,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Textbook':
        return textbook((this as GBookFragment__asTextbook));
      case 'ColoringBook':
        return coloringBook((this as GBookFragment__asColoringBook));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment__asTextbook)? textbook,
    _T Function(GBookFragment__asColoringBook)? coloringBook,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Textbook':
        return textbook != null
            ? textbook((this as GBookFragment__asTextbook))
            : orElse();
      case 'ColoringBook':
        return coloringBook != null
            ? coloringBook((this as GBookFragment__asColoringBook))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragment__base implements GBookFragment {
  @override
  String get G__typename;
  @override
  GBookFragment__base_author get author;
  @override
  String get title;
}

abstract class GBookFragment__base_author
    implements GBookFragment_author, GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GBookFragment__base_authorWhenExtension
    on GBookFragment__base_author {
  _T when<_T>({
    required _T Function(GBookFragment__base_author__asPerson) person,
    required _T Function(GBookFragment__base_author__asCompany) company,
    required _T Function(GBookFragment__base_author__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragment__base_author__asPerson));
      case 'Company':
        return company((this as GBookFragment__base_author__asCompany));
      case 'Group':
        return group((this as GBookFragment__base_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment__base_author__asPerson)? person,
    _T Function(GBookFragment__base_author__asCompany)? company,
    _T Function(GBookFragment__base_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GBookFragment__base_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GBookFragment__base_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GBookFragment__base_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragment__base_author__base
    implements GBookFragment__base_author, GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GBookFragment__base_author__asPerson
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asPerson,
        GAuthorFragment__asPerson,
        GBookFragment__base_author,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GBookFragment__base_author__asCompany
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asCompany,
        GAuthorFragment__asCompany,
        GBookFragment__base_author,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GBookFragment__base_author__asGroup
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asGroup,
        GAuthorFragment__asGroup,
        GBookFragment__base_author {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GBookFragment__base_author__asGroup_members> get members;
}

abstract class GBookFragment__base_author__asGroup_members
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GBookFragment__base_author__asGroup_membersWhenExtension
    on GBookFragment__base_author__asGroup_members {
  _T when<_T>({
    required _T Function(GBookFragment__base_author__asGroup_members__asPerson)
        person,
    required _T Function(GBookFragment__base_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(
            (this as GBookFragment__base_author__asGroup_members__asPerson));
      case 'Company':
        return company(
            (this as GBookFragment__base_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment__base_author__asGroup_members__asPerson)? person,
    _T Function(GBookFragment__base_author__asGroup_members__asCompany)?
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person(
                (this as GBookFragment__base_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this
                as GBookFragment__base_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragment__base_author__asGroup_members__base
    implements
        GBookFragment__base_author__asGroup_members,
        GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GBookFragment__base_author__asGroup_members__asPerson
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asPerson,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GBookFragment__base_author__asGroup_members,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GBookFragment__base_author__asGroup_members__asCompany
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asCompany,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GBookFragment__base_author__asGroup_members,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GBookFragment__asTextbook implements GBookFragment {
  @override
  String get G__typename;
  @override
  GBookFragment__asTextbook_author get author;
  @override
  String get title;
  BuiltList<String> get courses;
}

abstract class GBookFragment__asTextbook_author
    implements GBookFragment_author, GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GBookFragment__asTextbook_authorWhenExtension
    on GBookFragment__asTextbook_author {
  _T when<_T>({
    required _T Function(GBookFragment__asTextbook_author__asPerson) person,
    required _T Function(GBookFragment__asTextbook_author__asCompany) company,
    required _T Function(GBookFragment__asTextbook_author__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragment__asTextbook_author__asPerson));
      case 'Company':
        return company((this as GBookFragment__asTextbook_author__asCompany));
      case 'Group':
        return group((this as GBookFragment__asTextbook_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment__asTextbook_author__asPerson)? person,
    _T Function(GBookFragment__asTextbook_author__asCompany)? company,
    _T Function(GBookFragment__asTextbook_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GBookFragment__asTextbook_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GBookFragment__asTextbook_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GBookFragment__asTextbook_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragment__asTextbook_author__base
    implements GBookFragment__asTextbook_author, GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GBookFragment__asTextbook_author__asPerson
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asPerson,
        GAuthorFragment__asPerson,
        GBookFragment__asTextbook_author,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GBookFragment__asTextbook_author__asCompany
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asCompany,
        GAuthorFragment__asCompany,
        GBookFragment__asTextbook_author,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GBookFragment__asTextbook_author__asGroup
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asGroup,
        GAuthorFragment__asGroup,
        GBookFragment__asTextbook_author {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GBookFragment__asTextbook_author__asGroup_members> get members;
}

abstract class GBookFragment__asTextbook_author__asGroup_members
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GBookFragment__asTextbook_author__asGroup_membersWhenExtension
    on GBookFragment__asTextbook_author__asGroup_members {
  _T when<_T>({
    required _T Function(
            GBookFragment__asTextbook_author__asGroup_members__asPerson)
        person,
    required _T Function(
            GBookFragment__asTextbook_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this
            as GBookFragment__asTextbook_author__asGroup_members__asPerson));
      case 'Company':
        return company((this
            as GBookFragment__asTextbook_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment__asTextbook_author__asGroup_members__asPerson)?
        person,
    _T Function(GBookFragment__asTextbook_author__asGroup_members__asCompany)?
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this
                as GBookFragment__asTextbook_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this
                as GBookFragment__asTextbook_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragment__asTextbook_author__asGroup_members__base
    implements
        GBookFragment__asTextbook_author__asGroup_members,
        GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GBookFragment__asTextbook_author__asGroup_members__asPerson
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asPerson,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GBookFragment__asTextbook_author__asGroup_members,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GBookFragment__asTextbook_author__asGroup_members__asCompany
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asCompany,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GBookFragment__asTextbook_author__asGroup_members,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GBookFragment__asColoringBook implements GBookFragment {
  @override
  String get G__typename;
  @override
  GBookFragment__asColoringBook_author get author;
  @override
  String get title;
  BuiltList<String> get colors;
}

abstract class GBookFragment__asColoringBook_author
    implements GBookFragment_author, GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GBookFragment__asColoringBook_authorWhenExtension
    on GBookFragment__asColoringBook_author {
  _T when<_T>({
    required _T Function(GBookFragment__asColoringBook_author__asPerson) person,
    required _T Function(GBookFragment__asColoringBook_author__asCompany)
        company,
    required _T Function(GBookFragment__asColoringBook_author__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragment__asColoringBook_author__asPerson));
      case 'Company':
        return company(
            (this as GBookFragment__asColoringBook_author__asCompany));
      case 'Group':
        return group((this as GBookFragment__asColoringBook_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment__asColoringBook_author__asPerson)? person,
    _T Function(GBookFragment__asColoringBook_author__asCompany)? company,
    _T Function(GBookFragment__asColoringBook_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GBookFragment__asColoringBook_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GBookFragment__asColoringBook_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GBookFragment__asColoringBook_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragment__asColoringBook_author__base
    implements GBookFragment__asColoringBook_author, GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GBookFragment__asColoringBook_author__asPerson
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asPerson,
        GAuthorFragment__asPerson,
        GBookFragment__asColoringBook_author,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GBookFragment__asColoringBook_author__asCompany
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asCompany,
        GAuthorFragment__asCompany,
        GBookFragment__asColoringBook_author,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GBookFragment__asColoringBook_author__asGroup
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asGroup,
        GAuthorFragment__asGroup,
        GBookFragment__asColoringBook_author {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GBookFragment__asColoringBook_author__asGroup_members> get members;
}

abstract class GBookFragment__asColoringBook_author__asGroup_members
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GBookFragment__asColoringBook_author__asGroup_membersWhenExtension
    on GBookFragment__asColoringBook_author__asGroup_members {
  _T when<_T>({
    required _T Function(
            GBookFragment__asColoringBook_author__asGroup_members__asPerson)
        person,
    required _T Function(
            GBookFragment__asColoringBook_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this
            as GBookFragment__asColoringBook_author__asGroup_members__asPerson));
      case 'Company':
        return company((this
            as GBookFragment__asColoringBook_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            GBookFragment__asColoringBook_author__asGroup_members__asPerson)?
        person,
    _T Function(
            GBookFragment__asColoringBook_author__asGroup_members__asCompany)?
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this
                as GBookFragment__asColoringBook_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this
                as GBookFragment__asColoringBook_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragment__asColoringBook_author__asGroup_members__base
    implements
        GBookFragment__asColoringBook_author__asGroup_members,
        GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GBookFragment__asColoringBook_author__asGroup_members__asPerson
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asPerson,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GBookFragment__asColoringBook_author__asGroup_members,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GBookFragment__asColoringBook_author__asGroup_members__asCompany
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asCompany,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GBookFragment__asColoringBook_author__asGroup_members,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GBookFragment_author implements GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GBookFragment_authorWhenExtension on GBookFragment_author {
  _T when<_T>({
    required _T Function(GBookFragment_author__asPerson) person,
    required _T Function(GBookFragment_author__asCompany) company,
    required _T Function(GBookFragment_author__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragment_author__asPerson));
      case 'Company':
        return company((this as GBookFragment_author__asCompany));
      case 'Group':
        return group((this as GBookFragment_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment_author__asPerson)? person,
    _T Function(GBookFragment_author__asCompany)? company,
    _T Function(GBookFragment_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GBookFragment_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GBookFragment_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GBookFragment_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragment_author__base
    implements GBookFragment_author, GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GBookFragment_author__asPerson
    implements
        GAuthorFragment,
        GAuthorFragment__asPerson,
        GBookFragment_author,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GBookFragment_author__asCompany
    implements
        GAuthorFragment,
        GAuthorFragment__asCompany,
        GBookFragment_author,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GBookFragment_author__asGroup
    implements GAuthorFragment, GAuthorFragment__asGroup, GBookFragment_author {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GBookFragment_author__asGroup_members> get members;
}

abstract class GBookFragment_author__asGroup_members
    implements GAuthorFragment__asGroup_members, GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GBookFragment_author__asGroup_membersWhenExtension
    on GBookFragment_author__asGroup_members {
  _T when<_T>({
    required _T Function(GBookFragment_author__asGroup_members__asPerson)
        person,
    required _T Function(GBookFragment_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(
            (this as GBookFragment_author__asGroup_members__asPerson));
      case 'Company':
        return company(
            (this as GBookFragment_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment_author__asGroup_members__asPerson)? person,
    _T Function(GBookFragment_author__asGroup_members__asCompany)? company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GBookFragment_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company(
                (this as GBookFragment_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragment_author__asGroup_members__base
    implements GBookFragment_author__asGroup_members, GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GBookFragment_author__asGroup_members__asPerson
    implements
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GBookFragment_author__asGroup_members,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GBookFragment_author__asGroup_members__asCompany
    implements
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GBookFragment_author__asGroup_members,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GBookFragmentData implements GBookFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GBookFragmentData_author get author;
  @override
  String get title;
  static Serializer<GBookFragmentData> get serializer =>
      _i2.InlineFragmentSerializer<GBookFragmentData>(
        'GBookFragmentData',
        GBookFragmentData__base,
        {
          'Textbook': GBookFragmentData__asTextbook,
          'ColoringBook': GBookFragmentData__asColoringBook,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData.serializer,
        json,
      );
}

extension GBookFragmentDataWhenExtension on GBookFragmentData {
  _T when<_T>({
    required _T Function(GBookFragmentData__asTextbook) textbook,
    required _T Function(GBookFragmentData__asColoringBook) coloringBook,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Textbook':
        return textbook((this as GBookFragmentData__asTextbook));
      case 'ColoringBook':
        return coloringBook((this as GBookFragmentData__asColoringBook));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData__asTextbook)? textbook,
    _T Function(GBookFragmentData__asColoringBook)? coloringBook,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Textbook':
        return textbook != null
            ? textbook((this as GBookFragmentData__asTextbook))
            : orElse();
      case 'ColoringBook':
        return coloringBook != null
            ? coloringBook((this as GBookFragmentData__asColoringBook))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragmentData__base
    implements
        Built<GBookFragmentData__base, GBookFragmentData__baseBuilder>,
        GBookFragmentData {
  GBookFragmentData__base._();

  factory GBookFragmentData__base(
          [void Function(GBookFragmentData__baseBuilder b) updates]) =
      _$GBookFragmentData__base;

  static void _initializeBuilder(GBookFragmentData__baseBuilder b) =>
      b..G__typename = 'Book';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GBookFragmentData__base_author get author;
  @override
  String get title;
  static Serializer<GBookFragmentData__base> get serializer =>
      _$gBookFragmentDataBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__base? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__base.serializer,
        json,
      );
}

abstract class GBookFragmentData__base_author
    implements GBookFragmentData_author, GAuthorFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GBookFragmentData__base_author> get serializer =>
      _i2.InlineFragmentSerializer<GBookFragmentData__base_author>(
        'GBookFragmentData__base_author',
        GBookFragmentData__base_author__base,
        {
          'Person': GBookFragmentData__base_author__asPerson,
          'Company': GBookFragmentData__base_author__asCompany,
          'Group': GBookFragmentData__base_author__asGroup,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__base_author.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__base_author? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__base_author.serializer,
        json,
      );
}

extension GBookFragmentData__base_authorWhenExtension
    on GBookFragmentData__base_author {
  _T when<_T>({
    required _T Function(GBookFragmentData__base_author__asPerson) person,
    required _T Function(GBookFragmentData__base_author__asCompany) company,
    required _T Function(GBookFragmentData__base_author__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragmentData__base_author__asPerson));
      case 'Company':
        return company((this as GBookFragmentData__base_author__asCompany));
      case 'Group':
        return group((this as GBookFragmentData__base_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData__base_author__asPerson)? person,
    _T Function(GBookFragmentData__base_author__asCompany)? company,
    _T Function(GBookFragmentData__base_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GBookFragmentData__base_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GBookFragmentData__base_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GBookFragmentData__base_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragmentData__base_author__base
    implements
        Built<GBookFragmentData__base_author__base,
            GBookFragmentData__base_author__baseBuilder>,
        GBookFragmentData__base_author,
        GAuthorFragment {
  GBookFragmentData__base_author__base._();

  factory GBookFragmentData__base_author__base(
      [void Function(GBookFragmentData__base_author__baseBuilder b)
          updates]) = _$GBookFragmentData__base_author__base;

  static void _initializeBuilder(
          GBookFragmentData__base_author__baseBuilder b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GBookFragmentData__base_author__base> get serializer =>
      _$gBookFragmentDataBaseAuthorBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__base_author__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__base_author__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__base_author__base.serializer,
        json,
      );
}

abstract class GBookFragmentData__base_author__asPerson
    implements
        Built<GBookFragmentData__base_author__asPerson,
            GBookFragmentData__base_author__asPersonBuilder>,
        GBookFragmentData_author,
        GAuthorFragment,
        GBookFragmentData_author__asPerson,
        GAuthorFragment__asPerson,
        GBookFragmentData__base_author,
        GAuthorPersonFragment {
  GBookFragmentData__base_author__asPerson._();

  factory GBookFragmentData__base_author__asPerson(
      [void Function(GBookFragmentData__base_author__asPersonBuilder b)
          updates]) = _$GBookFragmentData__base_author__asPerson;

  static void _initializeBuilder(
          GBookFragmentData__base_author__asPersonBuilder b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GBookFragmentData__base_author__asPerson> get serializer =>
      _$gBookFragmentDataBaseAuthorAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__base_author__asPerson.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__base_author__asPerson? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__base_author__asPerson.serializer,
        json,
      );
}

abstract class GBookFragmentData__base_author__asCompany
    implements
        Built<GBookFragmentData__base_author__asCompany,
            GBookFragmentData__base_author__asCompanyBuilder>,
        GBookFragmentData_author,
        GAuthorFragment,
        GBookFragmentData_author__asCompany,
        GAuthorFragment__asCompany,
        GBookFragmentData__base_author,
        GAuthorCompanyFragment {
  GBookFragmentData__base_author__asCompany._();

  factory GBookFragmentData__base_author__asCompany(
      [void Function(GBookFragmentData__base_author__asCompanyBuilder b)
          updates]) = _$GBookFragmentData__base_author__asCompany;

  static void _initializeBuilder(
          GBookFragmentData__base_author__asCompanyBuilder b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<GBookFragmentData__base_author__asCompany> get serializer =>
      _$gBookFragmentDataBaseAuthorAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__base_author__asCompany.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__base_author__asCompany? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__base_author__asCompany.serializer,
        json,
      );
}

abstract class GBookFragmentData__base_author__asGroup
    implements
        Built<GBookFragmentData__base_author__asGroup,
            GBookFragmentData__base_author__asGroupBuilder>,
        GBookFragmentData_author,
        GAuthorFragment,
        GBookFragmentData_author__asGroup,
        GAuthorFragment__asGroup,
        GBookFragmentData__base_author {
  GBookFragmentData__base_author__asGroup._();

  factory GBookFragmentData__base_author__asGroup(
      [void Function(GBookFragmentData__base_author__asGroupBuilder b)
          updates]) = _$GBookFragmentData__base_author__asGroup;

  static void _initializeBuilder(
          GBookFragmentData__base_author__asGroupBuilder b) =>
      b..G__typename = 'Group';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GBookFragmentData__base_author__asGroup_members> get members;
  static Serializer<GBookFragmentData__base_author__asGroup> get serializer =>
      _$gBookFragmentDataBaseAuthorAsGroupSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__base_author__asGroup.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__base_author__asGroup? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__base_author__asGroup.serializer,
        json,
      );
}

abstract class GBookFragmentData__base_author__asGroup_members
    implements
        GBookFragmentData_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GBookFragmentData__base_author__asGroup_members>
      get serializer => _i2.InlineFragmentSerializer<
              GBookFragmentData__base_author__asGroup_members>(
            'GBookFragmentData__base_author__asGroup_members',
            GBookFragmentData__base_author__asGroup_members__base,
            {
              'Person':
                  GBookFragmentData__base_author__asGroup_members__asPerson,
              'Company':
                  GBookFragmentData__base_author__asGroup_members__asCompany,
            },
          );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__base_author__asGroup_members.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__base_author__asGroup_members? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__base_author__asGroup_members.serializer,
        json,
      );
}

extension GBookFragmentData__base_author__asGroup_membersWhenExtension
    on GBookFragmentData__base_author__asGroup_members {
  _T when<_T>({
    required _T Function(
            GBookFragmentData__base_author__asGroup_members__asPerson)
        person,
    required _T Function(
            GBookFragmentData__base_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this
            as GBookFragmentData__base_author__asGroup_members__asPerson));
      case 'Company':
        return company((this
            as GBookFragmentData__base_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData__base_author__asGroup_members__asPerson)?
        person,
    _T Function(GBookFragmentData__base_author__asGroup_members__asCompany)?
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this
                as GBookFragmentData__base_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this
                as GBookFragmentData__base_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragmentData__base_author__asGroup_members__base
    implements
        Built<GBookFragmentData__base_author__asGroup_members__base,
            GBookFragmentData__base_author__asGroup_members__baseBuilder>,
        GBookFragmentData__base_author__asGroup_members,
        GAuthorGroupFragment {
  GBookFragmentData__base_author__asGroup_members__base._();

  factory GBookFragmentData__base_author__asGroup_members__base(
      [void Function(
              GBookFragmentData__base_author__asGroup_members__baseBuilder b)
          updates]) = _$GBookFragmentData__base_author__asGroup_members__base;

  static void _initializeBuilder(
          GBookFragmentData__base_author__asGroup_members__baseBuilder b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GBookFragmentData__base_author__asGroup_members__base>
      get serializer =>
          _$gBookFragmentDataBaseAuthorAsGroupMembersBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__base_author__asGroup_members__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__base_author__asGroup_members__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__base_author__asGroup_members__base.serializer,
        json,
      );
}

abstract class GBookFragmentData__base_author__asGroup_members__asPerson
    implements
        Built<GBookFragmentData__base_author__asGroup_members__asPerson,
            GBookFragmentData__base_author__asGroup_members__asPersonBuilder>,
        GBookFragmentData_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragmentData_author__asGroup_members__asPerson,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GBookFragmentData__base_author__asGroup_members,
        GAuthorPersonFragment {
  GBookFragmentData__base_author__asGroup_members__asPerson._();

  factory GBookFragmentData__base_author__asGroup_members__asPerson(
      [void Function(
              GBookFragmentData__base_author__asGroup_members__asPersonBuilder
                  b)
          updates]) = _$GBookFragmentData__base_author__asGroup_members__asPerson;

  static void _initializeBuilder(
          GBookFragmentData__base_author__asGroup_members__asPersonBuilder b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GBookFragmentData__base_author__asGroup_members__asPerson>
      get serializer =>
          _$gBookFragmentDataBaseAuthorAsGroupMembersAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__base_author__asGroup_members__asPerson.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__base_author__asGroup_members__asPerson? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__base_author__asGroup_members__asPerson.serializer,
        json,
      );
}

abstract class GBookFragmentData__base_author__asGroup_members__asCompany
    implements
        Built<GBookFragmentData__base_author__asGroup_members__asCompany,
            GBookFragmentData__base_author__asGroup_members__asCompanyBuilder>,
        GBookFragmentData_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragmentData_author__asGroup_members__asCompany,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GBookFragmentData__base_author__asGroup_members,
        GAuthorCompanyFragment {
  GBookFragmentData__base_author__asGroup_members__asCompany._();

  factory GBookFragmentData__base_author__asGroup_members__asCompany(
      [void Function(
              GBookFragmentData__base_author__asGroup_members__asCompanyBuilder
                  b)
          updates]) = _$GBookFragmentData__base_author__asGroup_members__asCompany;

  static void _initializeBuilder(
          GBookFragmentData__base_author__asGroup_members__asCompanyBuilder
              b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<GBookFragmentData__base_author__asGroup_members__asCompany>
      get serializer =>
          _$gBookFragmentDataBaseAuthorAsGroupMembersAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__base_author__asGroup_members__asCompany.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__base_author__asGroup_members__asCompany? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__base_author__asGroup_members__asCompany.serializer,
        json,
      );
}

abstract class GBookFragmentData__asTextbook
    implements
        Built<GBookFragmentData__asTextbook,
            GBookFragmentData__asTextbookBuilder>,
        GBookFragment,
        GBookFragment__asTextbook,
        GBookFragmentData {
  GBookFragmentData__asTextbook._();

  factory GBookFragmentData__asTextbook(
          [void Function(GBookFragmentData__asTextbookBuilder b) updates]) =
      _$GBookFragmentData__asTextbook;

  static void _initializeBuilder(GBookFragmentData__asTextbookBuilder b) =>
      b..G__typename = 'Textbook';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GBookFragmentData__asTextbook_author get author;
  @override
  String get title;
  @override
  BuiltList<String> get courses;
  static Serializer<GBookFragmentData__asTextbook> get serializer =>
      _$gBookFragmentDataAsTextbookSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asTextbook.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asTextbook? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asTextbook.serializer,
        json,
      );
}

abstract class GBookFragmentData__asTextbook_author
    implements
        GBookFragment_author,
        GBookFragment__asTextbook_author,
        GBookFragmentData_author,
        GAuthorFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GBookFragmentData__asTextbook_author> get serializer =>
      _i2.InlineFragmentSerializer<GBookFragmentData__asTextbook_author>(
        'GBookFragmentData__asTextbook_author',
        GBookFragmentData__asTextbook_author__base,
        {
          'Person': GBookFragmentData__asTextbook_author__asPerson,
          'Company': GBookFragmentData__asTextbook_author__asCompany,
          'Group': GBookFragmentData__asTextbook_author__asGroup,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asTextbook_author.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asTextbook_author? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asTextbook_author.serializer,
        json,
      );
}

extension GBookFragmentData__asTextbook_authorWhenExtension
    on GBookFragmentData__asTextbook_author {
  _T when<_T>({
    required _T Function(GBookFragmentData__asTextbook_author__asPerson) person,
    required _T Function(GBookFragmentData__asTextbook_author__asCompany)
        company,
    required _T Function(GBookFragmentData__asTextbook_author__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragmentData__asTextbook_author__asPerson));
      case 'Company':
        return company(
            (this as GBookFragmentData__asTextbook_author__asCompany));
      case 'Group':
        return group((this as GBookFragmentData__asTextbook_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData__asTextbook_author__asPerson)? person,
    _T Function(GBookFragmentData__asTextbook_author__asCompany)? company,
    _T Function(GBookFragmentData__asTextbook_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GBookFragmentData__asTextbook_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GBookFragmentData__asTextbook_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GBookFragmentData__asTextbook_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragmentData__asTextbook_author__base
    implements
        Built<GBookFragmentData__asTextbook_author__base,
            GBookFragmentData__asTextbook_author__baseBuilder>,
        GBookFragmentData__asTextbook_author,
        GAuthorFragment {
  GBookFragmentData__asTextbook_author__base._();

  factory GBookFragmentData__asTextbook_author__base(
      [void Function(GBookFragmentData__asTextbook_author__baseBuilder b)
          updates]) = _$GBookFragmentData__asTextbook_author__base;

  static void _initializeBuilder(
          GBookFragmentData__asTextbook_author__baseBuilder b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GBookFragmentData__asTextbook_author__base>
      get serializer => _$gBookFragmentDataAsTextbookAuthorBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asTextbook_author__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asTextbook_author__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asTextbook_author__base.serializer,
        json,
      );
}

abstract class GBookFragmentData__asTextbook_author__asPerson
    implements
        Built<GBookFragmentData__asTextbook_author__asPerson,
            GBookFragmentData__asTextbook_author__asPersonBuilder>,
        GBookFragment_author,
        GBookFragment__asTextbook_author,
        GBookFragmentData_author,
        GAuthorFragment,
        GBookFragment_author__asPerson,
        GBookFragment__asTextbook_author__asPerson,
        GBookFragmentData_author__asPerson,
        GAuthorFragment__asPerson,
        GBookFragmentData__asTextbook_author,
        GAuthorPersonFragment {
  GBookFragmentData__asTextbook_author__asPerson._();

  factory GBookFragmentData__asTextbook_author__asPerson(
      [void Function(GBookFragmentData__asTextbook_author__asPersonBuilder b)
          updates]) = _$GBookFragmentData__asTextbook_author__asPerson;

  static void _initializeBuilder(
          GBookFragmentData__asTextbook_author__asPersonBuilder b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GBookFragmentData__asTextbook_author__asPerson>
      get serializer => _$gBookFragmentDataAsTextbookAuthorAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asTextbook_author__asPerson.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asTextbook_author__asPerson? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asTextbook_author__asPerson.serializer,
        json,
      );
}

abstract class GBookFragmentData__asTextbook_author__asCompany
    implements
        Built<GBookFragmentData__asTextbook_author__asCompany,
            GBookFragmentData__asTextbook_author__asCompanyBuilder>,
        GBookFragment_author,
        GBookFragment__asTextbook_author,
        GBookFragmentData_author,
        GAuthorFragment,
        GBookFragment_author__asCompany,
        GBookFragment__asTextbook_author__asCompany,
        GBookFragmentData_author__asCompany,
        GAuthorFragment__asCompany,
        GBookFragmentData__asTextbook_author,
        GAuthorCompanyFragment {
  GBookFragmentData__asTextbook_author__asCompany._();

  factory GBookFragmentData__asTextbook_author__asCompany(
      [void Function(GBookFragmentData__asTextbook_author__asCompanyBuilder b)
          updates]) = _$GBookFragmentData__asTextbook_author__asCompany;

  static void _initializeBuilder(
          GBookFragmentData__asTextbook_author__asCompanyBuilder b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<GBookFragmentData__asTextbook_author__asCompany>
      get serializer => _$gBookFragmentDataAsTextbookAuthorAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asTextbook_author__asCompany.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asTextbook_author__asCompany? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asTextbook_author__asCompany.serializer,
        json,
      );
}

abstract class GBookFragmentData__asTextbook_author__asGroup
    implements
        Built<GBookFragmentData__asTextbook_author__asGroup,
            GBookFragmentData__asTextbook_author__asGroupBuilder>,
        GBookFragment_author,
        GBookFragment__asTextbook_author,
        GBookFragmentData_author,
        GAuthorFragment,
        GBookFragment_author__asGroup,
        GBookFragment__asTextbook_author__asGroup,
        GBookFragmentData_author__asGroup,
        GAuthorFragment__asGroup,
        GBookFragmentData__asTextbook_author {
  GBookFragmentData__asTextbook_author__asGroup._();

  factory GBookFragmentData__asTextbook_author__asGroup(
      [void Function(GBookFragmentData__asTextbook_author__asGroupBuilder b)
          updates]) = _$GBookFragmentData__asTextbook_author__asGroup;

  static void _initializeBuilder(
          GBookFragmentData__asTextbook_author__asGroupBuilder b) =>
      b..G__typename = 'Group';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GBookFragmentData__asTextbook_author__asGroup_members> get members;
  static Serializer<GBookFragmentData__asTextbook_author__asGroup>
      get serializer => _$gBookFragmentDataAsTextbookAuthorAsGroupSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asTextbook_author__asGroup.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asTextbook_author__asGroup? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asTextbook_author__asGroup.serializer,
        json,
      );
}

abstract class GBookFragmentData__asTextbook_author__asGroup_members
    implements
        GBookFragment_author__asGroup_members,
        GBookFragment__asTextbook_author__asGroup_members,
        GBookFragmentData_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GBookFragmentData__asTextbook_author__asGroup_members>
      get serializer => _i2.InlineFragmentSerializer<
              GBookFragmentData__asTextbook_author__asGroup_members>(
            'GBookFragmentData__asTextbook_author__asGroup_members',
            GBookFragmentData__asTextbook_author__asGroup_members__base,
            {
              'Person':
                  GBookFragmentData__asTextbook_author__asGroup_members__asPerson,
              'Company':
                  GBookFragmentData__asTextbook_author__asGroup_members__asCompany,
            },
          );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asTextbook_author__asGroup_members.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asTextbook_author__asGroup_members? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asTextbook_author__asGroup_members.serializer,
        json,
      );
}

extension GBookFragmentData__asTextbook_author__asGroup_membersWhenExtension
    on GBookFragmentData__asTextbook_author__asGroup_members {
  _T when<_T>({
    required _T Function(
            GBookFragmentData__asTextbook_author__asGroup_members__asPerson)
        person,
    required _T Function(
            GBookFragmentData__asTextbook_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this
            as GBookFragmentData__asTextbook_author__asGroup_members__asPerson));
      case 'Company':
        return company((this
            as GBookFragmentData__asTextbook_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            GBookFragmentData__asTextbook_author__asGroup_members__asPerson)?
        person,
    _T Function(
            GBookFragmentData__asTextbook_author__asGroup_members__asCompany)?
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this
                as GBookFragmentData__asTextbook_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this
                as GBookFragmentData__asTextbook_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragmentData__asTextbook_author__asGroup_members__base
    implements
        Built<GBookFragmentData__asTextbook_author__asGroup_members__base,
            GBookFragmentData__asTextbook_author__asGroup_members__baseBuilder>,
        GBookFragmentData__asTextbook_author__asGroup_members,
        GAuthorGroupFragment {
  GBookFragmentData__asTextbook_author__asGroup_members__base._();

  factory GBookFragmentData__asTextbook_author__asGroup_members__base(
      [void Function(
              GBookFragmentData__asTextbook_author__asGroup_members__baseBuilder
                  b)
          updates]) = _$GBookFragmentData__asTextbook_author__asGroup_members__base;

  static void _initializeBuilder(
          GBookFragmentData__asTextbook_author__asGroup_members__baseBuilder
              b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GBookFragmentData__asTextbook_author__asGroup_members__base>
      get serializer =>
          _$gBookFragmentDataAsTextbookAuthorAsGroupMembersBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asTextbook_author__asGroup_members__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asTextbook_author__asGroup_members__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asTextbook_author__asGroup_members__base.serializer,
        json,
      );
}

abstract class GBookFragmentData__asTextbook_author__asGroup_members__asPerson
    implements
        Built<GBookFragmentData__asTextbook_author__asGroup_members__asPerson,
            GBookFragmentData__asTextbook_author__asGroup_members__asPersonBuilder>,
        GBookFragment_author__asGroup_members,
        GBookFragment__asTextbook_author__asGroup_members,
        GBookFragmentData_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asPerson,
        GBookFragment__asTextbook_author__asGroup_members__asPerson,
        GBookFragmentData_author__asGroup_members__asPerson,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GBookFragmentData__asTextbook_author__asGroup_members,
        GAuthorPersonFragment {
  GBookFragmentData__asTextbook_author__asGroup_members__asPerson._();

  factory GBookFragmentData__asTextbook_author__asGroup_members__asPerson(
          [void Function(
                  GBookFragmentData__asTextbook_author__asGroup_members__asPersonBuilder
                      b)
              updates]) =
      _$GBookFragmentData__asTextbook_author__asGroup_members__asPerson;

  static void _initializeBuilder(
          GBookFragmentData__asTextbook_author__asGroup_members__asPersonBuilder
              b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<
          GBookFragmentData__asTextbook_author__asGroup_members__asPerson>
      get serializer =>
          _$gBookFragmentDataAsTextbookAuthorAsGroupMembersAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asTextbook_author__asGroup_members__asPerson
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asTextbook_author__asGroup_members__asPerson?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GBookFragmentData__asTextbook_author__asGroup_members__asPerson
                .serializer,
            json,
          );
}

abstract class GBookFragmentData__asTextbook_author__asGroup_members__asCompany
    implements
        Built<GBookFragmentData__asTextbook_author__asGroup_members__asCompany,
            GBookFragmentData__asTextbook_author__asGroup_members__asCompanyBuilder>,
        GBookFragment_author__asGroup_members,
        GBookFragment__asTextbook_author__asGroup_members,
        GBookFragmentData_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asCompany,
        GBookFragment__asTextbook_author__asGroup_members__asCompany,
        GBookFragmentData_author__asGroup_members__asCompany,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GBookFragmentData__asTextbook_author__asGroup_members,
        GAuthorCompanyFragment {
  GBookFragmentData__asTextbook_author__asGroup_members__asCompany._();

  factory GBookFragmentData__asTextbook_author__asGroup_members__asCompany(
          [void Function(
                  GBookFragmentData__asTextbook_author__asGroup_members__asCompanyBuilder
                      b)
              updates]) =
      _$GBookFragmentData__asTextbook_author__asGroup_members__asCompany;

  static void _initializeBuilder(
          GBookFragmentData__asTextbook_author__asGroup_members__asCompanyBuilder
              b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<
          GBookFragmentData__asTextbook_author__asGroup_members__asCompany>
      get serializer =>
          _$gBookFragmentDataAsTextbookAuthorAsGroupMembersAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asTextbook_author__asGroup_members__asCompany
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asTextbook_author__asGroup_members__asCompany?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GBookFragmentData__asTextbook_author__asGroup_members__asCompany
                .serializer,
            json,
          );
}

abstract class GBookFragmentData__asColoringBook
    implements
        Built<GBookFragmentData__asColoringBook,
            GBookFragmentData__asColoringBookBuilder>,
        GBookFragment,
        GBookFragment__asColoringBook,
        GBookFragmentData {
  GBookFragmentData__asColoringBook._();

  factory GBookFragmentData__asColoringBook(
          [void Function(GBookFragmentData__asColoringBookBuilder b) updates]) =
      _$GBookFragmentData__asColoringBook;

  static void _initializeBuilder(GBookFragmentData__asColoringBookBuilder b) =>
      b..G__typename = 'ColoringBook';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  GBookFragmentData__asColoringBook_author get author;
  @override
  String get title;
  @override
  BuiltList<String> get colors;
  static Serializer<GBookFragmentData__asColoringBook> get serializer =>
      _$gBookFragmentDataAsColoringBookSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asColoringBook.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asColoringBook? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asColoringBook.serializer,
        json,
      );
}

abstract class GBookFragmentData__asColoringBook_author
    implements
        GBookFragment_author,
        GBookFragment__asColoringBook_author,
        GBookFragmentData_author,
        GAuthorFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GBookFragmentData__asColoringBook_author> get serializer =>
      _i2.InlineFragmentSerializer<GBookFragmentData__asColoringBook_author>(
        'GBookFragmentData__asColoringBook_author',
        GBookFragmentData__asColoringBook_author__base,
        {
          'Person': GBookFragmentData__asColoringBook_author__asPerson,
          'Company': GBookFragmentData__asColoringBook_author__asCompany,
          'Group': GBookFragmentData__asColoringBook_author__asGroup,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asColoringBook_author.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asColoringBook_author? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asColoringBook_author.serializer,
        json,
      );
}

extension GBookFragmentData__asColoringBook_authorWhenExtension
    on GBookFragmentData__asColoringBook_author {
  _T when<_T>({
    required _T Function(GBookFragmentData__asColoringBook_author__asPerson)
        person,
    required _T Function(GBookFragmentData__asColoringBook_author__asCompany)
        company,
    required _T Function(GBookFragmentData__asColoringBook_author__asGroup)
        group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(
            (this as GBookFragmentData__asColoringBook_author__asPerson));
      case 'Company':
        return company(
            (this as GBookFragmentData__asColoringBook_author__asCompany));
      case 'Group':
        return group(
            (this as GBookFragmentData__asColoringBook_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData__asColoringBook_author__asPerson)? person,
    _T Function(GBookFragmentData__asColoringBook_author__asCompany)? company,
    _T Function(GBookFragmentData__asColoringBook_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person(
                (this as GBookFragmentData__asColoringBook_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company(
                (this as GBookFragmentData__asColoringBook_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GBookFragmentData__asColoringBook_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragmentData__asColoringBook_author__base
    implements
        Built<GBookFragmentData__asColoringBook_author__base,
            GBookFragmentData__asColoringBook_author__baseBuilder>,
        GBookFragmentData__asColoringBook_author,
        GAuthorFragment {
  GBookFragmentData__asColoringBook_author__base._();

  factory GBookFragmentData__asColoringBook_author__base(
      [void Function(GBookFragmentData__asColoringBook_author__baseBuilder b)
          updates]) = _$GBookFragmentData__asColoringBook_author__base;

  static void _initializeBuilder(
          GBookFragmentData__asColoringBook_author__baseBuilder b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GBookFragmentData__asColoringBook_author__base>
      get serializer => _$gBookFragmentDataAsColoringBookAuthorBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asColoringBook_author__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asColoringBook_author__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asColoringBook_author__base.serializer,
        json,
      );
}

abstract class GBookFragmentData__asColoringBook_author__asPerson
    implements
        Built<GBookFragmentData__asColoringBook_author__asPerson,
            GBookFragmentData__asColoringBook_author__asPersonBuilder>,
        GBookFragment_author,
        GBookFragment__asColoringBook_author,
        GBookFragmentData_author,
        GAuthorFragment,
        GBookFragment_author__asPerson,
        GBookFragment__asColoringBook_author__asPerson,
        GBookFragmentData_author__asPerson,
        GAuthorFragment__asPerson,
        GBookFragmentData__asColoringBook_author,
        GAuthorPersonFragment {
  GBookFragmentData__asColoringBook_author__asPerson._();

  factory GBookFragmentData__asColoringBook_author__asPerson(
      [void Function(
              GBookFragmentData__asColoringBook_author__asPersonBuilder b)
          updates]) = _$GBookFragmentData__asColoringBook_author__asPerson;

  static void _initializeBuilder(
          GBookFragmentData__asColoringBook_author__asPersonBuilder b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GBookFragmentData__asColoringBook_author__asPerson>
      get serializer =>
          _$gBookFragmentDataAsColoringBookAuthorAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asColoringBook_author__asPerson.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asColoringBook_author__asPerson? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asColoringBook_author__asPerson.serializer,
        json,
      );
}

abstract class GBookFragmentData__asColoringBook_author__asCompany
    implements
        Built<GBookFragmentData__asColoringBook_author__asCompany,
            GBookFragmentData__asColoringBook_author__asCompanyBuilder>,
        GBookFragment_author,
        GBookFragment__asColoringBook_author,
        GBookFragmentData_author,
        GAuthorFragment,
        GBookFragment_author__asCompany,
        GBookFragment__asColoringBook_author__asCompany,
        GBookFragmentData_author__asCompany,
        GAuthorFragment__asCompany,
        GBookFragmentData__asColoringBook_author,
        GAuthorCompanyFragment {
  GBookFragmentData__asColoringBook_author__asCompany._();

  factory GBookFragmentData__asColoringBook_author__asCompany(
      [void Function(
              GBookFragmentData__asColoringBook_author__asCompanyBuilder b)
          updates]) = _$GBookFragmentData__asColoringBook_author__asCompany;

  static void _initializeBuilder(
          GBookFragmentData__asColoringBook_author__asCompanyBuilder b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<GBookFragmentData__asColoringBook_author__asCompany>
      get serializer =>
          _$gBookFragmentDataAsColoringBookAuthorAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asColoringBook_author__asCompany.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asColoringBook_author__asCompany? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asColoringBook_author__asCompany.serializer,
        json,
      );
}

abstract class GBookFragmentData__asColoringBook_author__asGroup
    implements
        Built<GBookFragmentData__asColoringBook_author__asGroup,
            GBookFragmentData__asColoringBook_author__asGroupBuilder>,
        GBookFragment_author,
        GBookFragment__asColoringBook_author,
        GBookFragmentData_author,
        GAuthorFragment,
        GBookFragment_author__asGroup,
        GBookFragment__asColoringBook_author__asGroup,
        GBookFragmentData_author__asGroup,
        GAuthorFragment__asGroup,
        GBookFragmentData__asColoringBook_author {
  GBookFragmentData__asColoringBook_author__asGroup._();

  factory GBookFragmentData__asColoringBook_author__asGroup(
      [void Function(GBookFragmentData__asColoringBook_author__asGroupBuilder b)
          updates]) = _$GBookFragmentData__asColoringBook_author__asGroup;

  static void _initializeBuilder(
          GBookFragmentData__asColoringBook_author__asGroupBuilder b) =>
      b..G__typename = 'Group';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GBookFragmentData__asColoringBook_author__asGroup_members>
      get members;
  static Serializer<GBookFragmentData__asColoringBook_author__asGroup>
      get serializer =>
          _$gBookFragmentDataAsColoringBookAuthorAsGroupSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asColoringBook_author__asGroup.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asColoringBook_author__asGroup? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asColoringBook_author__asGroup.serializer,
        json,
      );
}

abstract class GBookFragmentData__asColoringBook_author__asGroup_members
    implements
        GBookFragment_author__asGroup_members,
        GBookFragment__asColoringBook_author__asGroup_members,
        GBookFragmentData_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GBookFragmentData__asColoringBook_author__asGroup_members>
      get serializer => _i2.InlineFragmentSerializer<
              GBookFragmentData__asColoringBook_author__asGroup_members>(
            'GBookFragmentData__asColoringBook_author__asGroup_members',
            GBookFragmentData__asColoringBook_author__asGroup_members__base,
            {
              'Person':
                  GBookFragmentData__asColoringBook_author__asGroup_members__asPerson,
              'Company':
                  GBookFragmentData__asColoringBook_author__asGroup_members__asCompany,
            },
          );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asColoringBook_author__asGroup_members.serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asColoringBook_author__asGroup_members? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GBookFragmentData__asColoringBook_author__asGroup_members.serializer,
        json,
      );
}

extension GBookFragmentData__asColoringBook_author__asGroup_membersWhenExtension
    on GBookFragmentData__asColoringBook_author__asGroup_members {
  _T when<_T>({
    required _T Function(
            GBookFragmentData__asColoringBook_author__asGroup_members__asPerson)
        person,
    required _T Function(
            GBookFragmentData__asColoringBook_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this
            as GBookFragmentData__asColoringBook_author__asGroup_members__asPerson));
      case 'Company':
        return company((this
            as GBookFragmentData__asColoringBook_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(
            GBookFragmentData__asColoringBook_author__asGroup_members__asPerson)?
        person,
    _T Function(
            GBookFragmentData__asColoringBook_author__asGroup_members__asCompany)?
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this
                as GBookFragmentData__asColoringBook_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this
                as GBookFragmentData__asColoringBook_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragmentData__asColoringBook_author__asGroup_members__base
    implements
        Built<GBookFragmentData__asColoringBook_author__asGroup_members__base,
            GBookFragmentData__asColoringBook_author__asGroup_members__baseBuilder>,
        GBookFragmentData__asColoringBook_author__asGroup_members,
        GAuthorGroupFragment {
  GBookFragmentData__asColoringBook_author__asGroup_members__base._();

  factory GBookFragmentData__asColoringBook_author__asGroup_members__base(
          [void Function(
                  GBookFragmentData__asColoringBook_author__asGroup_members__baseBuilder
                      b)
              updates]) =
      _$GBookFragmentData__asColoringBook_author__asGroup_members__base;

  static void _initializeBuilder(
          GBookFragmentData__asColoringBook_author__asGroup_members__baseBuilder
              b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<
          GBookFragmentData__asColoringBook_author__asGroup_members__base>
      get serializer =>
          _$gBookFragmentDataAsColoringBookAuthorAsGroupMembersBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asColoringBook_author__asGroup_members__base
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asColoringBook_author__asGroup_members__base?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GBookFragmentData__asColoringBook_author__asGroup_members__base
                .serializer,
            json,
          );
}

abstract class GBookFragmentData__asColoringBook_author__asGroup_members__asPerson
    implements
        Built<
            GBookFragmentData__asColoringBook_author__asGroup_members__asPerson,
            GBookFragmentData__asColoringBook_author__asGroup_members__asPersonBuilder>,
        GBookFragment_author__asGroup_members,
        GBookFragment__asColoringBook_author__asGroup_members,
        GBookFragmentData_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asPerson,
        GBookFragment__asColoringBook_author__asGroup_members__asPerson,
        GBookFragmentData_author__asGroup_members__asPerson,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GBookFragmentData__asColoringBook_author__asGroup_members,
        GAuthorPersonFragment {
  GBookFragmentData__asColoringBook_author__asGroup_members__asPerson._();

  factory GBookFragmentData__asColoringBook_author__asGroup_members__asPerson(
          [void Function(
                  GBookFragmentData__asColoringBook_author__asGroup_members__asPersonBuilder
                      b)
              updates]) =
      _$GBookFragmentData__asColoringBook_author__asGroup_members__asPerson;

  static void _initializeBuilder(
          GBookFragmentData__asColoringBook_author__asGroup_members__asPersonBuilder
              b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<
          GBookFragmentData__asColoringBook_author__asGroup_members__asPerson>
      get serializer =>
          _$gBookFragmentDataAsColoringBookAuthorAsGroupMembersAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asColoringBook_author__asGroup_members__asPerson
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asColoringBook_author__asGroup_members__asPerson?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GBookFragmentData__asColoringBook_author__asGroup_members__asPerson
                .serializer,
            json,
          );
}

abstract class GBookFragmentData__asColoringBook_author__asGroup_members__asCompany
    implements
        Built<
            GBookFragmentData__asColoringBook_author__asGroup_members__asCompany,
            GBookFragmentData__asColoringBook_author__asGroup_members__asCompanyBuilder>,
        GBookFragment_author__asGroup_members,
        GBookFragment__asColoringBook_author__asGroup_members,
        GBookFragmentData_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asCompany,
        GBookFragment__asColoringBook_author__asGroup_members__asCompany,
        GBookFragmentData_author__asGroup_members__asCompany,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GBookFragmentData__asColoringBook_author__asGroup_members,
        GAuthorCompanyFragment {
  GBookFragmentData__asColoringBook_author__asGroup_members__asCompany._();

  factory GBookFragmentData__asColoringBook_author__asGroup_members__asCompany(
          [void Function(
                  GBookFragmentData__asColoringBook_author__asGroup_members__asCompanyBuilder
                      b)
              updates]) =
      _$GBookFragmentData__asColoringBook_author__asGroup_members__asCompany;

  static void _initializeBuilder(
          GBookFragmentData__asColoringBook_author__asGroup_members__asCompanyBuilder
              b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<
          GBookFragmentData__asColoringBook_author__asGroup_members__asCompany>
      get serializer =>
          _$gBookFragmentDataAsColoringBookAuthorAsGroupMembersAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GBookFragmentData__asColoringBook_author__asGroup_members__asCompany
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GBookFragmentData__asColoringBook_author__asGroup_members__asCompany?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GBookFragmentData__asColoringBook_author__asGroup_members__asCompany
                .serializer,
            json,
          );
}

abstract class GBookFragmentData_author
    implements GBookFragment_author, GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GBookFragmentData_authorWhenExtension on GBookFragmentData_author {
  _T when<_T>({
    required _T Function(GBookFragmentData_author__asPerson) person,
    required _T Function(GBookFragmentData_author__asCompany) company,
    required _T Function(GBookFragmentData_author__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragmentData_author__asPerson));
      case 'Company':
        return company((this as GBookFragmentData_author__asCompany));
      case 'Group':
        return group((this as GBookFragmentData_author__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData_author__asPerson)? person,
    _T Function(GBookFragmentData_author__asCompany)? company,
    _T Function(GBookFragmentData_author__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GBookFragmentData_author__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GBookFragmentData_author__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GBookFragmentData_author__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragmentData_author__base
    implements GBookFragmentData_author, GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GBookFragmentData_author__asPerson
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asPerson,
        GAuthorFragment__asPerson,
        GBookFragmentData_author,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GBookFragmentData_author__asCompany
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asCompany,
        GAuthorFragment__asCompany,
        GBookFragmentData_author,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GBookFragmentData_author__asGroup
    implements
        GBookFragment_author,
        GAuthorFragment,
        GBookFragment_author__asGroup,
        GAuthorFragment__asGroup,
        GBookFragmentData_author {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GBookFragmentData_author__asGroup_members> get members;
}

abstract class GBookFragmentData_author__asGroup_members
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GBookFragmentData_author__asGroup_membersWhenExtension
    on GBookFragmentData_author__asGroup_members {
  _T when<_T>({
    required _T Function(GBookFragmentData_author__asGroup_members__asPerson)
        person,
    required _T Function(GBookFragmentData_author__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(
            (this as GBookFragmentData_author__asGroup_members__asPerson));
      case 'Company':
        return company(
            (this as GBookFragmentData_author__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData_author__asGroup_members__asPerson)? person,
    _T Function(GBookFragmentData_author__asGroup_members__asCompany)? company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person(
                (this as GBookFragmentData_author__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company(
                (this as GBookFragmentData_author__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GBookFragmentData_author__asGroup_members__base
    implements GBookFragmentData_author__asGroup_members, GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GBookFragmentData_author__asGroup_members__asPerson
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asPerson,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GBookFragmentData_author__asGroup_members,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GBookFragmentData_author__asGroup_members__asCompany
    implements
        GBookFragment_author__asGroup_members,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GBookFragment_author__asGroup_members__asCompany,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GBookFragmentData_author__asGroup_members,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GAuthorFragment {
  String get G__typename;
  String get displayName;
}

extension GAuthorFragmentWhenExtension on GAuthorFragment {
  _T when<_T>({
    required _T Function(GAuthorFragment__asPerson) person,
    required _T Function(GAuthorFragment__asCompany) company,
    required _T Function(GAuthorFragment__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GAuthorFragment__asPerson));
      case 'Company':
        return company((this as GAuthorFragment__asCompany));
      case 'Group':
        return group((this as GAuthorFragment__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GAuthorFragment__asPerson)? person,
    _T Function(GAuthorFragment__asCompany)? company,
    _T Function(GAuthorFragment__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GAuthorFragment__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GAuthorFragment__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GAuthorFragment__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GAuthorFragment__base implements GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GAuthorFragment__asPerson
    implements GAuthorFragment, GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GAuthorFragment__asCompany
    implements GAuthorFragment, GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GAuthorFragment__asGroup implements GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  BuiltList<GAuthorFragment__asGroup_members> get members;
}

abstract class GAuthorFragment__asGroup_members
    implements GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

extension GAuthorFragment__asGroup_membersWhenExtension
    on GAuthorFragment__asGroup_members {
  _T when<_T>({
    required _T Function(GAuthorFragment__asGroup_members__asPerson) person,
    required _T Function(GAuthorFragment__asGroup_members__asCompany) company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GAuthorFragment__asGroup_members__asPerson));
      case 'Company':
        return company((this as GAuthorFragment__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GAuthorFragment__asGroup_members__asPerson)? person,
    _T Function(GAuthorFragment__asGroup_members__asCompany)? company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GAuthorFragment__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GAuthorFragment__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GAuthorFragment__asGroup_members__base
    implements GAuthorFragment__asGroup_members, GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GAuthorFragment__asGroup_members__asPerson
    implements
        GAuthorGroupFragment,
        GAuthorGroupFragment__asPerson,
        GAuthorFragment__asGroup_members,
        GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GAuthorFragment__asGroup_members__asCompany
    implements
        GAuthorGroupFragment,
        GAuthorGroupFragment__asCompany,
        GAuthorFragment__asGroup_members,
        GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GAuthorFragmentData implements GAuthorFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GAuthorFragmentData> get serializer =>
      _i2.InlineFragmentSerializer<GAuthorFragmentData>(
        'GAuthorFragmentData',
        GAuthorFragmentData__base,
        {
          'Person': GAuthorFragmentData__asPerson,
          'Company': GAuthorFragmentData__asCompany,
          'Group': GAuthorFragmentData__asGroup,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorFragmentData.serializer,
        json,
      );
}

extension GAuthorFragmentDataWhenExtension on GAuthorFragmentData {
  _T when<_T>({
    required _T Function(GAuthorFragmentData__asPerson) person,
    required _T Function(GAuthorFragmentData__asCompany) company,
    required _T Function(GAuthorFragmentData__asGroup) group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GAuthorFragmentData__asPerson));
      case 'Company':
        return company((this as GAuthorFragmentData__asCompany));
      case 'Group':
        return group((this as GAuthorFragmentData__asGroup));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GAuthorFragmentData__asPerson)? person,
    _T Function(GAuthorFragmentData__asCompany)? company,
    _T Function(GAuthorFragmentData__asGroup)? group,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GAuthorFragmentData__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GAuthorFragmentData__asCompany))
            : orElse();
      case 'Group':
        return group != null
            ? group((this as GAuthorFragmentData__asGroup))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GAuthorFragmentData__base
    implements
        Built<GAuthorFragmentData__base, GAuthorFragmentData__baseBuilder>,
        GAuthorFragmentData {
  GAuthorFragmentData__base._();

  factory GAuthorFragmentData__base(
          [void Function(GAuthorFragmentData__baseBuilder b) updates]) =
      _$GAuthorFragmentData__base;

  static void _initializeBuilder(GAuthorFragmentData__baseBuilder b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GAuthorFragmentData__base> get serializer =>
      _$gAuthorFragmentDataBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorFragmentData__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorFragmentData__base? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorFragmentData__base.serializer,
        json,
      );
}

abstract class GAuthorFragmentData__asPerson
    implements
        Built<GAuthorFragmentData__asPerson,
            GAuthorFragmentData__asPersonBuilder>,
        GAuthorFragment,
        GAuthorFragment__asPerson,
        GAuthorFragmentData,
        GAuthorPersonFragment {
  GAuthorFragmentData__asPerson._();

  factory GAuthorFragmentData__asPerson(
          [void Function(GAuthorFragmentData__asPersonBuilder b) updates]) =
      _$GAuthorFragmentData__asPerson;

  static void _initializeBuilder(GAuthorFragmentData__asPersonBuilder b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GAuthorFragmentData__asPerson> get serializer =>
      _$gAuthorFragmentDataAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorFragmentData__asPerson.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorFragmentData__asPerson? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorFragmentData__asPerson.serializer,
        json,
      );
}

abstract class GAuthorFragmentData__asCompany
    implements
        Built<GAuthorFragmentData__asCompany,
            GAuthorFragmentData__asCompanyBuilder>,
        GAuthorFragment,
        GAuthorFragment__asCompany,
        GAuthorFragmentData,
        GAuthorCompanyFragment {
  GAuthorFragmentData__asCompany._();

  factory GAuthorFragmentData__asCompany(
          [void Function(GAuthorFragmentData__asCompanyBuilder b) updates]) =
      _$GAuthorFragmentData__asCompany;

  static void _initializeBuilder(GAuthorFragmentData__asCompanyBuilder b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<GAuthorFragmentData__asCompany> get serializer =>
      _$gAuthorFragmentDataAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorFragmentData__asCompany.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorFragmentData__asCompany? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorFragmentData__asCompany.serializer,
        json,
      );
}

abstract class GAuthorFragmentData__asGroup
    implements
        Built<GAuthorFragmentData__asGroup,
            GAuthorFragmentData__asGroupBuilder>,
        GAuthorFragment,
        GAuthorFragment__asGroup,
        GAuthorFragmentData {
  GAuthorFragmentData__asGroup._();

  factory GAuthorFragmentData__asGroup(
          [void Function(GAuthorFragmentData__asGroupBuilder b) updates]) =
      _$GAuthorFragmentData__asGroup;

  static void _initializeBuilder(GAuthorFragmentData__asGroupBuilder b) =>
      b..G__typename = 'Group';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  BuiltList<GAuthorFragmentData__asGroup_members> get members;
  static Serializer<GAuthorFragmentData__asGroup> get serializer =>
      _$gAuthorFragmentDataAsGroupSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorFragmentData__asGroup.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorFragmentData__asGroup? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorFragmentData__asGroup.serializer,
        json,
      );
}

abstract class GAuthorFragmentData__asGroup_members
    implements GAuthorFragment__asGroup_members, GAuthorGroupFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GAuthorFragmentData__asGroup_members> get serializer =>
      _i2.InlineFragmentSerializer<GAuthorFragmentData__asGroup_members>(
        'GAuthorFragmentData__asGroup_members',
        GAuthorFragmentData__asGroup_members__base,
        {
          'Person': GAuthorFragmentData__asGroup_members__asPerson,
          'Company': GAuthorFragmentData__asGroup_members__asCompany,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorFragmentData__asGroup_members.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorFragmentData__asGroup_members? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorFragmentData__asGroup_members.serializer,
        json,
      );
}

extension GAuthorFragmentData__asGroup_membersWhenExtension
    on GAuthorFragmentData__asGroup_members {
  _T when<_T>({
    required _T Function(GAuthorFragmentData__asGroup_members__asPerson) person,
    required _T Function(GAuthorFragmentData__asGroup_members__asCompany)
        company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GAuthorFragmentData__asGroup_members__asPerson));
      case 'Company':
        return company(
            (this as GAuthorFragmentData__asGroup_members__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GAuthorFragmentData__asGroup_members__asPerson)? person,
    _T Function(GAuthorFragmentData__asGroup_members__asCompany)? company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GAuthorFragmentData__asGroup_members__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GAuthorFragmentData__asGroup_members__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GAuthorFragmentData__asGroup_members__base
    implements
        Built<GAuthorFragmentData__asGroup_members__base,
            GAuthorFragmentData__asGroup_members__baseBuilder>,
        GAuthorFragmentData__asGroup_members,
        GAuthorGroupFragment {
  GAuthorFragmentData__asGroup_members__base._();

  factory GAuthorFragmentData__asGroup_members__base(
      [void Function(GAuthorFragmentData__asGroup_members__baseBuilder b)
          updates]) = _$GAuthorFragmentData__asGroup_members__base;

  static void _initializeBuilder(
          GAuthorFragmentData__asGroup_members__baseBuilder b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GAuthorFragmentData__asGroup_members__base>
      get serializer => _$gAuthorFragmentDataAsGroupMembersBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorFragmentData__asGroup_members__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorFragmentData__asGroup_members__base? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorFragmentData__asGroup_members__base.serializer,
        json,
      );
}

abstract class GAuthorFragmentData__asGroup_members__asPerson
    implements
        Built<GAuthorFragmentData__asGroup_members__asPerson,
            GAuthorFragmentData__asGroup_members__asPersonBuilder>,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GAuthorFragment__asGroup_members__asPerson,
        GAuthorGroupFragment__asPerson,
        GAuthorFragmentData__asGroup_members,
        GAuthorPersonFragment {
  GAuthorFragmentData__asGroup_members__asPerson._();

  factory GAuthorFragmentData__asGroup_members__asPerson(
      [void Function(GAuthorFragmentData__asGroup_members__asPersonBuilder b)
          updates]) = _$GAuthorFragmentData__asGroup_members__asPerson;

  static void _initializeBuilder(
          GAuthorFragmentData__asGroup_members__asPersonBuilder b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GAuthorFragmentData__asGroup_members__asPerson>
      get serializer => _$gAuthorFragmentDataAsGroupMembersAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorFragmentData__asGroup_members__asPerson.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorFragmentData__asGroup_members__asPerson? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorFragmentData__asGroup_members__asPerson.serializer,
        json,
      );
}

abstract class GAuthorFragmentData__asGroup_members__asCompany
    implements
        Built<GAuthorFragmentData__asGroup_members__asCompany,
            GAuthorFragmentData__asGroup_members__asCompanyBuilder>,
        GAuthorFragment__asGroup_members,
        GAuthorGroupFragment,
        GAuthorFragment__asGroup_members__asCompany,
        GAuthorGroupFragment__asCompany,
        GAuthorFragmentData__asGroup_members,
        GAuthorCompanyFragment {
  GAuthorFragmentData__asGroup_members__asCompany._();

  factory GAuthorFragmentData__asGroup_members__asCompany(
      [void Function(GAuthorFragmentData__asGroup_members__asCompanyBuilder b)
          updates]) = _$GAuthorFragmentData__asGroup_members__asCompany;

  static void _initializeBuilder(
          GAuthorFragmentData__asGroup_members__asCompanyBuilder b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<GAuthorFragmentData__asGroup_members__asCompany>
      get serializer => _$gAuthorFragmentDataAsGroupMembersAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorFragmentData__asGroup_members__asCompany.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorFragmentData__asGroup_members__asCompany? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorFragmentData__asGroup_members__asCompany.serializer,
        json,
      );
}

abstract class GAuthorPersonFragment {
  String get G__typename;
  String get firstName;
  String get lastName;
}

abstract class GAuthorPersonFragmentData
    implements
        Built<GAuthorPersonFragmentData, GAuthorPersonFragmentDataBuilder>,
        GAuthorPersonFragment {
  GAuthorPersonFragmentData._();

  factory GAuthorPersonFragmentData(
          [void Function(GAuthorPersonFragmentDataBuilder b) updates]) =
      _$GAuthorPersonFragmentData;

  static void _initializeBuilder(GAuthorPersonFragmentDataBuilder b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GAuthorPersonFragmentData> get serializer =>
      _$gAuthorPersonFragmentDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorPersonFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorPersonFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorPersonFragmentData.serializer,
        json,
      );
}

abstract class GAuthorCompanyFragment {
  String get G__typename;
  String get name;
}

abstract class GAuthorCompanyFragmentData
    implements
        Built<GAuthorCompanyFragmentData, GAuthorCompanyFragmentDataBuilder>,
        GAuthorCompanyFragment {
  GAuthorCompanyFragmentData._();

  factory GAuthorCompanyFragmentData(
          [void Function(GAuthorCompanyFragmentDataBuilder b) updates]) =
      _$GAuthorCompanyFragmentData;

  static void _initializeBuilder(GAuthorCompanyFragmentDataBuilder b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get name;
  static Serializer<GAuthorCompanyFragmentData> get serializer =>
      _$gAuthorCompanyFragmentDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorCompanyFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorCompanyFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorCompanyFragmentData.serializer,
        json,
      );
}

abstract class GAuthorGroupFragment {
  String get G__typename;
  String get displayName;
}

extension GAuthorGroupFragmentWhenExtension on GAuthorGroupFragment {
  _T when<_T>({
    required _T Function(GAuthorGroupFragment__asPerson) person,
    required _T Function(GAuthorGroupFragment__asCompany) company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GAuthorGroupFragment__asPerson));
      case 'Company':
        return company((this as GAuthorGroupFragment__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GAuthorGroupFragment__asPerson)? person,
    _T Function(GAuthorGroupFragment__asCompany)? company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GAuthorGroupFragment__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GAuthorGroupFragment__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GAuthorGroupFragment__base implements GAuthorGroupFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
}

abstract class GAuthorGroupFragment__asPerson
    implements GAuthorGroupFragment, GAuthorPersonFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
}

abstract class GAuthorGroupFragment__asCompany
    implements GAuthorGroupFragment, GAuthorCompanyFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}

abstract class GAuthorGroupFragmentData implements GAuthorGroupFragment {
  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GAuthorGroupFragmentData> get serializer =>
      _i2.InlineFragmentSerializer<GAuthorGroupFragmentData>(
        'GAuthorGroupFragmentData',
        GAuthorGroupFragmentData__base,
        {
          'Person': GAuthorGroupFragmentData__asPerson,
          'Company': GAuthorGroupFragmentData__asCompany,
        },
      );

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorGroupFragmentData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorGroupFragmentData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorGroupFragmentData.serializer,
        json,
      );
}

extension GAuthorGroupFragmentDataWhenExtension on GAuthorGroupFragmentData {
  _T when<_T>({
    required _T Function(GAuthorGroupFragmentData__asPerson) person,
    required _T Function(GAuthorGroupFragmentData__asCompany) company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GAuthorGroupFragmentData__asPerson));
      case 'Company':
        return company((this as GAuthorGroupFragmentData__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GAuthorGroupFragmentData__asPerson)? person,
    _T Function(GAuthorGroupFragmentData__asCompany)? company,
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person != null
            ? person((this as GAuthorGroupFragmentData__asPerson))
            : orElse();
      case 'Company':
        return company != null
            ? company((this as GAuthorGroupFragmentData__asCompany))
            : orElse();
      default:
        return orElse();
    }
  }
}

abstract class GAuthorGroupFragmentData__base
    implements
        Built<GAuthorGroupFragmentData__base,
            GAuthorGroupFragmentData__baseBuilder>,
        GAuthorGroupFragmentData {
  GAuthorGroupFragmentData__base._();

  factory GAuthorGroupFragmentData__base(
          [void Function(GAuthorGroupFragmentData__baseBuilder b) updates]) =
      _$GAuthorGroupFragmentData__base;

  static void _initializeBuilder(GAuthorGroupFragmentData__baseBuilder b) =>
      b..G__typename = 'Author';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  static Serializer<GAuthorGroupFragmentData__base> get serializer =>
      _$gAuthorGroupFragmentDataBaseSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorGroupFragmentData__base.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorGroupFragmentData__base? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorGroupFragmentData__base.serializer,
        json,
      );
}

abstract class GAuthorGroupFragmentData__asPerson
    implements
        Built<GAuthorGroupFragmentData__asPerson,
            GAuthorGroupFragmentData__asPersonBuilder>,
        GAuthorGroupFragment,
        GAuthorGroupFragment__asPerson,
        GAuthorGroupFragmentData,
        GAuthorPersonFragment {
  GAuthorGroupFragmentData__asPerson._();

  factory GAuthorGroupFragmentData__asPerson(
      [void Function(GAuthorGroupFragmentData__asPersonBuilder b)
          updates]) = _$GAuthorGroupFragmentData__asPerson;

  static void _initializeBuilder(GAuthorGroupFragmentData__asPersonBuilder b) =>
      b..G__typename = 'Person';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get firstName;
  @override
  String get lastName;
  static Serializer<GAuthorGroupFragmentData__asPerson> get serializer =>
      _$gAuthorGroupFragmentDataAsPersonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorGroupFragmentData__asPerson.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorGroupFragmentData__asPerson? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorGroupFragmentData__asPerson.serializer,
        json,
      );
}

abstract class GAuthorGroupFragmentData__asCompany
    implements
        Built<GAuthorGroupFragmentData__asCompany,
            GAuthorGroupFragmentData__asCompanyBuilder>,
        GAuthorGroupFragment,
        GAuthorGroupFragment__asCompany,
        GAuthorGroupFragmentData,
        GAuthorCompanyFragment {
  GAuthorGroupFragmentData__asCompany._();

  factory GAuthorGroupFragmentData__asCompany(
      [void Function(GAuthorGroupFragmentData__asCompanyBuilder b)
          updates]) = _$GAuthorGroupFragmentData__asCompany;

  static void _initializeBuilder(
          GAuthorGroupFragmentData__asCompanyBuilder b) =>
      b..G__typename = 'Company';

  @override
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
  static Serializer<GAuthorGroupFragmentData__asCompany> get serializer =>
      _$gAuthorGroupFragmentDataAsCompanySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GAuthorGroupFragmentData__asCompany.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAuthorGroupFragmentData__asCompany? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GAuthorGroupFragmentData__asCompany.serializer,
        json,
      );
}
