# Overview for `OfflineActionQueue`

## Description

OfflineActionQueue class manages a queue for offline actions.

 This class provides the following functionalities:
 * `initialize` : initializes the queue by registering adapters and opening the queue.
 * `registerAdapters` : registers the required Hive adapters.
 * `openQueue` : opens the Hive box for the offline action queue.
 * `addAction` : adds an action to the queue with a TTL.
 * `getActions` : retrieves all valid actions from the queue.
 * `removeAction` : removes a specific action from the queue.
 * `clearActions` : clears all actions from the queue.
 * `removeExpiredActions` : removes expired actions from the queue.

## Members

- **boxName**: `String`
  Offline Action Queue box name.

- **_actionsBox**: `Box&lt;CachedUserAction&gt;`
## Constructors

### Unnamed Constructor


