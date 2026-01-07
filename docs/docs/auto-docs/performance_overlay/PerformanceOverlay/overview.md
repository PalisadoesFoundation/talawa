# Overview for `PerformanceOverlay`

## Description

Displays performance statistics.

 The overlay shows two time series. The first shows how much time was
 required on this thread to produce each frame. The second shows how much
 time was required on the raster thread (formerly known as the GPU thread)
 to produce each frame. Ideally, both these values would be less than
 the total frame budget for the hardware on which the app is running.
 For example, if the hardware has a screen that updates at 60 Hz, each
 thread should ideally spend less than 16ms producing each frame.
 This ideal condition is indicated by a green vertical line for each thread.
 Otherwise, the performance overlay shows a red vertical line.

 The simplest way to show the performance overlay is to set
 [MaterialApp.showPerformanceOverlay] or [WidgetsApp.showPerformanceOverlay]
 to true.

## Dependencies

- LeafRenderObjectWidget

## Members

- **optionsMask**: `int`
  The mask is created by shifting 1 by the index of the specific
 [PerformanceOverlayOption] to enable.

## Constructors

### Unnamed Constructor
Create a performance overlay that only displays specific statistics. The
 mask is created by shifting 1 by the index of the specific
 [PerformanceOverlayOption] to enable.

### allEnabled
Create a performance overlay that displays all available statistics.

#### Parameters

- ``: `dynamic`
