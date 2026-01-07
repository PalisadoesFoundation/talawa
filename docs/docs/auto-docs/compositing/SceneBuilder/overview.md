# Overview for `SceneBuilder`

## Description

Builds a [Scene] containing the given visuals.

 A [Scene] can then be rendered using [FlutterView.render].

 To draw graphical operations onto a [Scene], first create a
 [Picture] using a [PictureRecorder] and a [Canvas], and then add
 it to the scene using [addPicture].

 ## Use with the Flutter framework

 The Flutter framework's [RendererBinding] provides a hook for creating
 [SceneBuilder] objects ([RendererBinding.createSceneBuilder]) that allows
 tests to hook into the scene creation logic. When creating a [SceneBuilder]
 in the context of the Flutter framework, consider calling
 [RendererBinding.createSceneBuilder] instead of calling the
 [SceneBuilder.new] constructor directly.

 This does not apply when using the `dart:ui` API directly, without using the
 Flutter framework bindings, `flutter_test` framework, et al.

## Constructors

### Unnamed Constructor


