# Overview for `LicenseParagraph`

## Description

A string that represents one paragraph in a [LicenseEntry].

 See [LicenseEntry.paragraphs].

## Members

- **text**: `String`
  The text of the paragraph. Should not have any leading or trailing whitespace.

- **indent**: `int`
  How many steps of indentation the paragraph has.

 * 0 means the paragraph is not indented.
 * 1 means the paragraph is indented one unit of indentation.
 * 2 means the paragraph is indented two units of indentation.

 ...and so forth.

 In addition, the special value [centeredIndent] can be used to indicate
 that rather than being indented, the paragraph is centered.

- **centeredIndent**: `int`
  A constant that represents "centered" alignment for [indent].

## Constructors

### Unnamed Constructor
Creates a string for a license entry paragraph.

