const sourceExtension = ".graphql";

const genExtension = ".gql.dart";

const astExtension = ".ast.gql.dart";

const opExtension = ".op.gql.dart";
const dataExtension = ".data.gql.dart";
const reqExtension = ".req.gql.dart";
const varExtension = ".var.gql.dart";

const schemaExtension = ".schema.gql.dart";

String generatedFileExtension(String sourceExtension) {
  final parts = sourceExtension.split(".");
  final dartExtension = parts.removeLast();
  assert(dartExtension == "dart", "Unrecognized file type");
  parts.add("g.dart");
  return parts.join(".");
}
