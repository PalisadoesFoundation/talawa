# Overview for `MediaQuery`

## Description

Establishes a subtree in which media queries resolve to the given data.

 For example, to learn the size of the current view (e.g.,
 the [FlutterView] containing your app), you can use [MediaQuery.sizeOf]:
 `MediaQuery.sizeOf(context)`.

 Querying the current media using specific methods (for example,
 [MediaQuery.sizeOf] or [MediaQuery.paddingOf]) will cause your widget to
 rebuild automatically whenever that specific property changes.

 
 Querying using [MediaQuery.of] will cause your widget to rebuild
 automatically whenever _any_ field of the [MediaQueryData] changes (e.g., if
 the user rotates their device). Therefore, unless you are concerned with the
 entire [MediaQueryData] object changing, prefer using the specific methods
 (for example: [MediaQuery.sizeOf] and [MediaQuery.paddingOf]), as it will
 rebuild more efficiently.

 If no [MediaQuery] is in scope then [MediaQuery.of] and the "...Of" methods
 similar to [MediaQuery.sizeOf] will throw an exception. Alternatively, the
 "maybe-" variant methods (such as [MediaQuery.maybeOf] and
 [MediaQuery.maybeSizeOf]) can be used, which return null, instead of
 throwing, when no [MediaQuery] is in scope.
 

 

 See also:

  * [WidgetsApp] and [MaterialApp], which introduce a [MediaQuery] and keep
    it up to date with the current screen metrics as they change.
  * [MediaQueryData], the data structure that represents the metrics.

## Dependencies

- InheritedModel

## Members

- **data**: `MediaQueryData`
  Contains information about the current media.

 For example, the [MediaQueryData.size] property contains the width and
 height of the current window.

## Constructors

### Unnamed Constructor
Creates a widget that provides [MediaQueryData] to its descendants.

### removePadding
Creates a new [MediaQuery] that inherits from the ambient [MediaQuery]
 from the given context, but removes the specified padding.

 This should be inserted into the widget tree when the [MediaQuery] padding
 is consumed by a widget in such a way that the padding is no longer
 exposed to the widget's descendants or siblings.

 The [context] argument must have a [MediaQuery] in scope.

 If all four of the `removeLeft`, `removeTop`, `removeRight`, and
 `removeBottom` arguments are false (the default), then the returned
 [MediaQuery] reuses the ambient [MediaQueryData] unmodified, which is not
 particularly useful.

 See also:

  * [SafeArea], which both removes the padding from the [MediaQuery] and
    adds a [Padding] widget.
  * [MediaQueryData.padding], the affected property of the
    [MediaQueryData].
  * [MediaQuery.removeViewInsets], the same thing but for [MediaQueryData.viewInsets].
  * [MediaQuery.removeViewPadding], the same thing but for
    [MediaQueryData.viewPadding].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### removeViewInsets
Creates a new [MediaQuery] that inherits from the ambient [MediaQuery]
 from the given context, but removes the specified view insets.

 This should be inserted into the widget tree when the [MediaQuery] view
 insets are consumed by a widget in such a way that the view insets are no
 longer exposed to the widget's descendants or siblings.

 The [context] argument must have a [MediaQuery] in scope.

 If all four of the `removeLeft`, `removeTop`, `removeRight`, and
 `removeBottom` arguments are false (the default), then the returned
 [MediaQuery] reuses the ambient [MediaQueryData] unmodified, which is not
 particularly useful.

 See also:

  * [MediaQueryData.viewInsets], the affected property of the
    [MediaQueryData].
  * [MediaQuery.removePadding], the same thing but for [MediaQueryData.padding].
  * [MediaQuery.removeViewPadding], the same thing but for
    [MediaQueryData.viewPadding].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### removeViewPadding
Creates a new [MediaQuery] that inherits from the ambient [MediaQuery]
 from the given context, but removes the specified view padding.

 This should be inserted into the widget tree when the [MediaQuery] view
 padding is consumed by a widget in such a way that the view padding is no
 longer exposed to the widget's descendants or siblings.

 The [context] argument must have a [MediaQuery] in scope.

 If all four of the `removeLeft`, `removeTop`, `removeRight`, and
 `removeBottom` arguments are false (the default), then the returned
 [MediaQuery] reuses the ambient [MediaQueryData] unmodified, which is not
 particularly useful.

 See also:

  * [MediaQueryData.viewPadding], the affected property of the
    [MediaQueryData].
  * [MediaQuery.removePadding], the same thing but for [MediaQueryData.padding].
  * [MediaQuery.removeViewInsets], the same thing but for [MediaQueryData.viewInsets].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
