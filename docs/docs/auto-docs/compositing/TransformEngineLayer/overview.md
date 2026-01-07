# Overview for `TransformEngineLayer`

## Description

An opaque handle to a transform engine layer.

 Instances of this class are created by [SceneBuilder.pushTransform].

 
 `oldLayer` parameter in [SceneBuilder] methods only accepts objects created
 by the engine. [SceneBuilder] will throw an [AssertionError] if you pass it
 a custom implementation of this class.
 

## Dependencies

- _EngineLayerWrapper

## Constructors

### _


#### Parameters

- ``: `dynamic`
