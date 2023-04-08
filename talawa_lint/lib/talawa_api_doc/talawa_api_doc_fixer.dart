import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/source/source_range.dart';
import 'package:analyzer_plugin/utilities/change_builder/change_builder_dart.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:talawa_lint/helpers.dart';

class TalawaAPIDocFixer extends DartFix {
  @override
  void run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    AnalysisError analysisError,
    List<AnalysisError> others,
  ) {
    context.registry.addVariableDeclaration(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addClassDeclaration(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addClassTypeAlias(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addConstructorDeclaration(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addEnumConstantDeclaration(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addEnumDeclaration(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addExtensionDeclaration(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addFieldDeclaration(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addFunctionDeclaration(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addMethodDeclaration(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addFunctionTypeAlias(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addGenericTypeAlias(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addMixinDeclaration(
      (node) => fix(node, reporter, analysisError),
    );
    context.registry.addTopLevelVariableDeclaration(
      (node) => fix(node, reporter, analysisError),
    );
  }

  void fix(
    Declaration node,
    ChangeReporter reporter,
    AnalysisError analysisError,
  ) {
    // Verifying that the node and error offset match (collide)

    if (!analysisError.sourceRange.intersects(node.sourceRange)) return;

    // The [SourceRange] of the ClassDeclaration spans to the whole class
    // and will intersect with everything inside it. This is a problem, as the
    // error for it's fields will match to itself, and the fixes will be applied
    // to the wrong place.

    if (node is ClassDeclaration &&
        !analysisError.sourceRange.intersects(
          SourceRange(
            node.offset,
            node.leftBracket.offset - node.offset,
          ),
        )) return;

    // The same issue exists for Functions and Methods. We can define functions
    // inside functions, and the same overlap of [SourceRange] occurs due to that

    if (node is FunctionDeclaration &&
        !analysisError.sourceRange.intersects(
          SourceRange(
            node.offset,
            (node.functionExpression.parameters?.end ??
                    node.name.length + node.name.offset) -
                node.offset,
          ),
        )) return;

    if (node is MethodDeclaration &&
        !analysisError.sourceRange.intersects(
          SourceRange(
            node.offset,
            (node.parameters?.offset ?? node.name.length + node.name.offset) -
                node.offset,
          ),
        )) return;

    final changeBuilder = reporter.createChangeBuilder(
      message: 'Insert Doc skeleton',
      priority: 3,
    );

    changeBuilder.addDartFileEdit((builder) {
      builder.addInsertion(node.offset, (builder) {
        builder.write(
          "/// a_line_ending_with_end_punctuation.\n"
          "/// \n"
          "/// more_info_if_required\n",
        );

        if (node is FunctionDeclaration || node is MethodDeclaration) {
          fixFun(
            node,
            builder,
          );
        }
      });
    });
  }

  void fixFun(
    Declaration node,
    DartEditBuilder builder,
  ) {
    // Putting in these obvious checks because in the edge case when someone
    // mistakenly calls this function on non-function type entities, the linter
    // will simply crash without any plausible explanation.

    if (!(node is FunctionDeclaration || node is MethodDeclaration)) {
      return;
    }

    if (node is MethodDeclaration && (node.isGetter || node.isSetter)) {
      return;
    }

    final fnInfo = StringBuffer();

    fnInfo.write(
      "/// \n"
      "/// **params**:\n",
    );

    final paramList = (node is FunctionDeclaration)
        ? (node.functionExpression.parameters)?.parameters
        : (node as MethodDeclaration).parameters?.parameters;

    if (paramList == null || paramList.isEmpty) {
      fnInfo.write("///   None\n");
    } else {
      for (final param in paramList) {
        fnInfo.write("/// * `${param.name}`: define_the_param\n");
      }
    }

    fnInfo.write(
      "/// \n"
      "/// **returns**:\n",
    );

    final isImplicitReturn = TalawaLintHelpers.isImplicitReturn(node);
    final isVoid = TalawaLintHelpers.isVoid(node);

    final returnType = (node is FunctionDeclaration)
        ? node.returnType
        : (node as MethodDeclaration).returnType;

    if (isImplicitReturn || returnType == null) {
      fnInfo.write("/// * `undef`: type_the_return\n");
    } else if (isVoid) {
      fnInfo.write("///   None\n");
    } else {
      fnInfo.write("/// * `$returnType`: define_the_return\n");
    }

    builder.write(fnInfo.toString());
  }
}
