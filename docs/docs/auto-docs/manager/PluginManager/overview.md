# Overview for `PluginManager`

## Description

A thin manager that wires the registry with bundled plugins.

## Members

- **registry**: `PluginRegistry`
  Underlying registry instance.

- **_initialized**: `bool`
- **instance**: `PluginManager`
  Global singleton instance for app-wide plugin access.

## Constructors

### Unnamed Constructor
Creates a new plugin manager.

 **params**:
 * `registry`: Registry to store activated plugins.

