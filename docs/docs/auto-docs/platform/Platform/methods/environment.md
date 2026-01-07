# Method: `environment`

## Description

The environment for this process as a map from string key to string value.

 The map is unmodifiable,
 and its content is retrieved from the operating system on its first use.

 Environment variables on Windows are case-insensitive,
 so on Windows the map is case-insensitive and will convert
 all keys to upper case.
 On other platforms, keys can be distinguished by case.

## Return Type
`Map&lt;String, String&gt;`

