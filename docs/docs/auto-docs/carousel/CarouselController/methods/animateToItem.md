# Method: `animateToItem`

## Description

Animates the controlled carousel to the given item index.

 For [CarouselView], this will scroll the carousel so the item at [index] becomes
 the leading item.

 If the [index] is less than 0, the carousel will scroll to the first item.
 If the [index] is greater than the number of items, the carousel will scroll
 to the last item.

 For [CarouselView.weighted], animates to make the item at [index] occupy the primary,
 most prominent position determined by the largest weight in `flexWeights`.

 The animation uses the provided [Duration] and [Curve]. The returned [Future]
 completes when the animation finishes.

 The [Duration] defaults to 300 milliseconds and [Curve] defaults to [Curves.ease].

 Does nothing if the carousel is not attached to this controller.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `index`: `int`
- ``: `dynamic`
- ``: `dynamic`
