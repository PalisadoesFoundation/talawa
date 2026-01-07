# Overview for `FlowDelegate`

## Description

A delegate that controls the appearance of a flow layout.

 Flow layouts are optimized for moving children around the screen using
 transformation matrices. For optimal performance, construct the
 [FlowDelegate] with an [Animation] that ticks whenever the delegate wishes
 to change the transformation matrices for the children and avoid rebuilding
 the [Flow] widget itself every animation frame.

 See also:

  * [Flow]
  * [RenderFlow]

## Members

- **_repaint**: `Listenable?`
## Constructors

### Unnamed Constructor
The flow will repaint whenever [repaint] notifies its listeners.

