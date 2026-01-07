# Method: `serialize`

## Description

Converts the given [PlatformMenuItem] into a data structure accepted by
 the 'flutter/menu' method channel method 'Menu.SetMenu'.

 This API is supplied so that implementers of [PlatformMenuItem] can share
 this implementation.

## Return Type
`Map&lt;String, Object?&gt;`

## Parameters

- `item`: `PlatformMenuItem`
- `delegate`: `PlatformMenuDelegate`
- `getId`: `MenuItemSerializableIdGenerator`
