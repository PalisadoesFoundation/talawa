# Overview for `BindingBase`

## Description

Base class for mixins that provide singleton services.

 The Flutter engine ([dart:ui]) exposes some low-level services,
 but these are typically not suitable for direct use, for example
 because they only provide a single callback which an application
 may wish to multiplex to allow multiple listeners.

 Bindings provide the glue between these low-level APIs and the
 higher-level framework APIs. They _bind_ the two together, whence
 the name.

 ## Implementing a binding mixin

 A library would typically create a new binding mixin to expose a
 feature in [dart:ui]. This is rare in general, but it is something
 that an alternative framework would do, e.g. if a framework were
 to replace the [widgets] library with an alternative API but still
 wished to leverage the [services] and [foundation] libraries.

 To create a binding mixin, declare a mixin `on` the [BindingBase] class
 and whatever other bindings the concrete binding must implement for
 this binding mixin to be useful.

 The mixin is guaranteed to only be constructed once in the
 lifetime of the app; this is handled by [initInstances].

 A binding mixin must at a minimum implement the following features:

 * The [initInstances] method, which must call `super.initInstances` and
   set an `_instance` static field to `this`.
 * An `instance` static getter, which must return that field using [checkInstance].

 In addition, it should implement whatever singleton features the library needs.

 As a general rule, the less can be placed in the binding, the
 better. Prefer having APIs that takes objects rather than having
 them refer to global singletons. Bindings are best limited to
 exposing features that literally only exist once, for example, the
 APIs in [dart:ui].

 

 Here is a basic example of a binding that implements these features. It relies on
 another fictional binding called `BarBinding`.

 ```dart
 mixin FooBinding on BindingBase, BarBinding 
 ```
 

 ## Implementing a binding class

 The top-most layer used to write the application (e.g. the Flutter
 [widgets] library) will have a concrete class that inherits from
 [BindingBase] and uses all the various [BindingBase] mixins (such
 as [ServicesBinding]). The [widgets] library in Flutter introduces
 a binding called [WidgetsFlutterBinding].

 A binding _class_ should mix in the relevant bindings from each
 layer that it wishes to expose, and should have an
 `ensureInitialized` method that constructs the class if that
 layer's mixin's `_instance` field is null. This allows the binding
 to be overridden by developers who have more specific needs, while
 still allowing other code to call `ensureInitialized` when a binding
 is needed.

 

 A typical binding class is shown below. The `ensureInitialized` method's
 return type is the library's binding mixin, rather than the concrete
 class.

 ```dart
 // continuing from previous example...
 class FooLibraryBinding extends BindingBase with BarBinding, FooBinding 
 ```
 

## Members

- **_debugConstructed**: `bool`
- **_debugInitializedType**: `Type?`
- **_debugServiceExtensionsRegistered**: `bool`
- **_debugBindingZone**: `Zone?`
- **debugZoneErrorsAreFatal**: `bool`
  Whether [debugCheckZone] should throw (true) or just report the error (false).

 Setting this to true makes it easier to catch cases where the zones are
 misconfigured, by allowing debuggers to stop at the point of error.

 Currently this defaults to false, to avoid suddenly breaking applications
 that are affected by this check but appear to be working today. Applications
 are encouraged to resolve any issues that cause the [debugCheckZone] message
 to appear, as even if they appear to be working today, they are likely to be
 hiding hard-to-find bugs, and are more brittle (likely to collect bugs in
 the future).

 To silence the message displayed by [debugCheckZone], ensure that the same
 zone is used when calling `` as when calling the framework
 in any other context (e.g. via [runApp]).

- **_lockCount**: `int`
## Constructors

### Unnamed Constructor
Default abstract constructor for bindings.

 First calls [initInstances] to have bindings initialize their
 instance pointers and other state, then calls
 [initServiceExtensions] to have bindings initialize their
 VM service extensions, if any.

