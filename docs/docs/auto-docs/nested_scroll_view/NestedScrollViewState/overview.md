# Overview for `NestedScrollViewState`

## Description

The [State] for a [NestedScrollView].

 The [ScrollController]s, [innerController] and [outerController], of the
 [NestedScrollView]'s children may be accessed through its state. This is
 useful for obtaining respective scroll positions in the [NestedScrollView].

 If you want to access the inner or outer scroll controller of a
 [NestedScrollView], you can get its [NestedScrollViewState] by supplying a
 `GlobalKey&lt;NestedScrollViewState&gt;` to the [NestedScrollView.key] parameter).

 
 [NestedScrollViewState] can be obtained using a [GlobalKey].
 Using the following setup, you can access the inner scroll controller
 using `globalKey.currentState.innerController`.

 ** See code in examples/api/lib/widgets/nested_scroll_view/nested_scroll_view_state.0.dart **
 

## Dependencies

- State

## Members

- **_absorberHandle**: `SliverOverlapAbsorberHandle`
- **_coordinator**: `_NestedScrollCoordinator?`
- **_lastHasScrolledBody**: `bool?`
