import 'dart:io';
import 'package:gql/ast.dart';

/// Generates a detailed textual representation of a GraphQL AST
/// This function recursively traverses the AST and generates
/// human-readable output showing node types, properties, and hierarchy
String visualizeAST(Node node, [String indent = ""]) {
  final nodeType = node.runtimeType.toString();
  String result = "$indent$nodeType";

  // Handle specific node types with their properties
  if (node is DocumentNode) {
    result += "\n${indent}  definitions (${node.definitions.length}):";
    for (var def in node.definitions) {
      result += "\n" + visualizeAST(def, indent + "    ");
    }
  } else if (node is OperationDefinitionNode) {
    result += " | type: ${node.type}";
    if (node.name != null) {
      result += " | name: ${node.name!.value}";
    }
    if (node.variableDefinitions.isNotEmpty) {
      result +=
          "\n${indent}  variableDefinitions (${node.variableDefinitions.length}):";
      for (var varDef in node.variableDefinitions) {
        result += "\n" + visualizeAST(varDef, indent + "    ");
      }
    }
    result += "\n" + visualizeAST(node.selectionSet, indent + "  ");
  } else if (node is VariableDefinitionNode) {
    result += " | variable: ${node.variable.name.value}";
    result += " | type: " + visualizeTypeNode(node.type);
    if (node.defaultValue != null && node.defaultValue!.value != null) {
      result += " | default: " + visualizeValueNode(node.defaultValue!.value!);
    }
  } else if (node is SelectionSetNode) {
    result += "\n${indent}  selections (${node.selections.length}):";
    for (var selection in node.selections) {
      result += "\n" + visualizeAST(selection, indent + "    ");
    }
  } else if (node is FieldNode) {
    result += " | name: ${node.name.value}";
    if (node.alias != null) {
      result += " | alias: ${node.alias!.value}";
    }
    if (node.arguments.isNotEmpty) {
      result += "\n${indent}  arguments (${node.arguments.length}):";
      for (var arg in node.arguments) {
        result += "\n" + visualizeAST(arg, indent + "    ");
      }
    }
    if (node.selectionSet != null) {
      result += "\n" + visualizeAST(node.selectionSet!, indent + "  ");
    }
  } else if (node is FragmentSpreadNode) {
    result += " | name: ${node.name.value}";
    if (node.directives.isNotEmpty) {
      result +=
          " | directives: ${node.directives.map((d) => d.name.value).join(', ')}";
    }
  } else if (node is InlineFragmentNode) {
    if (node.typeCondition != null) {
      result += " | on: ${node.typeCondition!.on.name.value}";
    }
    if (node.directives.isNotEmpty) {
      result +=
          " | directives: ${node.directives.map((d) => d.name.value).join(', ')}";
    }
    result += "\n" + visualizeAST(node.selectionSet, indent + "  ");
  } else if (node is FragmentDefinitionNode) {
    result += " | name: ${node.name.value}";
    result += " | on: ${node.typeCondition.on.name.value}";
    if (node.directives.isNotEmpty) {
      result +=
          " | directives: ${node.directives.map((d) => d.name.value).join(', ')}";
    }
    result += "\n" + visualizeAST(node.selectionSet, indent + "  ");
  } else if (node is ArgumentNode) {
    result += " | name: ${node.name.value}";
    result += " | value: " + visualizeValueNode(node.value);
  } else if (node is DirectiveNode) {
    result += " | name: ${node.name.value}";
    if (node.arguments.isNotEmpty) {
      result += " | args: ${node.arguments.length}";
    }
  }

  return result;
}

/// Helper function to visualize a TypeNode
String visualizeTypeNode(TypeNode node) {
  if (node is NamedTypeNode) {
    return "${node.name.value}${node.isNonNull ? '!' : ''}";
  } else if (node is ListTypeNode) {
    return "[${visualizeTypeNode(node.type)}]${node.isNonNull ? '!' : ''}";
  }
  return node.toString();
}

/// Helper function to visualize a ValueNode
String visualizeValueNode(ValueNode? node) {
  if (node == null) {
    return "null";
  }
  if (node is StringValueNode) {
    return "\"${node.value}\"";
  } else if (node is IntValueNode) {
    return node.value;
  } else if (node is FloatValueNode) {
    return node.value;
  } else if (node is BooleanValueNode) {
    return "${node.value}";
  } else if (node is EnumValueNode) {
    return node.name.value;
  } else if (node is VariableNode) {
    return "\$${node.name.value}";
  } else if (node is ListValueNode) {
    return "[${node.values.map(visualizeValueNode).join(', ')}]";
  } else if (node is ObjectValueNode) {
    return "{${node.fields.map((f) => "${f.name.value}: ${visualizeValueNode(f.value)}").join(', ')}}";
  } else if (node is NullValueNode) {
    return "null";
  }
  return node.toString();
}

