import "package:build/build.dart";

const sourceExtension = ".graphql";

const genExtension = ".gql.dart";

const astExtension = ".ast.gql.dart";
const opExtension = ".op.gql.dart";
const dataExtension = ".data.gql.dart";
const reqExtension = ".req.gql.dart";
const varExtension = ".var.gql.dart";
const schemaExtension = ".schema.gql.dart";
const serializerExtension = ".serializer.gql.dart";

const outputDir = "__generated__";

const inputPattern = "{{inputDir}}/{{file}}${sourceExtension}";

String outputPattern(String extension) =>
    "{{inputDir}}/${outputDir}/{{file}}${extension}";

String outputPath(String inputPath) {
  final pathSegments = inputPath.split("/");
  pathSegments.insert(pathSegments.length - 1, outputDir);
  return pathSegments.join("/");
}

AssetId outputAssetId(AssetId inputAssetId, String extension) => AssetId(
      inputAssetId.package,
      outputPath(inputAssetId.path),
    ).changeExtension(extension);

String generatedFileExtension(String sourceExtension) {
  final parts = sourceExtension.split(".");
  final dartExtension = parts.removeLast();
  assert(dartExtension == "dart", "Unrecognized file type");
  parts.add("g.dart");
  return parts.join(".");
}
