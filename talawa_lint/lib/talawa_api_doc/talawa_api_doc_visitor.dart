import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:talawa_lint/helpers.dart';

class TalawaApiDocVisitor extends SimpleAstVisitor {
  TalawaApiDocVisitor(
    this.rule,
    this.context,
    this.reporter,
  );

  final LintRule rule;
  final CustomLintContext context;
  final ErrorReporter reporter;

  bool check(Declaration node) {
    // if (node.documentationComment == null && !isOverridingMember(node)) {
    // If the class extends [State], we don't want documentation
    // for it
    final extendsState = (node is ClassDeclaration) &&
        node.extendsClause?.superclass.name.name == "State";

    if (node.documentationComment == null &&
        !isOverridingMember(node) &&
        !extendsState) {
      final errorNode = getNodeToAnnotate(node);

      reporter.reportErrorForOffset(
        rule.code,
        errorNode.offset,
        errorNode.length,
      );

      return true;
    }

    return false;
  }

  @override
  void visitClassDeclaration(ClassDeclaration node) {
    _visitMembers(node, node.name, node.members);
  }

  @override
  void visitClassTypeAlias(ClassTypeAlias node) {
    check(node);
  }

  @override
  void visitCompilationUnit(CompilationUnit node) {
    final getters = <String, FunctionDeclaration>{};
    final setters = <FunctionDeclaration>[];

    // Check functions.

    // Non-getters/setters.
    final functions = <FunctionDeclaration>[];

    // Identify getter/setter pairs.
    for (final member in node.declarations) {
      if (member is FunctionDeclaration) {
        final name = member.name;
        if (!isPrivate(name) && name.lexeme != 'main') {
          if (member.isGetter) {
            getters[member.name.lexeme] = member;
          } else if (member.isSetter) {
            setters.add(member);
          } else {
            functions.add(member);
          }
        }
      }
    }

    // Check all getters, and collect offenders along the way.
    final missingDocs = <FunctionDeclaration>{};
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

    // Check remaining functions.
    functions.forEach(check);

    super.visitCompilationUnit(node);
  }

  @override
  void visitConstructorDeclaration(ConstructorDeclaration node) {
    // if (!inPrivateMember(node) && !isPrivate(node.name)) {
    //   check(node);
    // }
  }

  @override
  void visitEnumConstantDeclaration(EnumConstantDeclaration node) {
    check(node);
  }

  @override
  void visitEnumDeclaration(EnumDeclaration node) {
    check(node);
    checkMethods(check, node.members, reporter, rule);
  }

  @override
  void visitExtensionDeclaration(ExtensionDeclaration node) {
    // if (node.name == null || isPrivate(node.name)) {
    if (node.name == null) {
      return;
    }

    check(node);
    checkMethods(check, node.members, reporter, rule);
  }

  @override
  void visitFieldDeclaration(FieldDeclaration node) {
    for (final field in node.fields.variables) {
      if (!isPrivate(field.name)) {
        check(field);
      }
    }
  }

  @override
  void visitFunctionTypeAlias(FunctionTypeAlias node) {
    check(node);
  }

  @override
  void visitGenericTypeAlias(GenericTypeAlias node) {
    check(node);
  }

  @override
  void visitMixinDeclaration(MixinDeclaration node) {
    _visitMembers(node, node.name, node.members);
  }

  @override
  void visitTopLevelVariableDeclaration(TopLevelVariableDeclaration node) {
    for (final decl in node.variables.variables) {
      check(decl);
    }
  }

  void _visitMembers(Declaration node, Token name, List<ClassMember> members) {
    check(node);
    checkMethods(check, members, reporter, rule);
  }
}
