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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GGetBooksData_books__base_author__asPerson));
      case 'Company':
        return company((this as GGetBooksData_books__base_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetBooksData_books__base_author__asPerson)? person,
    _T Function(GGetBooksData_books__base_author__asCompany)? company,
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
        GGetBooksData_books__base_author {
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
        GGetBooksData_books__base_author {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(
            (this as GGetBooksData_books__asTextbook_author__asPerson));
      case 'Company':
        return company(
            (this as GGetBooksData_books__asTextbook_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetBooksData_books__asTextbook_author__asPerson)? person,
    _T Function(GGetBooksData_books__asTextbook_author__asCompany)? company,
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
        GBookFragment,
        GBookFragment__asPerson,
        GGetBooksData_books_author__asPerson,
        GAuthorFragment__asPerson,
        GGetBooksData_books__asTextbook_author {
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
        GBookFragment,
        GBookFragment__asCompany,
        GGetBooksData_books_author__asCompany,
        GAuthorFragment__asCompany,
        GGetBooksData_books__asTextbook_author {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(
            (this as GGetBooksData_books__asColoringBook_author__asPerson));
      case 'Company':
        return company(
            (this as GGetBooksData_books__asColoringBook_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetBooksData_books__asColoringBook_author__asPerson)? person,
    _T Function(GGetBooksData_books__asColoringBook_author__asCompany)? company,
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
        GBookFragment,
        GBookFragment__asPerson,
        GGetBooksData_books_author__asPerson,
        GAuthorFragment__asPerson,
        GGetBooksData_books__asColoringBook_author {
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
        GBookFragment,
        GBookFragment__asCompany,
        GGetBooksData_books_author__asCompany,
        GAuthorFragment__asCompany,
        GGetBooksData_books__asColoringBook_author {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GGetBooksData_books_author__asPerson));
      case 'Company':
        return company((this as GGetBooksData_books_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GGetBooksData_books_author__asPerson)? person,
    _T Function(GGetBooksData_books_author__asCompany)? company,
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
        GGetBooksData_books_author {
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
        GGetBooksData_books_author {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GAuthorFragment__asPerson));
      case 'Company':
        return company((this as GAuthorFragment__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GAuthorFragment__asPerson)? person,
    _T Function(GAuthorFragment__asCompany)? company,
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

abstract class GAuthorFragment__asPerson implements GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
  String get firstName;
  String get lastName;
}

abstract class GAuthorFragment__asCompany implements GAuthorFragment {
  @override
  String get G__typename;
  @override
  String get displayName;
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GAuthorFragmentData__asPerson));
      case 'Company':
        return company((this as GAuthorFragmentData__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GAuthorFragmentData__asPerson)? person,
    _T Function(GAuthorFragmentData__asCompany)? company,
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
        GAuthorFragmentData {
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
        GAuthorFragmentData {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragment__base_author__asPerson));
      case 'Company':
        return company((this as GBookFragment__base_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment__base_author__asPerson)? person,
    _T Function(GBookFragment__base_author__asCompany)? company,
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
        GBookFragment__base_author {
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
        GBookFragment__base_author {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragment__asTextbook_author__asPerson));
      case 'Company':
        return company((this as GBookFragment__asTextbook_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment__asTextbook_author__asPerson)? person,
    _T Function(GBookFragment__asTextbook_author__asCompany)? company,
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
        GBookFragment__asTextbook_author {
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
        GBookFragment__asTextbook_author {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragment__asColoringBook_author__asPerson));
      case 'Company':
        return company(
            (this as GBookFragment__asColoringBook_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment__asColoringBook_author__asPerson)? person,
    _T Function(GBookFragment__asColoringBook_author__asCompany)? company,
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
        GBookFragment__asColoringBook_author {
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
        GBookFragment__asColoringBook_author {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragment_author__asPerson));
      case 'Company':
        return company((this as GBookFragment_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragment_author__asPerson)? person,
    _T Function(GBookFragment_author__asCompany)? company,
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
        GBookFragment_author {
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
        GBookFragment_author {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragmentData__base_author__asPerson));
      case 'Company':
        return company((this as GBookFragmentData__base_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData__base_author__asPerson)? person,
    _T Function(GBookFragmentData__base_author__asCompany)? company,
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
        GBookFragmentData__base_author {
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
        GBookFragmentData__base_author {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragmentData__asTextbook_author__asPerson));
      case 'Company':
        return company(
            (this as GBookFragmentData__asTextbook_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData__asTextbook_author__asPerson)? person,
    _T Function(GBookFragmentData__asTextbook_author__asCompany)? company,
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
        GBookFragment,
        GBookFragment__asPerson,
        GBookFragmentData_author__asPerson,
        GAuthorFragment__asPerson,
        GBookFragmentData__asTextbook_author {
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
        GBookFragment,
        GBookFragment__asCompany,
        GBookFragmentData_author__asCompany,
        GAuthorFragment__asCompany,
        GBookFragmentData__asTextbook_author {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person(
            (this as GBookFragmentData__asColoringBook_author__asPerson));
      case 'Company':
        return company(
            (this as GBookFragmentData__asColoringBook_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData__asColoringBook_author__asPerson)? person,
    _T Function(GBookFragmentData__asColoringBook_author__asCompany)? company,
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
        GBookFragment,
        GBookFragment__asPerson,
        GBookFragmentData_author__asPerson,
        GAuthorFragment__asPerson,
        GBookFragmentData__asColoringBook_author {
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
        GBookFragment,
        GBookFragment__asCompany,
        GBookFragmentData_author__asCompany,
        GAuthorFragment__asCompany,
        GBookFragmentData__asColoringBook_author {
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
    required _T Function() orElse,
  }) {
    switch (G__typename) {
      case 'Person':
        return person((this as GBookFragmentData_author__asPerson));
      case 'Company':
        return company((this as GBookFragmentData_author__asCompany));
      default:
        return orElse();
    }
  }

  _T maybeWhen<_T>({
    _T Function(GBookFragmentData_author__asPerson)? person,
    _T Function(GBookFragmentData_author__asCompany)? company,
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
        GBookFragmentData_author {
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
        GBookFragmentData_author {
  @override
  String get G__typename;
  @override
  String get displayName;
  @override
  String get name;
}
