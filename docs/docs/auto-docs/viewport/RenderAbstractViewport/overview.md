# Overview for `RenderAbstractViewport`

## Description

An interface for render objects that are bigger on the inside.

 Some render objects, such as [RenderViewport], present a portion of their
 content, which can be controlled by a [ViewportOffset]. This interface lets
 the framework recognize such render objects and interact with them without
 having specific knowledge of all the various types of viewports.

## Dependencies

- RenderObject

## Members

- **defaultCacheExtent**: `double`
  The default value for the cache extent of the viewport.

 This default assumes [CacheExtentStyle.pixel].

 See also:

  * [RenderViewportBase.cacheExtent] for a definition of the cache extent.

