# Method: `of`

## Description

Whether tickers in the given subtree should be enabled or disabled.

 This is used automatically by [TickerProviderStateMixin] and
 [SingleTickerProviderStateMixin] to decide if their tickers should be
 enabled or disabled.

 In the absence of a [TickerMode] widget, this function defaults to true.

 Typical usage is as follows:

 ```dart
 bool tickingEnabled = TickerMode.of(context);
 ```

## Return Type
`bool`

## Parameters

- `context`: `BuildContext`
