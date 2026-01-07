# Overview for `UiKitView`

## Description

Embeds an iOS view in the Widget hierarchy.

 Embedding iOS views is an expensive operation and should be avoided when a Flutter
 equivalent is possible.

 

 

 

 Construction of UIViews is done asynchronously, before the UIView is ready this widget paints
 nothing while maintaining the same layout constraints.

 Clipping operations on a UiKitView can result slow performance.
 If a conic path clipping is applied to a UIKitView,
 a quad path is used to approximate the clip due to limitation of Quartz.

## Dependencies

- _DarwinView

## Constructors

### Unnamed Constructor
Creates a widget that embeds an iOS view.

 

