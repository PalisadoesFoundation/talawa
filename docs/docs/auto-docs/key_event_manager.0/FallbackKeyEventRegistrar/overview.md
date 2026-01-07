# Overview for `FallbackKeyEventRegistrar`

## Description

A singleton class that allows [FallbackFocus] to register fallback key
 event handlers.

 This class is initialized when [instance] is first called, at which time it
 patches [KeyEventManager.keyMessageHandler] with its own handler.

 A global registrar like [FallbackKeyEventRegistrar] is almost always needed
 when patching [KeyEventManager.keyMessageHandler]. This is because
 [FallbackFocus] will add and remove callbacks constantly, but
 [KeyEventManager.keyMessageHandler] can only be patched once, and can not
 be unpatched. Therefore [FallbackFocus] must not directly interact with
 [KeyEventManager.keyMessageHandler], but through a separate registrar that
 handles listening reversibly.

## Members

- **_initialized**: `bool`
- **_instance**: `FallbackKeyEventRegistrar`
- **_fallbackNodes**: `List&lt;FallbackFocusNode&gt;`
## Constructors

### _


