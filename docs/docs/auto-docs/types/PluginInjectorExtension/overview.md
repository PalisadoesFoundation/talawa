# Overview for `PluginInjectorExtension`

## Description

Injector extension for injecting widgets at specific locations.

## Members

- **pluginId**: `String`
  Owning plugin ID.

- **name**: `String`
  Extension name.

- **description**: `String?`
  Optional description.

- **builder**: `Widget Function(BuildContext context, )`
  Build function with optional data.

- **order**: `int`
  Ordering within a location (ascending).

## Constructors

### Unnamed Constructor


