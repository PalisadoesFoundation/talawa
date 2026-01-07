# Method: `animateTo`

## Description

Animates the position from its current value to the given value.

 Any active animation is canceled. If the user is currently scrolling, that
 action is canceled.

 The returned [Future] will complete when the animation ends, whether it
 completed successfully or whether it was interrupted prematurely.

 An animation will be interrupted whenever the user attempts to scroll
 manually, or whenever another activity is started, or whenever the
 animation reaches the edge of the viewport and attempts to overscroll. (If
 the [ScrollPosition] does not overscroll but instead allows scrolling
 beyond the extents, then going beyond the extents will not interrupt the
 animation.)

 The animation is indifferent to changes to the viewport or content
 dimensions.

 Once the animation has completed, the scroll position will attempt to
 begin a ballistic activity in case its value is not stable (for example,
 if it is scrolled beyond the extents and in that situation the scroll
 position would normally bounce back).

 The duration must not be zero. To jump to a particular value without an
 animation, use [jumpTo].

 When calling [animateTo] in widget tests, `await`ing the returned
 [Future] may cause the test to hang and timeout. Instead, use
 [WidgetTester.pumpAndSettle].

## Return Type
`Future&lt;void&gt;`

## Parameters

- `offset`: `double`
- ``: `dynamic`
- ``: `dynamic`
