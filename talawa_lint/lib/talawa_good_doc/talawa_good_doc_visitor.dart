// ignore_for_file: implementation_imports

import 'package:_fe_analyzer_shared/src/scanner/token.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:talawa_lint/helpers.dart';
import 'package:talawa_lint/talawa_lint_rules.dart';

class TalawaGoodDocVisitor extends SimpleAstVisitor {
  TalawaGoodDocVisitor(
    this.rule,
    this.context,
    this.reporter,
  );

  final LintRule rule;
  final CustomLintContext context;
  final ErrorReporter reporter;

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
    check(node);
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

  bool check(Declaration node) {
    if (node.documentationComment == null) {
      return false;
    }

    final doc = node.documentationComment!.tokens;
    if (!doc[0].lexeme.endsWith('.')) {
      reporter.reportErrorForToken(
        TalawaGoodDocLintRules.firstLineEndCode,
        doc[0],
      );
    }

    // Don't check for [setters] and [getters]
    // TODO: Fix this completely
    if (node is MethodDeclaration && (node.isGetter || node.isSetter)) {
      return true;
    }

    if (doc.length == 1) {
      if (node is FunctionDeclaration || node is MethodDeclaration) {
        reporter.reportErrorForNode(
          TalawaGoodDocLintRules.includeParamsKeywordCode,
          node.documentationComment!,
        );

        return false;
      } else {
        return true;
      }
    }

    // NOTE: The reason why we are checking for both '///' and '///<a lot of spaces>'
    // is because -
    //
    // 1. The extra space is automatically inserted whenever
    //    you hit 'enter' when on a line in documentation.
    // 2. Flutter will automatically format and remove the extra
    //    space at the end when formatted

    if (doc[1].lexeme.trim() != '///') {
      reporter.reportErrorForToken(
        TalawaGoodDocLintRules.secondLineEmptyCode,
        doc[1],
      );
    }

    if (node is FunctionDeclaration || node is MethodDeclaration) {
      if (checkContainsParams(doc, node)) {
        checkContainsReturn(doc, node);
      }
    }

    return true;
  }

  bool checkContainsParams(List<Token> doc, Declaration rawNode) {
    final node =
        rawNode is FunctionDeclaration ? rawNode : rawNode as MethodDeclaration;

    final params = rawNode is FunctionDeclaration
        ? (node as FunctionDeclaration).functionExpression.parameters
        : (node as MethodDeclaration).parameters;

    // If params is null or it is just '()'
    // if (params == null || params.length == 2) {
    //   return;
    // }

    bool containsParamsKeyword = false;

    // The line in the doc we are currently parsing
    int currentDocLine = 0;

    for (; currentDocLine < doc.length; currentDocLine++) {
      final line = doc[currentDocLine];
      if (line.lexeme == '/// **params**:') {
        containsParamsKeyword = true;
        currentDocLine++;
        break;
      }
    }

    if (!containsParamsKeyword) {
      reporter.reportErrorForNode(
        TalawaGoodDocLintRules.includeParamsKeywordCode,
        node.documentationComment!,
      );

      return false;
    }

    final paramList = params?.parameterElements ?? [];

    if (paramList.isEmpty) {
      if (currentDocLine == doc.length) {
        return false;
      } else if (doc[currentDocLine].lexeme != "///   None") {
        reporter.reportErrorForToken(
          TalawaGoodDocLintRules.noParamNone,
          doc[currentDocLine],
        );
        return false;
      }

      return true;
    }

    // The currentParam we are checking for
    int currentParam = 0;

    for (; currentDocLine < doc.length; currentDocLine++) {
      final line = doc[currentDocLine];

      // If the line starts with '/// *', it must contain a param
      if (line.length > 4 && line.lexeme[4] == '*') {
        final paramRegex = RegExp(
          '/// * `${paramList[currentParam]?.name}`:',
        );

        // TODO: RegExp.hasMatch() doesn't work for some reason.
        if (!line.lexeme.startsWith(paramRegex.pattern)) {
          reporter.reportErrorForToken(
            TalawaGoodDocLintRules.startShouldFollowParam,
            line,
          );

          return false;
        } else {
          if (line.lexeme.trim() == paramRegex.pattern) {
            reporter.reportErrorForToken(
              TalawaGoodDocLintRules.emptyParamDoc,
              line,
            );

            return false;
          } else {
            currentParam++;
          }
        }
      }

      if (currentParam == paramList.length) break;
    }

    if (currentParam != paramList.length) {
      reporter.reportErrorForNode(
        TalawaGoodDocLintRules.allParamsNotDocumented,
        node,
      );
    }

    return true;
  }

  void checkContainsReturn(
    List<Token> doc,
    Declaration rawNode,
  ) {
    // Let the implicit_return_type warning be fixed first

    if (TalawaLintHelpers.isImplicitReturn(rawNode)) return;

    int currentDocLine = 0;
    bool containsReturn = false;

    final node =
        rawNode is FunctionDeclaration ? rawNode : rawNode as MethodDeclaration;

    for (; currentDocLine < doc.length; currentDocLine++) {
      if (doc[currentDocLine].lexeme.trim() == '/// **returns**:') {
        containsReturn = true;
        break;
      }
    }

    final isVoid = TalawaLintHelpers.isVoid(node);

    if (!containsReturn) {
      reporter.reportErrorForNode(
        TalawaGoodDocLintRules.doesNotContainReturn,
        node.documentationComment!,
      );

      return;
    }

    // Check if there is atleast one blank line above

    if (doc[currentDocLine - 1].lexeme.trim() != '///') {
      reporter.reportErrorForNode(
        TalawaGoodDocLintRules.noBlankLineBWParamAndReturn,
        node.documentationComment!,
      );

      return;
    }

    // Uncomment below line if returns block is made optional for
    // void types someday :)

    // if (isVoid && currentDocLine == doc.length) return;

    if (doc[currentDocLine].lexeme.trim() != '/// **returns**:') {
      reporter.reportErrorForNode(
        TalawaGoodDocLintRules.wrongReturnsDoc,
        node.documentationComment!,
      );

      return;
    }

    // Moving onto next lines and checking if documentation about
    // the return type is found.
    currentDocLine++;

    if (currentDocLine == doc.length) {
      reporter.reportErrorForNode(
        TalawaGoodDocLintRules.noReturnDoc,
        node.documentationComment!,
      );

      return;
    }

    // Moving ahead to find a line that contains information about the
    // return type
    currentDocLine++;

    // If return type is [void] and doc doesn't end with [None] or
    // there are more lines to the doc
    if (isVoid &&
        (doc[currentDocLine - 1].lexeme != '///   None' ||
            currentDocLine != doc.length)) {
      reporter.reportErrorForNode(
        TalawaGoodDocLintRules.noEndWithNoneForVoid,
        node.documentationComment!,
      );

      return;
    }

    final returnType = TalawaLintHelpers.returnType(node);

    // If return type is not [void] and doc doesn't end with [return_type] or
    // there are more lines to the doc
    final returnTypeDocPattern = RegExp(
      '/// * `$returnType`:',
    );

    if (!isVoid &&
        !doc[currentDocLine - 1].lexeme.startsWith(
              returnTypeDocPattern.pattern,
            )) {
      reporter.reportErrorForNode(
        TalawaGoodDocLintRules.wrongReturnsDoc,
        node.documentationComment!,
      );

      return;
    }
  }

  void _visitMembers(Declaration node, Token name, List<ClassMember> members) {
    check(node);
    checkMethods(check, members, reporter, rule);
  }
}
