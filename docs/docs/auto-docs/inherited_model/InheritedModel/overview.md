# Overview for `InheritedModel`

## Description

An [InheritedWidget] that's intended to be used as the base class for models
 whose dependents may only depend on one part or "aspect" of the overall
 model.

 An inherited widget's dependents are unconditionally rebuilt when the
 inherited widget changes per [InheritedWidget.updateShouldNotify]. This
 widget is similar except that dependents aren't rebuilt unconditionally.

 Widgets that depend on an [InheritedModel] qualify their dependence with a
 value that indicates what "aspect" of the model they depend on. When the
 model is rebuilt, dependents will also be rebuilt, but only if there was a
 change in the model that corresponds to the aspect they provided.

 The type parameter `T` is the type of the model aspect objects.

 

 Widgets create a dependency on an [InheritedModel] with a static method:
 [InheritedModel.inheritFrom]. This method's `context` parameter defines the
 subtree that will be rebuilt when the model changes. Typically the
 `inheritFrom` method is called from a model-specific static `maybeOf` or
 `of` methods, a convention that is present in many Flutter framework classes
 which look things up. For example:

 ```dart
 class MyModel extends InheritedModel&lt;String&gt; 
 ```

 Calling `MyModel.of(context, 'foo')` or `MyModel.maybeOf(context,
 'foo')` means that `context` should only be rebuilt when the `foo` aspect of
 `MyModel` changes. If the `aspect` is null, then the model supports all
 aspects.

 
 When the inherited model is rebuilt the [updateShouldNotify] and
 [updateShouldNotifyDependent] methods are used to decide what should be
 rebuilt. If [updateShouldNotify] returns true, then the inherited model's
 [updateShouldNotifyDependent] method is tested for each dependent and the
 set of aspect objects it depends on. The [updateShouldNotifyDependent]
 method must compare the set of aspect dependencies with the changes in the
 model itself. For example:

 ```dart
 class ABModel extends InheritedModel&lt;String&gt; 
 ```
 

 In the previous example the dependencies checked by
 [updateShouldNotifyDependent] are just the aspect strings passed to
 `dependOnInheritedWidgetOfExactType`. They're represented as a [Set] because
 one Widget can depend on more than one aspect of the model. If a widget
 depends on the model but doesn't specify an aspect, then changes in the
 model will cause the widget to be rebuilt unconditionally.

 
 This example shows how to implement [InheritedModel] to rebuild a widget
 based on a qualified dependence. When tapped on the "Resize Logo" button
 only the logo widget is rebuilt while the background widget remains
 unaffected.

 ** See code in examples/api/lib/widgets/inherited_model/inherited_model.0.dart **
 

 See also:

 * [InheritedWidget], an inherited widget that only notifies dependents when
   its value is different.
 * [InheritedNotifier], an inherited widget whose value can be a
   [Listenable], and which will notify dependents whenever the value sends
   notifications.

## Dependencies

- InheritedWidget

## Constructors

### Unnamed Constructor
Creates an inherited widget that supports dependencies qualified by
 "aspects", i.e. a descendant widget can indicate that it should
 only be rebuilt if a specific aspect of the model changes.

