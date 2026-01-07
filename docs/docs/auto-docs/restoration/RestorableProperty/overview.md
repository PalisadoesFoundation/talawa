# Overview for `RestorableProperty`

## Description

Manages an object of type `T`, whose value a [State] object wants to have
 restored during state restoration.

 The property wraps an object of type `T`. It knows how to store its value in
 the restoration data and it knows how to re-instantiate that object from the
 information it previously stored in the restoration data.

 The knowledge of how to store the wrapped object in the restoration data is
 encoded in the [toPrimitives] method and the knowledge of how to
 re-instantiate the object from that data is encoded in the [fromPrimitives]
 method. A call to [toPrimitives] must return a representation of the wrapped
 object that can be serialized with the [StandardMessageCodec]. If any
 collections (e.g. [List]s, [Map]s, etc.) are returned, they must not be
 modified after they have been returned from [toPrimitives]. At a later point
 in time (which may be after the application restarted), the data obtained
 from [toPrimitives] may be handed back to the property's [fromPrimitives]
 method to restore it to the previous state described by that data.

 A [RestorableProperty] needs to be registered to a [RestorationMixin] using
 a restoration ID that is unique within the mixin. The [RestorationMixin]
 provides and manages the [RestorationBucket], in which the data returned by
 [toPrimitives] is stored.

 Whenever the value returned by [toPrimitives] (or the [enabled] getter)
 changes, the [RestorableProperty] must call [notifyListeners]. This will
 trigger the [RestorationMixin] to update the data it has stored for the
 property in its [RestorationBucket] to the latest information returned by
 [toPrimitives].

 When the property is registered with the [RestorationMixin], the mixin
 checks whether there is any restoration data available for the property. If
 data is available, the mixin calls [fromPrimitives] on the property, which
 must return an object that matches the object the property wrapped when the
 provided restoration data was obtained from [toPrimitives]. If no
 restoration data is available to restore the property's wrapped object from,
 the mixin calls [createDefaultValue]. The value returned by either of those
 methods is then handed to the property's [initWithValue] method.

 Usually, subclasses of [RestorableProperty] hold on to the value provided to
 them in [initWithValue] and make it accessible to the [State] object that
 owns the property. This [RestorableProperty] base class, however, has no
 opinion about what to do with the value provided to [initWithValue].

 The [RestorationMixin] may call [fromPrimitives]/[createDefaultValue]
 followed by [initWithValue] multiple times throughout the life of a
 [RestorableProperty]: Whenever new restoration data is made available to the
 [RestorationMixin] the property is registered with, the cycle of calling
 [fromPrimitives] (if the new restoration data contains information to
 restore the property from) or [createDefaultValue] (if no information for
 the property is available in the new restoration data) followed by a call to
 [initWithValue] repeats. Whenever [initWithValue] is called, the property
 should forget the old value it was wrapping and re-initialize itself with
 the newly provided value.

 In a typical use case, a subclass of [RestorableProperty] is instantiated
 either to initialize a member variable of a [State] object or within
 [State.initState]. It is then registered to a [RestorationMixin] in
 [RestorationMixin.restoreState] and later [dispose]ed in [State.dispose].
 For less common use cases (e.g. if the value stored in a
 [RestorableProperty] is only needed while the [State] object is in a certain
 state), a [RestorableProperty] may be registered with a [RestorationMixin]
 any time after [RestorationMixin.restoreState] has been called for the first
 time. A [RestorableProperty] may also be unregistered from a
 [RestorationMixin] before the owning [State] object is disposed by calling
 [RestorationMixin.unregisterFromRestoration]. This is uncommon, though, and
 will delete the information that the property contributed from the
 restoration data (meaning the value of the property will no longer be
 restored during a future state restoration).

 See also:

  * [RestorableValue], which is a [RestorableProperty] that makes the wrapped
    value accessible to the owning [State] object via a `value`
    getter and setter.
  * [RestorationMixin], to which a [RestorableProperty] must be registered.
  * [RestorationManager], which describes how state restoration works in
    Flutter.

## Dependencies

- ChangeNotifier

## Members

- **_disposed**: `bool`
- **_restorationId**: `String?`
- **_owner**: `RestorationMixin?`
## Constructors

### Unnamed Constructor
Creates a [RestorableProperty].

