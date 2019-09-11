/// Basic tools to work with a GraphQL AST.
///
/// Includes
/// - definitions of all GraphQL AST [Node] types,
/// - implementation of Visitor Pattern via [Node.accept], [Node.visitChildren] and [Visitor],
/// - ability to transform ASTs using [transform] and [TransformingVisitor].
library ast;

export "package:gql/src/ast/ast.dart";
export "package:gql/src/ast/transformer.dart";
export "package:gql/src/ast/visitor.dart";
