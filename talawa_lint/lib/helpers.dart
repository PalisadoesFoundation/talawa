import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/syntactic_entity.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

SyntacticEntity? _getNodeToAnnotate(Declaration node) {
  if (node is MethodDeclaration) {
    return node.name;
  }
  if (node is ConstructorDeclaration) {
    return node.name;
  }
  if (node is FieldDeclaration) {
    return node.fields;
  }
  if (node is ClassTypeAlias) {
    return node.name;
  }
  if (node is FunctionTypeAlias) {
    return node.name;
  }
  if (node is ClassDeclaration) {
    return node.name;
  }
  if (node is EnumDeclaration) {
    return node.name;
  }
  if (node is ExtensionDeclaration) {
    return node.name;
  }
  if (node is FunctionDeclaration) {
    return node.name;
  }
  if (node is TopLevelVariableDeclaration) {
    return node.variables;
  }
  if (node is EnumConstantDeclaration) {
    return node.name;
  }
  if (node is TypeParameter) {
    return node.name;
  }
  if (node is VariableDeclaration) {
    return node.name;
  }
  return null;
}

/// Returns the most specific AST node appropriate for associating errors.
SyntacticEntity getNodeToAnnotate(Declaration node) {
  final mostSpecific = _getNodeToAnnotate(node);
  return mostSpecific ?? node;
}

Element? getOverriddenMember(Element? member) {
  if (member == null) {
    return null;
  }

  return member.hasOverride ? member : null;
  // final interfaceElement = member.thisOrAncestorOfType<InterfaceElement>();
  // if (interfaceElement == null) {
  //   return null;
  // }
  // final name = member.name;
  // if (name == null) {
  //   return null;
  // }

  // final libraryUri = interfaceElement.library.source.uri;
  // return context.inheritanceManager.getInherited(
  //   interfaceElement.thisType,
  //   Name(libraryUri, name),
  // );
}

bool isOverridingMember(Declaration node) =>
    getOverriddenMember(node.declaredElement) != null;

void checkMethods(
  bool Function(Declaration) check,
  List<ClassMember> members,
  ErrorReporter reporter,
  LintRule rule,
) {
  // Check methods

  final getters = <String, MethodDeclaration>{};
  final setters = <MethodDeclaration>[];

  // Non-getters/setters.
  final methods = <MethodDeclaration>[];

  // Identify getter/setter pairs.
  for (final member in members) {
    // if (member is MethodDeclaration && !isPrivate(member.name)) {
    if (member is MethodDeclaration) {
      // print(member.parameters);
      if (member.isGetter) {
        getters[member.name.lexeme] = member;
      } else if (member.isSetter) {
        setters.add(member);
      } else {
        methods.add(member);
      }
    }
  }

  // Check all getters, and collect offenders along the way.
  final missingDocs = <MethodDeclaration>{};
  for (final getter in getters.values) {
    if (check(getter)) {
      missingDocs.add(getter);
    }
  }

  // But only setters whose getter is missing a doc.
  for (final setter in setters) {
    final getter = getters[setter.name.lexeme];
    if (getter != null && missingDocs.contains(getter)) {
      check(setter);
    }
  }

  // Check remaining methods.
  methods.forEach(check);
}

/// Returns `true` if the given [id] is a Dart keyword.
bool isKeyWord(String id) => Keyword.keywords.containsKey(id);

/// Returns `true` if the given [ClassMember] is a method.
bool isMethod(ClassMember m) => m is MethodDeclaration;

/// Check if the given identifier has a private name.
bool isPrivate(Token? name) =>
    // ignore: avoid_bool_literals_in_conditional_expressions
    name != null ? Identifier.isPrivateName(name.lexeme) : false;

class TalawaLintHelpers {
  static bool isVoid(Declaration node) {
    return ((node is FunctionDeclaration)
            ? node.returnType?.type!.isVoid
            : (node as MethodDeclaration).returnType?.type!.isVoid) ??
        true;
  }

  static bool isImplicitReturn(Declaration node) {
    return ((node is FunctionDeclaration)
            ? node.declaredElement?.hasImplicitReturnType
            : (node as MethodDeclaration)
                .declaredElement
                ?.hasImplicitReturnType) ??
        false;
  }

  static DartType? returnType(Declaration node) {
    return (node is FunctionDeclaration)
        ? node.returnType?.type
        : (node as MethodDeclaration).returnType?.type;
  }
}
