# Overview for `Match`

## Description

A result from searching within a string.

 A `Match` or an [Iterable] of `Match` objects is returned from
 the [Pattern] matching methods
 ([Pattern.allMatches] and [Pattern.matchAsPrefix]).

 The following example finds all matches of a [RegExp] in a [String]
 and iterates through the returned iterable of `Match` objects.
 ```dart
 final regExp = RegExp(r'(\w+)');
 const string = 'Parse my string';
 final matches = regExp.allMatches(string);
 for (final m in matches) 
 ```
 The output of the example is:
 ```
 Parse
 my
 string
 ```
 Some patterns, regular expressions in particular, may record substrings
 that were part of the matching. These are called _groups_ in the `Match`
 object. Some patterns may never have any groups, and their matches always
 have zero [groupCount].

