# Method: `watch`

## Description

Start watching the [FileSystemEntity] for changes.

 The implementation uses platform-dependent event-based APIs for receiving
 file-system notifications, thus behavior depends on the platform.

   * `Windows`: Uses `ReadDirectoryChangesW`. The implementation only
     supports watching directories. Recursive watching is supported.
   * `Linux`: Uses `inotify`. The implementation supports watching both
     files and directories. Recursive watching is not supported.
     Note: When watching files directly, delete events might not happen
     as expected.
   * `OS X`: Uses the
     [File System Events API](https://developer.apple.com/library/archive/documentation/Darwin/Conceptual/FSEvents_ProgGuide/TechnologyOverview/TechnologyOverview.html).
     The implementation supports watching both files and directories.
     Recursive watching is supported.
     This API has several limitations:

     * Changes that occurred shortly *before* the [watch] method was
       called may still appear in the [Stream].
     * Changes that occur in a short period of time may arrive
       out-of-order.
     * Multiple changes made in a single directory may be coalesced into
       a single `FileSystemEvent`.

 The system will start listening for events once the returned [Stream] is
 being listened to, not when the call to [watch] is issued.

 The returned value is an endless broadcast [Stream], that only stops when
 one of the following happens:

   * The [Stream] is canceled, e.g. by calling `cancel` on the
      [StreamSubscription].
   * The [FileSystemEntity] being watched is deleted.
   * System Watcher exits unexpectedly. e.g. On `Windows` this happens when
     buffer that receive events from `ReadDirectoryChangesW` overflows.

 Use `events` to specify what events to listen for. The constants in
 [FileSystemEvent] can be or'ed together to mix events. Default is
 [FileSystemEvent.all].

 A move event may be reported as separate delete and create events.

## Return Type
`Stream&lt;FileSystemEvent&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
