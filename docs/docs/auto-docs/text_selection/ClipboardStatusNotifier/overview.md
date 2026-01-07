# Overview for `ClipboardStatusNotifier`

## Description

A [ValueNotifier] whose [value] indicates whether the current contents of
 the clipboard can be pasted.

 The contents of the clipboard can only be read asynchronously, via
 [Clipboard.getData], so this maintains a value that can be used
 synchronously. Call [update] to asynchronously update value if needed.

## Dependencies

- ValueNotifier, WidgetsBindingObserver

## Members

- **_disposed**: `bool`
## Constructors

### Unnamed Constructor
Create a new ClipboardStatusNotifier.

