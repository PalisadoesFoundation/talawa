# Method: `getByName`

## Description

Returns an [Encoding] for a named character set.

 The names used are the IANA official names for the character set (see
 [IANA character sets][]). The names are case insensitive.

 [IANA character sets]: http://www.iana.org/assignments/character-sets/character-sets.xml

 If character set is not supported `null` is returned.

## Return Type
`Encoding?`

## Parameters

- `name`: `String?`