/// Escape special characters for Mermaid node labels
String escapeMermaidText(String text) {
  // Replace problematic characters for Mermaid labels
  return text
      .replaceAll('"', '\\"') // Escape quotes
      .replaceAll('<', '&lt;') // Replace < with &lt;
      .replaceAll('>', '&gt;') // Replace > with &gt;
      .replaceAll(':', '-') // Replace : with -
      .replaceAll('{', '(') // Replace { with (
      .replaceAll('}', ')') // Replace } with )
      .replaceAll('\n', ' '); // Replace newlines with spaces
}

/// Generates a Mermaid diagram representation of a GraphQL AST
String generateMermaidDiagram(Node node) {
  final StringBuffer sb = StringBuffer();
  sb.writeln("flowchart TD");

  // Use a counter for unique node IDs
  int counter = 0;
  Map<String, String> fragmentIds = {};
  Map<String, List<String>> fragmentLinks = {};

  void buildDiagram(Node node, String parentId, [String path = ""]) {
    final nodeId = "node${counter++}";

    // Create a safe label for Mermaid
    String nodeLabel = escapeMermaidText(nodeTypeLabel(node));
    String nodeClass = nodeTypeCssClass(node);

    // Add the node with its class
    sb.writeln('  $nodeId["$nodeLabel"]:::$nodeClass');

    // Connect to parent if needed
    if (parentId.isNotEmpty) {
      String edgeLabel = "";

      // Add labels to edges for clarity
      if (node is FieldNode) {
        edgeLabel = " |field|";
      } else if (node is FragmentSpreadNode) {
        edgeLabel = " |...spread|";

        // Store fragment spread for linking later
        if (!fragmentLinks.containsKey(node.name.value)) {
          fragmentLinks[node.name.value] = [];
        }
        fragmentLinks[node.name.value]!.add(nodeId);
      } else if (node is InlineFragmentNode) {
        final typeName = node.typeCondition?.on.name.value ?? "unknown";
        edgeLabel = " |...on $typeName|";
      }

      sb.writeln("  $parentId -->$edgeLabel $nodeId");
    }

    // Store fragment definition IDs for linking
    if (node is FragmentDefinitionNode) {
      fragmentIds[node.name.value] = nodeId;
    }

    // Recursively process children
    if (node is DocumentNode) {
      for (var def in node.definitions) {
        buildDiagram(def, nodeId, "$path/doc");
      }
    } else if (node is OperationDefinitionNode) {
      final newPath = "$path/${node.name?.value ?? node.type.toString()}";

      // Process variables
      for (var varDef in node.variableDefinitions) {
        buildDiagram(varDef, nodeId, "$newPath/vars");
      }

      // Process selections
      buildDiagram(node.selectionSet, nodeId, newPath);
    } else if (node is SelectionSetNode) {
      for (var selection in node.selections) {
        buildDiagram(selection, nodeId, "$path/selections");
      }
    } else if (node is FieldNode) {
      final fieldName = node.alias?.value ?? node.name.value;

      // Process arguments if any
      for (var arg in node.arguments) {
        buildDiagram(arg, nodeId, "$path/$fieldName/args");
      }

      // Process nested selections
      if (node.selectionSet != null) {
        buildDiagram(node.selectionSet!, nodeId, "$path/$fieldName");
      }
    } else if (node is InlineFragmentNode) {
      final typeName = node.typeCondition?.on.name.value ?? "unknown";
      buildDiagram(node.selectionSet, nodeId, "$path/...on$typeName");
    } else if (node is FragmentDefinitionNode) {
      buildDiagram(
          node.selectionSet, nodeId, "$path/fragment${node.name.value}");
    }
  }

  // Start the diagram with the root node
  buildDiagram(node, "");

  // Add dashed links between fragment spreads and their definitions
  fragmentLinks.forEach((fragmentName, spreadIds) {
    final definitionId = fragmentIds[fragmentName];
    if (definitionId != null) {
      for (var spreadId in spreadIds) {
        sb.writeln("  $spreadId -.-> $definitionId");
      }
    }
  });

  // Add class definitions
  sb.writeln("");
  sb.writeln(
      "  classDef operation fill:#e1f5fe,stroke:#01579b,color:#01579b,stroke-width:1px");
  sb.writeln(
      "  classDef fragment fill:#fff8e1,stroke:#ff8f00,color:#ff8f00,stroke-width:1px");
  sb.writeln(
      "  classDef fragmentSpread fill:#ffe0b2,stroke:#ef6c00,color:#ef6c00,stroke-width:1px");
  sb.writeln(
      "  classDef inlineFragment fill:#fff3e0,stroke:#e65100,color:#e65100,stroke-width:1px");
  sb.writeln(
      "  classDef field fill:#e8f5e9,stroke:#2e7d32,color:#2e7d32,stroke-width:1px");
  sb.writeln(
      "  classDef selectionSet fill:#f5f5f5,stroke:#616161,color:#616161,stroke-width:1px");
  sb.writeln(
      "  classDef variable fill:#e3f2fd,stroke:#0277bd,color:#0277bd,stroke-width:1px");
  sb.writeln(
      "  classDef argument fill:#f3e5f5,stroke:#7b1fa2,color:#7b1fa2,stroke-width:1px");

  return sb.toString();
}

