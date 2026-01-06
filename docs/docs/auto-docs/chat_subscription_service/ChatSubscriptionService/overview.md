# Overview for `ChatSubscriptionService`

## Description

Provides real-time subscription services for chat messages.

 Services include:
 * `subscribeToChatMessages` - subscribes to real-time messages
 * `stopSubscription` - stops the current subscription

## Members

- **_dbFunctions**: `DataBaseMutationFunctions`
  Database mutation functions.

- **_chatMessagesStream**: `Stream&lt;ChatMessage&gt;`
  Stream for chat messages.

- **_chatMessageController**: `StreamController&lt;ChatMessage&gt;`
  Controller for chat messages stream.

- **_subscriptionCompleter**: `Completer&lt;void&gt;?`
  Completer to control subscription cancellation.

## Constructors

### Unnamed Constructor


