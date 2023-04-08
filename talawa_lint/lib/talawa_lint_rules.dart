import 'package:custom_lint_builder/custom_lint_builder.dart';

class TalawaAPIDocLintRules {}

class TalawaGoodDocLintRules {
  static const firstLineEndCode = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage:
        "First line of the documentation doesn't end with end punctuation.",
    correctionMessage: "End first line of documentation with '.', '!' etc",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  static const secondLineEmptyCode = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Second line of the doc is not empty.',
    correctionMessage:
        "Second line should be left empty to improve readability",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  static const includeParamsKeywordCode = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'params block not found in the documentation.',
    correctionMessage: "Include `**params**:` keyword in function/method doc",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  static const noParamNone = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage: "Empty param list should be documented as `///   None`",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  static const startShouldFollowParam = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: '* should follow a param name',
    correctionMessage: "Make sure you have added a param name after *, and it\n"
        "is in the same order as it appears in the function",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  static const emptyParamDoc = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'No documentation is written for this parameter',
    correctionMessage: "Param name should follow its documentation",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  static const allParamsNotDocumented = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Some parameters are missing documentation',
    correctionMessage: "Please make sure that you have documented all\n"
        "of the parameters in the same order as they appear in the function.",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  static const noBlankLineBWParamAndReturn = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage: "Add a blank line between the end of 'params:' block\n"
        "and start of 'returns:' block.",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  static const doesNotContainReturn = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage:
        "Documentation does not contain information about the return type.\n"
        "Add '**returns**:' block followed by the return doc.",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  static const wrongReturnsDoc = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage:
        "Documentation format of return type is in wrong format.\n"
        "For void type - \n"
        "/// **returns**: \n///   None\n"
        "For other types - \n"
        "/// **returns**: \n"
        "/// * `return_type`: documentation of the return type.",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  static const noReturnDoc = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage:
        "'**returns**:' should immediately be followed by documentation about\n"
        "the return type",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );

  static const noEndWithNoneForVoid = LintCode(
    name: 'talawa_good_doc_comments',
    problemMessage: 'Wrong doc format.',
    correctionMessage:
        "A function/method with [void] return type must end with\n"
        "`///   None`\n"
        "without extra lines.",
    url: "https://docs.talawa.io/docs/developers/talawa/talawa-lint/",
  );
}
