# Method: `capture`

## Description

Returns a [CapturedThemes] object that includes all the [InheritedTheme]s
 between the given `from` and `to` [BuildContext]s.

 The `to` context must be an ancestor of the `from` context. If `to` is
 null, all ancestor inherited themes of `from` up to the root of the
 widget tree are captured.

 After calling this method, the themes present between `from` and `to` are
 frozen in the returned [CapturedThemes] object. If the themes (or their
 theme data) change in the original subtree, those changes will not be
 applied to the themes captured in the [CapturedThemes] object - unless
 this method is called again to re-capture the updated themes.

 To wrap a [Widget] in the captured themes, call [CapturedThemes.wrap].

 This method can be expensive if there are many widgets between `from` and
 `to` (it walks the element tree between those nodes).

## Return Type
`CapturedThemes`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
