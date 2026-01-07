# Overview for `UnderlineTabIndicator`

## Description

Used with [TabBar.indicator] to draw a horizontal line below the
 selected tab.

 The selected tab underline is inset from the tab's boundary by [insets].
 The [borderSide] defines the line's color and weight.

 The [TabBar.indicatorSize] property can be used to define the indicator's
 bounds in terms of its (centered) widget with [TabBarIndicatorSize.label],
 or the entire tab with [TabBarIndicatorSize.tab].

## Dependencies

- Decoration

## Members

- **borderRadius**: `BorderRadius?`
  The radius of the indicator's corners.

 If this value is non-null, rounded rectangular tab indicator is
 drawn, otherwise rectangular tab indicator is drawn.

- **borderSide**: `BorderSide`
  The color and weight of the horizontal line drawn below the selected tab.

- **insets**: `EdgeInsetsGeometry`
  Locates the selected tab's underline relative to the tab's boundary.

 The [TabBar.indicatorSize] property can be used to define the tab
 indicator's bounds in terms of its (centered) tab widget with
 [TabBarIndicatorSize.label], or the entire tab with
 [TabBarIndicatorSize.tab].

## Constructors

### Unnamed Constructor
Create an underline style selected tab indicator.

