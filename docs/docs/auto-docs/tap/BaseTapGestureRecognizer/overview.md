# Overview for `BaseTapGestureRecognizer`

## Description

A base class for gesture recognizers that recognize taps.

 Gesture recognizers take part in gesture arenas to enable potential gestures
 to be disambiguated from each other. This process is managed by a
 [GestureArenaManager].

 A tap is defined as a sequence of events that starts with a down, followed
 by optional moves, then ends with an up. All move events must contain the
 same `buttons` as the down event, and must not be too far from the initial
 position. The gesture is rejected on any violation, a cancel event, or
 if any other recognizers wins the arena. It is accepted only when it is the
 last member of the arena.

 The [BaseTapGestureRecognizer] considers all the pointers involved in the
 pointer event sequence as contributing to one gesture. For this reason,
 extra pointer interactions during a tap sequence are not recognized as
 additional taps. For example, down-1, down-2, up-1, up-2 produces only one
 tap on up-1.

 The [BaseTapGestureRecognizer] can not be directly used, since it does not
 define which buttons to accept, or what to do when a tap happens. If you
 want to build a custom tap recognizer, extend this class by overriding
 [isPointerAllowed] and the handler methods.

 See also:

  * [TapGestureRecognizer], a ready-to-use tap recognizer that recognizes
    taps of the primary button and taps of the secondary button.
  * [ModalBarrier], a widget that uses a custom tap recognizer that accepts
    any buttons.

## Dependencies

- PrimaryPointerGestureRecognizer

## Members

- **_sentTapDown**: `bool`
- **_wonArenaForPrimaryPointer**: `bool`
- **_down**: `PointerDownEvent?`
- **_up**: `PointerUpEvent?`
## Constructors

### Unnamed Constructor
Creates a tap gesture recognizer.

 

