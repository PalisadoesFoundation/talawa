# Overview for `GestureArenaMember`

## Description

Represents an object participating in an arena.

 Receives callbacks from the GestureArena to notify the object when it wins
 or loses a gesture negotiation. Exactly one of [acceptGesture] or
 [rejectGesture] will be called for each arena this member was added to,
 regardless of what caused the arena to be resolved. For example, if a
 member resolves the arena itself, that member still receives an
 [acceptGesture] callback.

