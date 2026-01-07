# Overview for `CarouselView`

## Description

A Material Design carousel widget.

 The [CarouselView] presents a scrollable list of items, each of which can dynamically
 change size based on the chosen layout.

 Material Design 3 introduced 4 carousel layouts:
  * Multi-browse: This layout shows at least one large, medium, and small
    carousel item at a time. This layout is supported by [CarouselView.weighted].
  * Uncontained (default): This layout show items that scroll to the edge of the
    container. This layout is supported by [CarouselView].
  * Hero: This layout shows at least one large and one small item at a time.
    This layout is supported by [CarouselView.weighted].
  * Full-screen: This layout shows one edge-to-edge large item at a time and
    scrolls vertically. The full-screen layout can be supported by both
    constructors.

 The default constructor implements the uncontained layout model. It shows
 items that scroll to the edge of the container, behaving similarly to a
 [ListView] where all children are a uniform size. [CarouselView.weighted]
 enables dynamic item sizing. Each item is assigned a weight that determines
 the portion of the viewport it occupies. This constructor helps to create
 layouts like multi-browse, and hero. In order to have a full-screen layout,
 if [CarouselView] is used, then set the [itemExtent] to screen size; if
 [CarouselView.weighted] is used, then set the [flexWeights] to only have
 one integer in the array.

 

 This code snippet shows how to get a vertical full-screen carousel by using
 [itemExtent] in [CarouselView].

 ```dart
 Scaffold(
   body: CarouselView(
     scrollDirection: Axis.vertical,
     itemExtent: double.infinity,
     children: List&lt;Widget&gt;.generate(10, (int index) ),
   ),
 ),
 ```

 This code snippet below shows how to achieve the same vertical full-screen
 carousel by using [flexWeights] in [CarouselView.weighted].

 ```dart
 Scaffold(
   body: CarouselView.weighted(
     scrollDirection: Axis.vertical,
     flexWeights: const <int>[1], // Or any positive integers as long as the length of the array is 1.
     children: List&lt;Widget&gt;.generate(10, (int index) ),
   ),
 ),
 ```
 

 In [CarouselView.weighted], weights are relative proportions. For example,
 if the layout weights is `[3, 2, 1]`, it means the first visible item occupies
 3/6 of the viewport; the second visible item occupies 2/6 of the viewport;
 the last visible item occupies 1/6 of the viewport. As the carousel scrolls,
 the size of the latter one gradually changes to the size of the former one.
 As a result, when the first visible item is completely off-screen, the
 following items will follow the same layout as before. Using [CarouselView.weighted]
 helps build the multi-browse, hero, center-aligned hero and full-screen layouts,
 as indicated in [Carousel specs](https://m3.material.io/components/carousel/specs).

 The [CarouselController] is used to control the
 [CarouselController.initialItem], which determines the first fully expanded
 item when the [CarouselView] or [CarouselView.weighted] is initially displayed.
 This is straightforward for [CarouselView] because each item in the view
 has fixed size. In [CarouselView.weighted], for instance, if the layout
 weights are `[1, 2, 3, 2, 1]` and the initial item is 4 (the fourth item), the
 view will display items 2, 3, 4, 5, and 6 with weights 1, 2, 3, 2 and 1
 respectively.

 The [CarouselView.itemExtent] property must be non-null and defines the base
 size of items. While items typically maintain this size, the first and last
 visible items may be slightly compressed during scrolling. The [shrinkExtent]
 property controls the minimum allowable size for these compressed items.

 
 Here is an example to show different carousel layouts that [CarouselView]
 and [CarouselView.weighted] can build.

 On desktop and web running on desktop platforms, dragging to scroll with a mouse
 is disabled by default to align with natural behavior.

 To further align expected behavior like this, mouse input can scroll horizontally
 by pressing the shift key while scrolling with the mouse wheel.

 This key-driven behavior is dictated by the [ScrollBehavior.pointerAxisModifiers],
 while [ScrollBehavior.dragDevices] manages what devices can drag a scrollable.

 ** See code in examples/api/lib/material/carousel/carousel.0.dart **
 

 See also:

  * [CarouselController], which controls the first fully visible item in the
    view.
  * [PageView], which is a scrollable list that works page by page.

## Dependencies

- StatefulWidget

## Members

- **padding**: `EdgeInsets?`
  The amount of space to surround each carousel item with.

 Defaults to [EdgeInsets.all] of 4 pixels.

- **backgroundColor**: `Color?`
  The background color for each carousel item.

 Defaults to [ColorScheme.surface].

- **elevation**: `double?`
  The z-coordinate of each carousel item.

 Defaults to 0.0.

- **shape**: `ShapeBorder?`
  The shape of each carousel item's [Material].

 Defines each item's [Material.shape].

 Defaults to a [RoundedRectangleBorder] with a circular corner radius
 of 28.0.

- **overlayColor**: `WidgetStateProperty<Color?>?`
  The highlight color to indicate the carousel items are in pressed, hovered
 or focused states.

 The default values are:
   * [WidgetState.pressed] - [ColorScheme.onSurface] with an opacity of 0.1
   * [WidgetState.hovered] - [ColorScheme.onSurface] with an opacity of 0.08
   * [WidgetState.focused] - [ColorScheme.onSurface] with an opacity of 0.1

- **shrinkExtent**: `double`
  The minimum allowable extent (size) in the main axis for carousel items
 during scrolling transitions.

 As the carousel scrolls, the first visible item is pinned and gradually
 shrinks until it reaches this minimum extent before scrolling off-screen.
 Similarly, the last visible item enters the viewport at this minimum size
 and expands to its full [itemExtent].

 In cases where the remaining viewport space for the last visible item is
 larger than the defined [shrinkExtent], the [shrinkExtent] is dynamically
 adjusted to match this remaining space, ensuring a smooth size transition.

 Defaults to 0.0. Setting to 0.0 allows items to shrink/expand completely,
 transitioning between 0.0 and the full item size. In cases where the
 remaining viewport space for the last visible item is larger than the
 defined [shrinkExtent], the [shrinkExtent] is dynamically adjusted to match
 this remaining space, ensuring a smooth size transition.

- **itemSnapping**: `bool`
  Whether the carousel should keep scrolling to the next/previous items to
 maintain the original layout.

 Defaults to false.

- **controller**: `CarouselController?`
  An object that can be used to control the position to which this scroll
 view is scrolled.

- **scrollDirection**: `Axis`
  The [Axis] along which the scroll view's offset increases with each item.

 Defaults to [Axis.horizontal].

- **reverse**: `bool`
  Whether the carousel list scrolls in the reading direction.

 For example, if the reading direction is left-to-right and
 [scrollDirection] is [Axis.horizontal], then the carousel scrolls from
 left to right when [reverse] is false and from right to left when
 [reverse] is true.

 Similarly, if [scrollDirection] is [Axis.vertical], then the carousel view
 scrolls from top to bottom when [reverse] is false and from bottom to top
 when [reverse] is true.

 Defaults to false.

- **consumeMaxWeight**: `bool`
  Whether the collapsed items are allowed to expand to the max size.

 If this is false, the layout of the carousel doesn't change. This is especially
 useful when a weight list in [CarouselView.weighted] has a max item in the
 middle and at least one small item on either side, such as `[1, 7, 1, 1]`.
 In this case, if this is false, the first and the last two items cannot
 expand to the max size. If this is true, there will be some space before
 the first item or after the last item coming so every item has a chance to
 be fully expanded.

 Defaults to true.

- **onTap**: `ValueChanged&lt;int&gt;?`
  Called when one of the [children] is tapped.

- **enableSplash**: `bool`
  Determines whether an [InkWell] will cover each Carousel item.

 If true, tapping an item will create an ink splash
 as defined by the [ThemeData.splashFactory].

 Setting this to false allows the [children] to respond to user gestures.

 Defaults to true.

- **itemExtent**: `double?`
  The extent the children are forced to have in the main axis.

 The item extent should not exceed the available space that the carousel view
 occupies to ensure at least one item is fully visible.

 This is required for [CarouselView]. In [CarouselView.weighted], this is null.

- **flexWeights**: `List&lt;int&gt;?`
  The weights that each visible child should occupy in the viewport.

 The length of [flexWeights] represents how many items should be visible
 at a time in the viewport. For example, setting [flexWeights] to
 `<int>[3, 2, 1]` means there are 3 carousel items and their extents are
 3/6, 2/6 and 1/6 of the viewport extent.

 This is a required property in [CarouselView.weighted]. This is null
 for default [CarouselView]. The integers must be greater than 0.

- **children**: `List&lt;Widget&gt;`
  The child widgets for the carousel.

## Constructors

### Unnamed Constructor
Creates a Material Design carousel.

### weighted
Creates a scrollable list where the size of each child widget is dynamically
 determined by the provided [flexWeights].

 The [flexWeights] parameter is required and defines the relative size
 proportions of each child widget.

 While scrolling, the main-axis extent (size) of each visible item changes
 dynamically based on the scrolling progress. The cross-axis extent is determined
 by the parent constraints. As the first visible item scrolls completely
 off-screen, the next item becomes the first visible item, and has the same
 size as the previously first item. The rest of the visible items maintain
 their relative layout.

 For example, if the layout weights are `[1, 6, 1]`, the length of [flexWeights]
 indicates three items will be visible at a time. The layout of these items
 would be:
  * First item: Extent is (1 / (1 + 6 + 1)) * viewport extent.
  * Second item: Extent is (6 / (1 + 6 + 1)) * viewport extent.
  * Third item: Extent is (1 / (1 + 6 + 1)) * viewport extent.

 Assuming a viewport extent of 800 in the main axis and the first item is
 item 0, there would be three visible items with extents of 100, 600, and 100.
 As item 0 scrolls off-screen, the extent of item 1 smoothly decreases from 600
 to 100. For instance, if item 0 is 30% off-screen, item 1 should have decreased
 its size to 30% of the difference from 600 to 100; its extent would be
 600 - 0.3 * (600 - 100). Similarly, item 2's extent would increase from 100
 to 600, becoming 100 + 0.3 * (600 - 100).

 As the initially visible items change size during scrolling, item 3 enters
 the view to fill the remaining space. Its extent starts at a minimum of
 [shrinkExtent] (or 0 if [shrinkExtent] is not provided) and gradually
 increases to match the extent of the last visible item (100 in this example).

 When [consumeMaxWeight] is set to `true`, each child can be expanded to occupy
 the maximum weight while scrolling. For example, with [flexWeights] of `[1, 7, 1]`,
 the initial weight of the first item is 1. However, by enabling
 [consumeMaxWeight] and scrolling forward, the first item can expand to occupy
 a weight of 7, leaving a weight of 1 as some empty space before it. This feature
 is particularly useful for achieving [Hero](https://m3.material.io/components/carousel/specs#b33a5579-d648-42a9-b934-98718d65454f)
 and [Center-aligned hero](https://m3.material.io/components/carousel/specs#92c779ce-de8b-4dee-8201-95d3e429204f)
 layouts indicated in the Material Design 3.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
