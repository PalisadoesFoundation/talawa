# Overview for `SnippetDartdocParser`

## Description

Parses [CodeSample]s from the source file given to one of the parsing routines.

 - [parseFromDartdocToolFile] parses the output of the dartdoc `@tool`
   directive, which contains the dartdoc comment lines (with comment markers
   stripped) contained between the tool markers.

 - [parseAndAddAssumptions] parses the assumptions in the "Examples can
   assume:" block at the top of the file and adds them to the code samples
   contained in the given [SourceElement] iterable.

## Members

- **filesystem**: `FileSystem`
- **_dartDocPrefix**: `String`
  The prefix of each comment line

- **_dartDocPrefixWithSpace**: `String`
  The prefix of each comment line with a space appended.

- **_dartDocSampleBeginRegex**: `RegExp`
  A RegExp that matches the beginning of a dartdoc snippet or sample.

- **_dartDocSampleEndRegex**: `RegExp`
  A RegExp that matches the end of a dartdoc snippet or sample.

- **_codeBlockStartRegex**: `RegExp`
  A RegExp that matches the start of a code block within dartdoc.

- **_codeBlockEndRegex**: `RegExp`
  A RegExp that matches the end of a code block within dartdoc.

- **_filePointerRegex**: `RegExp`
  A RegExp that matches a linked sample pointer.

## Constructors

### Unnamed Constructor