/// Helper function to create a descriptive label for a node
String nodeTypeLabel(Node node) {
  if (node is OperationDefinitionNode) {
    String result = "Operation: ${node.type}";
    if (node.name != null) {
      result += " (${node.name!.value})";
    }
    return result;
  } else if (node is FieldNode) {
    String result = "Field: ${node.name.value}";
    if (node.alias != null) {
      result += " (as ${node.alias!.value})";
    }
    return result;
  } else if (node is FragmentDefinitionNode) {
    return "Fragment: ${node.name.value} on ${node.typeCondition.on.name.value}";
  } else if (node is InlineFragmentNode) {
    if (node.typeCondition != null) {
      return "Inline Fragment on ${node.typeCondition!.on.name.value}";
    } else {
      return "Inline Fragment";
    }
  } else if (node is FragmentSpreadNode) {
    return "...${node.name.value}";
  } else if (node is SelectionSetNode) {
    return "SelectionSet (${node.selections.length})";
  } else if (node is VariableDefinitionNode) {
    return "Variable: ${node.variable.name.value} Type: ${visualizeTypeNode(node.type)}";
  } else if (node is ArgumentNode) {
    return "Arg: ${node.name.value} = ${visualizeValueNode(node.value)}";
  }

  return node.runtimeType.toString();
}

/// Helper function to determine the CSS class for a node type
String nodeTypeCssClass(Node node) {
  if (node is OperationDefinitionNode) {
    return "operation";
  } else if (node is FragmentDefinitionNode) {
    return "fragment";
  } else if (node is FieldNode) {
    return "field";
  } else if (node is FragmentSpreadNode) {
    return "fragmentSpread";
  } else if (node is InlineFragmentNode) {
    return "inlineFragment";
  } else if (node is SelectionSetNode) {
    return "selectionSet";
  } else if (node is VariableDefinitionNode) {
    return "variable";
  } else if (node is ArgumentNode) {
    return "argument";
  }

  return "default";
}

/// Save the Mermaid diagram to a file
void saveMermaidDiagram(String diagram, String filePath) {
  final file = File(filePath);
  file.writeAsStringSync(diagram);

  print("Mermaid diagram saved to: $filePath");
}

/// Save the Mermaid diagram to a Markdown file for rendering
void saveMermaidMarkdown(String diagram, String filePath) {
  final file = File(filePath);

  final content = '''
# GraphQL AST Visualization

```mermaid
${diagram}
```
''';

  file.writeAsStringSync(content);

  print("Mermaid diagram saved as Markdown to: $filePath");
}

/// Analyze and visualize a GraphQL AST, outputting both text and Mermaid diagram
void analyzeGraphQL(Node ast,
    {String? textOutputPath,
    String? diagramOutputPath,
    String? markdownOutputPath}) {
  // Generate the text visualization
  final textVisualization = visualizeAST(ast);

  // Output to console if no file path specified
  print("\n=== GraphQL AST Visualization ===\n");
  print(textVisualization);

  // Save to file if path specified
  if (textOutputPath != null) {
    File(textOutputPath).writeAsStringSync(textVisualization);
    print("\nText visualization saved to: $textOutputPath");
  }

  // Generate the Mermaid diagram
  final mermaidDiagram = generateMermaidDiagram(ast);

  // Save raw diagram to file if path specified
  if (diagramOutputPath != null) {
    saveMermaidDiagram(mermaidDiagram, diagramOutputPath);
  }

  // Save markdown-formatted diagram if path specified
  if (markdownOutputPath != null) {
    saveMermaidMarkdown(mermaidDiagram, markdownOutputPath);
  }
}

/// Example usage:
/// 
/// ```dart
/// import 'package:gql/language.dart';
/// 
/// void main() {
///   final document = parseString('''
///     query HeroQuery {
///       hero {
///         name
///         friends {
///           name
///         }
///       }
///     }
///   ''');
///   
///   analyzeGraphQL(
///     document,
///     textOutputPath: 'query_ast.txt',
///     diagramOutputPath: 'query_ast.mmd',
///     markdownOutputPath: 'query_ast.md'
///   );
/// }
/// ```