# Method: `serialize`

## Description

Converts the supplied object to the correct channel representation for the
 'flutter/menu' channel.

 This API is supplied so that implementers of [PlatformMenu] can share
 this implementation.

## Return Type
`Map&lt;String, Object?&gt;`

## Parameters

- `item`: `PlatformMenu`
- `delegate`: `PlatformMenuDelegate`
- `getId`: `MenuItemSerializableIdGenerator`
