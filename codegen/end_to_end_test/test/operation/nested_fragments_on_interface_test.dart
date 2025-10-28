import 'package:end_to_end_test/fragments/__generated__/nested_fragments_on_interface.data.gql.dart';
import 'package:test/test.dart';

void main() {
  group('Nested Fragments on Interface', () {
    test('can deserialize correctly from sub-Typed data', () {
      final jsonBooks = [
        {
          "__typename": "Textbook",
          "author": {
            "__typename": "Person",
            "displayName": "Hugh Teach",
            "firstName": "Hugh",
            "lastName": "Teach",
          },
          "title": "Teaching 101",
          "courses": ["Education", "Teaching"],
        },
        {
          "__typename": "ColoringBook",
          "author": {
            "__typename": "Company",
            "displayName": "Fiona Fiction",
            "name": "Fiona Fiction Ltd.",
          },
          "title": "Fictional Realities",
          "colors": ["Green", "Red"],
        }
      ];

      final textbook = GGetBooksData_books__asTextbook.fromJson(jsonBooks[0])!;
      expect(textbook.author.displayName, 'Hugh Teach');
      expect(textbook.author, isA<GAuthorFragment>());
      expect(
        textbook.author.maybeWhen(
          person: (x) => x.firstName == 'Hugh' && x.lastName == 'Teach',
          orElse: () => false,
        ),
        isTrue,
      );

      final coloringBook =
          GGetBooksData_books__asColoringBook.fromJson(jsonBooks[1])!;
      expect(coloringBook.author.displayName, 'Fiona Fiction');
      expect(coloringBook.author, isA<GAuthorFragment>());
      expect(
        coloringBook.author.maybeWhen(
          company: (x) => x.name == 'Fiona Fiction Ltd.',
          orElse: () => false,
        ),
        isTrue,
      );
    });

    test('can be serialized and deserialized', () {
      final textbook = GGetBooksData_books__asTextbook(
        (b) => b
          ..author = GGetBooksData_books__asTextbook_author__asPerson(
            (a) => a
              ..displayName = 'Hugh Teach'
              ..firstName = 'Hugh'
              ..lastName = 'Teach',
          )
          ..title = 'Teaching 101'
          ..courses.addAll(['Education', 'Teaching']),
      );

      final jsonTextbook = {
        "__typename": "Textbook",
        "author": {
          "__typename": "Person",
          "displayName": "Hugh Teach",
          "firstName": "Hugh",
          "lastName": "Teach",
        },
        "title": "Teaching 101",
        "courses": ["Education", "Teaching"],
      };

      expect(textbook.toJson(), equals(jsonTextbook));

      final coloringBook = GGetBooksData_books__asColoringBook(
        (b) => b
          ..author = GGetBooksData_books__asColoringBook_author__asCompany(
            (a) => a
              ..displayName = 'Fiona Fiction'
              ..name = 'Fiona Fiction Ltd.',
          )
          ..title = 'Fictional Realities'
          ..colors.addAll(['Green', 'Red']),
      );

      final jsonColoringBook = {
        "__typename": "ColoringBook",
        "author": {
          "__typename": "Company",
          "displayName": "Fiona Fiction",
          "name": "Fiona Fiction Ltd.",
        },
        "title": "Fictional Realities",
        "colors": ["Green", "Red"],
      };

      expect(coloringBook.toJson(), equals(jsonColoringBook));
    });
  });
}
