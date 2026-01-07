# Method: `animation`

## Description

An animation whose value represents the current position of the [TabBar]'s
 selected tab indicator as well as the scrollOffsets of the [TabBar]
 and [TabBarView].

 The animation's value ranges from 0.0 to [length] - 1.0. After the
 selected tab is changed, the animation's value equals [index]. The
 animation's value can be [offset] by +/- 1.0 to reflect [TabBarView]
 drag scrolling.

 If this [TabController] was disposed, then return null.

## Return Type
`Animation&lt;double&gt;?`

