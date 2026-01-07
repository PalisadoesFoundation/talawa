# Overview for `RefreshIndicatorState`

## Description

Contains the state for a [RefreshIndicator]. This class can be used to
 programmatically show the refresh indicator, see the [show] method.

## Dependencies

- State, TickerProviderStateMixin

## Members

- **_positionController**: `AnimationController`
- **_scaleController**: `AnimationController`
- **_positionFactor**: `Animation&lt;double&gt;`
- **_scaleFactor**: `Animation&lt;double&gt;`
- **_value**: `Animation&lt;double&gt;`
- **_valueColor**: `Animation<Color?>`
- **_status**: `RefreshIndicatorStatus?`
- **_pendingRefreshFuture**: `Future&lt;void&gt;`
- **_isIndicatorAtTop**: `bool?`
- **_dragOffset**: `double?`
- **_effectiveValueColor**: `Color`
- **_threeQuarterTween**: `Animatable&lt;double&gt;`
- **_kDragSizeFactorLimitTween**: `Animatable&lt;double&gt;`
- **_oneToZeroTween**: `Animatable&lt;double&gt;`
