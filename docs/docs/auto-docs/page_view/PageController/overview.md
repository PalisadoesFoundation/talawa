# Overview for `PageController`

## Description

A controller for [PageView].

 A page controller lets you manipulate which page is visible in a [PageView].
 In addition to being able to control the pixel offset of the content inside
 the [PageView], a [PageController] also lets you control the offset in terms
 of pages, which are increments of the viewport size.

 See also:

  * [PageView], which is the widget this object controls.

 

 This widget introduces a [MaterialApp], [Scaffold] and [PageView] with two pages
 using the default constructor. Both pages contain an [ElevatedButton] allowing you
 to animate the [PageView] using a [PageController].

 ```dart
 class MyPageView extends StatefulWidget 

 class _MyPageViewState extends State&lt;MyPageView&gt; 
 ```
 

## Dependencies

- ScrollController

## Members

- **initialPage**: `int`
  The page to show when first creating the [PageView].

- **keepPage**: `bool`
  Save the current [page] with [PageStorage] and restore it if
 this controller's scrollable is recreated.

 If this property is set to false, the current [page] is never saved
 and [initialPage] is always used to initialize the scroll offset.
 If true (the default), the initial page is used the first time the
 controller's scrollable is created, since there's isn't a page to
 restore yet. Subsequently the saved page is restored and
 [initialPage] is ignored.

 See also:

  * [PageStorageKey], which should be used when more than one
    scrollable appears in the same route, to distinguish the [PageStorage]
    locations used to save scroll offsets.

- **viewportFraction**: `double`
  
 The fraction of the viewport that each page should occupy.

 Defaults to 1.0, which means each page fills the viewport in the scrolling
 direction.
 

## Constructors

### Unnamed Constructor
Creates a page controller.

