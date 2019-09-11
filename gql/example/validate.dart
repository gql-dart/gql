import "package:gql/document.dart" as doc;
import "package:gql/language.dart" as lang;

void main() {
  final errors = doc.validate(
    lang.parseString(
      """
      directive @A on QUERY
      
      type A { a: String, b : String, a: String }
      
      directive @A on QUERY
      """,
    ),
    {
      doc.ValidationRule.uniqueFieldDefinitionNames,
      doc.ValidationRule.uniqueDirectiveNames,
    },
  );

  print("${errors.length} validation errors");
  errors.forEach(print);
}
