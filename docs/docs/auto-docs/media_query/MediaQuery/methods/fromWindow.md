# Method: `fromWindow`

## Description

Deprecated. Use [MediaQuery.fromView] instead.

 This constructor was operating on a single window assumption. In
 preparation for Flutter's upcoming multi-window support, it has been
 deprecated.

 Replaced by [MediaQuery.fromView], which requires specifying the
 [FlutterView] the [MediaQuery] is constructed for. The [FlutterView] can,
 for example, be obtained from the context via [View.of] or from
 [PlatformDispatcher.views].

## Return Type
`Widget`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
