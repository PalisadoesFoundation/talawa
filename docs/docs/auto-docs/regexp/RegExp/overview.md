# Overview for `RegExp`

## Description

A regular expression pattern.

 Regular expressions (abbreviated as regex or regexp)
 consist of a sequence of characters that specify
 a match-checking algorithm for text _inputs_.
 Applying a regexp to an input text results either in the regexp matching,
 or accepting, the text, or the text being rejected.
 When the regexp matches the text, it further provides some information
 about *how* it matched the text.

 Dart regular expressions have the same syntax and semantics as
 JavaScript regular expressions.
 To learn more about JavaScript regular expressions, see
 <https://ecma-international.org/ecma-262/9.0/#sec-regexp-regular-expression-objects>.

 Dart provides the basic regexp matching algorithm as [matchAsPrefix],
 which checks if the regexp matches a part of the input starting
 at a specific position.
 If the regexp matches, Dart returns the details of the match as a
 [RegExpMatch].

 You can build all the other methods of [RegExp] from that basic match
 check.

 The most common use of a regexp is to *search* for a match in the input.
 The [firstMatch] method provides this functionality.
 This method searches a string for the first position where the regexp
 matches.
 Again, if a match is found, Dart returns its details as a [RegExpMatch].

 The following example finds the first match of a regular expression in
 a string.
 ```dart
 RegExp exp = RegExp(r'(\w+)');
 String str = 'Parse my string';
 RegExpMatch? match = exp.firstMatch(str);
 print(match![0]); // "Parse"
 ```
 Use [allMatches] to look for all matches of a regular expression in
 a string.

 The following example finds all matches of a regular expression in
 a string.
 ```dart
 RegExp exp = RegExp(r'(\w+)');
 String str = 'Parse my string';
 Iterable&lt;RegExpMatch&gt; matches = exp.allMatches(str);
 for (final m in matches) 
 ```
 The output of the example is:
 ```
 Parse
 my
 string
 ```

 The preceding examples use a _raw string_,
 a specific string type that prefixes the string literal with `r`.
 Use a raw string to treat each character, including `\` and `$`,
 in a string as a literal character. Each character then gets passed
 to the [RegExp] parser.
 You should use a raw string as the argument to the
 [RegExp] constructor.

 **Performance Notice**: Regular expressions do not resolve issues
 magically.
 Anyone can write a regexp that performs inefficiently when
 applied to some string inputs.
 Often, such a regexp will perform well enough on small or common
 inputs, but have pathological performance on large and uncommon inputs.
 This inconsistent behavior makes performance issues harder to detect
 in testing.

 A regexp might not find text any faster than using `String` operations
 to inspect a string.
 The strength of regexp comes from the ability to specify
 *somewhat* complicated patterns in very few characters.
 These regexps provide reasonable efficiency in most common cases.
 This conciseness comes at a cost of readability.
 Due to their syntactic complexity, regexes cannot be considered
 self documenting.

 Dart regexps implement the ECMAScript RegExp specification.
 This specification provides a both common and well-known regexp behavior.
 When compiling Dart for the web, the compiled code can use the browser’s
 regexp implementation.

 The specification defines ECMAScript regexp behavior using *backtracking*.
 When a regexp can choose between different ways to match,
 it tries each way in the order given in the pattern.
 For example: `RegExp(r"(foo|bar)baz")` wants to check for `foo` or `bar`,
 so it checks for `foo` first.
 If continuing along that path doesn't match the input,
 the regexp implementation *backtracks*.
 The implementation resets to the original state from before
 checking for `foo`,
 forgetting all the work it has done after that,
 and then tries the next choice; `bar` in this example.

 The specification defines these choices
 and the order in which they must be attempted.
 If a regexp could match an input in more than one way,
 the order of the choices decides which match the regexp returns.
 Commonly used regexps order their matching choices to ensure
 a specific result.
 The ECMAScript regexp specification limits how Dart
 can implement regular expressions.
 It must be a backtracking implementation which checks choices in
 a specific order.
 Dart cannot choose a different regexp implementation,
 because then regexp matching would behave differently.

 The backtracking approach works, but at a cost.
 For some regexps and some inputs,
 finding a *correct* match can take a *lot* of tries.
 It can take even more tries to reject an input
 that the regexp *almost* matches.

 A well-known dangerous regexp pattern comes from
 nesting quantifiers like `*`:

 ```dart
 var re = RegExp(r"^(a*|b)*c");
 print(re.hasMatch("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa"));
 ```

 The regexp pattern doesn't match the input string of only `a`s
 as the input doesn’t contain the required `c`.
 There exists an _exponential_ number of different ways for `(a*|b)*`
 to match all the `a`s.
 The backtracking regexp implementation tries *all* of them
 before deciding that none of those can lead to a complete match.
 Each extra `a` added to the input doubles the time the regexp
 takes to return `false`.
 (When backtracking has this exponential potential, it is called
 [“catastrophic backtracking”](https://www.google.com/search?q=regexp+catastrophic+backtracking)).

 Sequential quantifiers provide another dangerous pattern,
 but they provide “only” polynomial complexity.

 ```dart
 // Like `\w*-\d`, but check for `b` and `c` in that order.
 var re = RegExp(r"^\w*(b)?\w*(c)?\w*-\d");
 print(re.hasMatch("a" * 512));
 ```

 Again the input doesn’t match, but `RegExp` must try *n*<sup>3</sup> ways
 to match the *n* `a`s _before_ deciding that.
 Doubling the input’s length increases the time to return `false`
 _eightfold_.
 This exponent increases with the number of sequential quantifiers.

 Both of these patterns look trivial when reduced to such simple regexps.
 However, these "trivial" patterns often arise as parts of
 more complicated regular expressions,
 where your ability to find the problem gets more difficult.

 In general, if a regexp has potential for *super-linear complexity*,
 you can craft an input that takes an inordinate amount of time to search.
 These patterns can then be used for [denial of service attacks](https://en.wikipedia.org/wiki/ReDoS)
 if you apply vulnerable regexp patterns to user-provided inputs.

 No guaranteed solution exists for this problem.
 Be careful to not use regexps with super-linear behavior
 where the program may match that regexp against inputs
 with no guaranteed match.

 Rules of thumb to avoid regexps with super-linear execution time include:

 * Whenever the regexp has a choice, try to make sure
   that the choice can be made based on the next character
   (or very limited look-ahead).
   This limits the need to perform a lot of computation along both choices.
 * When using quantifiers, ensure that the same string cannot match
   both one and more-than-one iteration of the quantifier's
   regular expression.
   (For `(a*|b)*`, the string `"aa"` can match both
  `(a*|b)` and `(a*|b)`.)
 * Most uses of Dart regular expressions *search* for a match,
   for example using [firstMatch].
   If you do not *anchor* the pattern
   to the start of a line or input using `^`,
   this search acts as if the regexp began with an implicit `[^]*`.
   Starting your actual regular expression with `.*`
   then results in potential quadratic behavior for the search.
   Use anchors or [matchAsPrefix] where appropriate,
   or avoid starting the regexp with a quantified pattern.
 * *For experts only:* Neither Dart nor ECMAScript have general
   [“atomic grouping”](https://github.com/tc39/proposal-regexp-atomic-operators).
   Other regular expression dialects use this to limit backtracking.
   If an atomic capture group succeeds once,
   the regexp cannot backtrack into the same match later.
   As lookarounds also serve as atomic groups,
   something similar can be achieved using a *lookahead*:
   `var re = RegExp(r"^(?=((a*|b)*))\1d");`
   The preceding example does the same inefficient matching of `(a*|b)*`.
   Once the regexp has matched as far as possible,
   it completes the positive lookahead.
   Then it skips what the lookahead matched using a back-reference.
   After that, it can no longer backtrack
   and try other combinations of `a`s.

 Try to reduce how many ways the regexp can match the same string.
 That reduces the number of possible backtracks performed
 when the regexp does not find a match.
 Several guides to [improving the performance of regular expressions](https://www.google.com/search?q=performance+of+regular+expressions)
 exist on the internet. Use these as inspirations, too.

## Dependencies

- Pattern

## Constructors

### Unnamed Constructor
Constructs a regular expression.

 Throws a [FormatException] if [source] does not follow valid regular
 expression syntax.

 If your code enables `multiLine`, then `^` and `$` will match
 the beginning and end of a _line_, as well as matching beginning and
 end of the input, respectively.

 If your code disables `caseSensitive`,
 then Dart ignores the case of letters when matching.
 For example, with `caseSensitive` disable, the regexp pattern `a`
 matches both `a` and `A`.

 If your code enables `unicode`, then Dart treats the pattern as a
 Unicode pattern per the ECMAScript standard.

 If your code enables `dotAll`, then the `.` pattern will match _all_
 characters, including line terminators.

 Example:

 ```dart
 final wordPattern = RegExp(r'(\w+)');
 final digitPattern = RegExp(r'(\d+)');
 ```

 These examples use a _raw string_ as the argument.
 You should prefer to use a raw string as argument to the [RegExp]
 constructor, because it makes it easy to write
 the `\` and `$` characters as regexp reserved characters.

 The same examples written using non-raw strings would be:
 ```dart
 final wordPattern = RegExp('(\\w+)'); // Should be raw string.
 final digitPattern = RegExp('(\\d+)'); // Should be raw string.
 ```
 Use a non-raw string only when you need to use
 string interpolation. For example:
 ```dart
 Pattern keyValuePattern(String keyIdentifier) =>
     RegExp('$keyIdentifier=(\\w+)');
 ```
 When including a string verbatim into the regexp pattern like this,
 be careful that the string does not contain regular expression
 reserved characters.
 If that risk exists, use the [escape] function to convert those
 characters to safe versions of the reserved characters
 and match only the string itself:
 ```dart
 Pattern keyValuePattern(String anyStringKey) =>
     RegExp('$=(\\w+)');
 ```

