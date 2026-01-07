# Overview for `FixedScrollMetrics`

## Description

An immutable snapshot of values associated with a [Scrollable] viewport.

 For details, see [ScrollMetrics], which defines this object's interfaces.

 
 This sample shows how a [ScrollMetricsNotification] is dispatched when
 the [ScrollMetrics] changed as a result of resizing the [Viewport].
 Press the floating action button to increase the scrollable window's size.

 ** See code in examples/api/lib/widgets/scroll_position/scroll_metrics_notification.0.dart **
 

## Dependencies

- ScrollMetrics

## Members

- **_minScrollExtent**: `double?`
- **_maxScrollExtent**: `double?`
- **_pixels**: `double?`
- **_viewportDimension**: `double?`
- **axisDirection**: `AxisDirection`
- **devicePixelRatio**: `double`
## Constructors

### Unnamed Constructor
Creates an immutable snapshot of values associated with a [Scrollable] viewport.

