# Overview for `SnippetGenerator`

## Description

Generates the snippet HTML, as well as saving the output snippet main to
 the output directory.

## Members

- **flutterRoot**: `Directory`
- **configuration**: `SnippetConfiguration`
  The configuration used to determine where to get/save data for the
 snippet.

- **jsonEncoder**: `JsonEncoder`
- **_constructorRegExp**: `RegExp`
  A RegExp that matches a Dart constructor.

- **_expressionId**: `int`
  A serial number so that we can create unique expression names when we
 generate them.

- **_headers**: `List&lt;SourceLine&gt;?`
## Constructors

### Unnamed Constructor


