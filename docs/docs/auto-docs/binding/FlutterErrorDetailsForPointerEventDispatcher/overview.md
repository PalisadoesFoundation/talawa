# Overview for `FlutterErrorDetailsForPointerEventDispatcher`

## Description

Variant of [FlutterErrorDetails] with extra fields for the gesture
 library's binding's pointer event dispatcher ([GestureBinding.dispatchEvent]).

## Dependencies

- FlutterErrorDetails

## Members

- **event**: `PointerEvent?`
  The pointer event that was being routed when the exception was raised.

- **hitTestEntry**: `HitTestEntry?`
  The hit test result entry for the object whose handleEvent method threw
 the exception. May be null if no hit test entry is associated with the
 event (e.g. [PointerHoverEvent]s, [PointerAddedEvent]s, and
 [PointerRemovedEvent]s).

 The target object itself is given by the [HitTestEntry.target] property of
 the hitTestEntry object.

## Constructors

### Unnamed Constructor
Creates a [FlutterErrorDetailsForPointerEventDispatcher] object with the given
 arguments setting the object's properties.

 The gesture library calls this constructor when catching an exception
 that will subsequently be reported using [FlutterError.onError].

