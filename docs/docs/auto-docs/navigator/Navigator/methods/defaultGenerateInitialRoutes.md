# Method: `defaultGenerateInitialRoutes`

## Description

Turn a route name into a set of [Route] objects.

 This is the default value of [onGenerateInitialRoutes], which is used if
 [initialRoute] is not null.

 If this string starts with a `/` character and has multiple `/` characters
 in it, then the string is split on those characters and substrings from
 the start of the string up to each such character are, in turn, used as
 routes to push.

 For example, if the route `/stocks/HOOLI` was used as the [initialRoute],
 then the [Navigator] would push the following routes on startup: `/`,
 `/stocks`, `/stocks/HOOLI`. This enables deep linking while allowing the
 application to maintain a predictable route history.

## Return Type
`List&lt;Route&lt;dynamic&gt;&gt;`

## Parameters

- `navigator`: `NavigatorState`
- `initialRouteName`: `String`
