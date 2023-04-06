import 'package:custom_lint_builder/custom_lint_builder.dart';

class TalawaAPIDocLintRules {}

class TalawaGoodDocLintRules {
  static const firstLineEndCode = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage: "End first line of documentation with '.', '!' etc",
  );

  static const secondLineEmptyCode = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage:
        "Second line should be left empty to improve readability",
  );

  static const includeParamsKeywordCode = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage: "Include `**params**:` keyword in function/method doc",
  );

  static const noParamNone = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage: "Empty param list should be documented as `///   None`",
  );

  static const startShouldFollowParam = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage: "* should follow a param name",
  );

  static const emptyParamDoc = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage: "Param name should follow its documentation",
  );

  static const allParamsNotDocumented = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage: "Some parameters are missing documentation",
  );

  static const noBlankLineBWParamAndReturn = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage: "Add a blank line between the end of 'params:' block\n"
        "and start of 'returns:' block.",
  );

  static const doesNotContainReturn = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage:
        "Documentation does not contain information about the return type,\n"
        "even though it is not `void`\n"
        "Add '**returns**:' block followed by the return doc.",
  );

  static const wrongReturnsDoc = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage:
        "Documentation format of return type is in wrong format.\n"
        "For void type - '/// **returns**: \n///   None'\n"
        "For other types - '/// **returns**:' followed by types in new lines",
  );

  static const noReturnDoc = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage:
        "'**returns**:' should immediately be followed by documentation about\n"
        "the return type",
  );

  static const noEndWithNoneForVoid = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage:
        "A function/method with [void] return type must end with\n"
        "`///   None`\n"
        "without extra lines.",
  );
}
