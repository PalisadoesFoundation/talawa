# Overview for `PageIndicator`

## Description

Page indicator for desktop and web platforms.

 On Desktop and Web, drag gesture for horizontal scrolling in a PageView is disabled by default.
 You can defined a custom scroll behavior to activate drag gestures,
 see https://docs.flutter.dev/release/breaking-changes/default-scroll-behavior-drag.

 In this sample, we use a TabPageSelector to navigate between pages,
 in order to build natural behavior similar to other desktop applications.

## Dependencies

- StatelessWidget

## Members

- **currentPageIndex**: `int`
- **tabController**: `TabController`
- **onUpdateCurrentPageIndex**: `void Function(int)`
- **isOnDesktopAndWeb**: `bool`
## Constructors

### Unnamed Constructor


