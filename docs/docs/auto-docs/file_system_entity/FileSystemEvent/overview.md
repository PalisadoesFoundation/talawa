# Overview for `FileSystemEvent`

## Description

Base event class emitted by [FileSystemEntity.watch].

## Members

- **create**: `int`
  Bitfield for [FileSystemEntity.watch], to enable [FileSystemCreateEvent]s.

- **modify**: `int`
  Bitfield for [FileSystemEntity.watch], to enable [FileSystemModifyEvent]s.

- **delete**: `int`
  Bitfield for [FileSystemEntity.watch], to enable [FileSystemDeleteEvent]s.

- **move**: `int`
  Bitfield for [FileSystemEntity.watch], to enable [FileSystemMoveEvent]s.

- **all**: `int`
  Bitfield for [FileSystemEntity.watch], for enabling all of [create],
 [modify], [delete] and [move].

- **_modifyAttributes**: `int`
- **_deleteSelf**: `int`
- **_isDir**: `int`
- **type**: `int`
  The type of event. See [FileSystemEvent] for a list of events.

- **path**: `String`
  The path that triggered the event.

 Depending on the platform and the [FileSystemEntity], the path may be
 relative.

- **isDirectory**: `bool`
  Whether the event target is a directory.

 The value will always be `false` for [FileSystemDeleteEvent].

 On Windows, the value may also be `false` for a create, move or
 modify event on a directory, if that directory was deleted
 soon after this create, modify or move event occured.

## Constructors

### _


#### Parameters

- `type`: `dynamic`
- `path`: `dynamic`
- `isDirectory`: `dynamic`
