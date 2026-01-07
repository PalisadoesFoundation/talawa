# Overview for `ShortcutRegistryEntry`

## Description

A entry returned by [ShortcutRegistry.addAll] that allows the caller to
 identify the shortcuts they registered with the [ShortcutRegistry] through
 the [ShortcutRegistrar].

 When the entry is no longer needed, [dispose] should be called, and the
 entry should no longer be used.

## Members

- **registry**: `ShortcutRegistry`
  The [ShortcutRegistry] that this entry was issued by.

## Constructors

### _


#### Parameters

- `registry`: `dynamic`
