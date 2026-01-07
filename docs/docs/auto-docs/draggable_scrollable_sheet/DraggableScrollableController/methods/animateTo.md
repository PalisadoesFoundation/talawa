# Method: `animateTo`

## Description

Animates the attached sheet from its current size to the given [size], a
 fractional value of the parent container's height.

 Any active sheet animation is canceled. If the sheet's internal scrollable
 is currently animating (e.g. responding to a user fling), that animation is
 canceled as well.

 An animation will be interrupted whenever the user attempts to scroll
 manually, whenever another activity is started, or when the sheet hits its
 max or min size (e.g. if you animate to 1 but the max size is .8, the
 animation will stop playing when it reaches .8).

 The duration must not be zero. To jump to a particular value without an
 animation, use [jumpTo].

 The sheet will not snap after calling [animateTo] even if [DraggableScrollableSheet.snap]
 is true. Snapping only occurs after user drags.

 When calling [animateTo] in widget tests, `await`ing the returned
 [Future] may cause the test to hang and timeout. Instead, use
 [WidgetTester.pumpAndSettle].

## Return Type
`Future&lt;void&gt;`

## Parameters

- `size`: `double`
- ``: `dynamic`
- ``: `dynamic`
