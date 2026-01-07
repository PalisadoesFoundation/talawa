# Method: `defaultStyleOf`

## Description

Returns a [ButtonStyle] that's based primarily on the [Theme]'s
 [ThemeData.textTheme] and [ThemeData.colorScheme], but has most values
 filled out (non-null).

 The returned style can be overridden by the [style] parameter and by the
 style returned by [themeStyleOf] that some button-specific themes like
 [TextButtonTheme] or [ElevatedButtonTheme] override. For example the
 default style of the [TextButton] subclass can be overridden with its
 [TextButton.style] constructor parameter, or with a [TextButtonTheme].

 Concrete button subclasses should return a [ButtonStyle] with as many
 non-null properties as possible, where all of the non-null
 [WidgetStateProperty] properties resolve to non-null values.

 ## Properties that can be null

 Some properties, like [ButtonStyle.fixedSize] would override other values
 in the same [ButtonStyle] if set, so they are allowed to be null.  Here is
 a summary of properties that are allowed to be null when returned in the
 [ButtonStyle] returned by this function, an why:

 - [ButtonStyle.fixedSize] because it would override other values in the
   same [ButtonStyle], like [ButtonStyle.maximumSize].
 - [ButtonStyle.side] because null is a valid value for a button that has
   no side. [OutlinedButton] returns a non-null default for this, however.
 - [ButtonStyle.backgroundBuilder] and [ButtonStyle.foregroundBuilder]
   because they would override the [ButtonStyle.foregroundColor] and
   [ButtonStyle.backgroundColor] of the same [ButtonStyle].

 See also:

 * [themeStyleOf], returns the ButtonStyle of this button's component
   theme.

## Return Type
`ButtonStyle`

## Parameters

- `context`: `BuildContext`
