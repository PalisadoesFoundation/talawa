# Overview for `LicenseEntryWithLineBreaks`

## Description

Variant of [LicenseEntry] for licenses that separate paragraphs with blank
 lines and that hard-wrap text within paragraphs. Lines that begin with one
 or more space characters are also assumed to introduce new paragraphs,
 unless they start with the same number of spaces as the previous line, in
 which case it's assumed they are a continuation of an indented paragraph.

 

 For example, the BSD license in this format could be encoded as follows:

 ```dart
 void  
 ```
 

 This would result in a license with six [paragraphs], the third, fourth, and
 fifth being indented one level.

 ## Performance considerations

 Computing the paragraphs is relatively expensive. Doing the work for one
 license per frame is reasonable; doing more at the same time is ill-advised.
 Consider doing all the work at once using [compute] to move the work to
 another thread, or spreading the work across multiple frames using
 [SchedulerBinding.scheduleTask].

## Dependencies

- LicenseEntry

## Members

- **packages**: `List&lt;String&gt;`
- **text**: `String`
  The text of the license.

 The text will be split into paragraphs according to the following
 conventions:

 * Lines starting with a different number of space characters than the
   previous line start a new paragraph, with those spaces removed.
 * Blank lines start a new paragraph.
 * Other line breaks are replaced by a single space character.
 * Leading spaces on a line are removed.

 For each paragraph, the algorithm attempts (using some rough heuristics)
 to identify how indented the paragraph is, or whether it is centered.

## Constructors

### Unnamed Constructor
Create a license entry for a license whose text is hard-wrapped within
 paragraphs and has paragraph breaks denoted by blank lines or with
 indented text.

