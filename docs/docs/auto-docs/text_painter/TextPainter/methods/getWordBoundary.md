# Method: `getWordBoundary`

## Description


 Returns the text range of the word at the given offset. Characters not
 part of a word, such as spaces, symbols, and punctuation, have word breaks
 on both sides. In such cases, this method will return a text range that
 contains the given text position.

 Word boundaries are defined more precisely in Unicode Standard Annex #29
 <http://www.unicode.org/reports/tr29/#Word_Boundaries>.
 

## Return Type
`TextRange`

## Parameters

- `position`: `TextPosition`
