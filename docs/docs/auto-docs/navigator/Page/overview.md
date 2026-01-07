# Overview for `Page`

## Description

Describes the configuration of a [Route].

 The type argument `T` is the corresponding [Route]'s return type, as
 used by [Route.currentResult], [Route.popped], and [Route.didPop].

 The [canPop] and [onPopInvoked] are used for intercepting pops.

 
 This sample demonstrates how to use this [canPop] and [onPopInvoked] to
 intercept pops.

 ** See code in examples/api/lib/widgets/page/page_can_pop.0.dart **
 

 See also:

  * [Navigator.pages], which accepts a list of [Page]s and updates its routes
    history.

## Dependencies

- RouteSettings

## Members

- **key**: `LocalKey?`
  The key associated with this page.

 This key will be used for comparing pages in [canUpdate].

- **restorationId**: `String?`
  Restoration ID to save and restore the state of the [Route] configured by
 this page.

 If no restoration ID is provided, the [Route] will not restore its state.

 See also:

  * [RestorationManager], which explains how state restoration works in
    Flutter.

- **onPopInvoked**: `PopInvokedWithResultCallback&lt;T&gt;`
  Called after a pop on the associated route was handled.

 It's not possible to prevent the pop from happening at the time that this
 method is called; the pop has already happened. Use [canPop] to
 disable pops in advance.

 This will still be called even when the pop is canceled. A pop is canceled
 when the associated [Route.popDisposition] returns false, or when
 [canPop] is set to false. The `didPop` parameter indicates whether or not
 the back navigation actually happened successfully.

- **canPop**: `bool`
  When false, blocks the associated route from being popped.

 If this is set to false for first page in the Navigator. It prevents
 Flutter app from exiting.

 If there are any [PopScope] widgets in a route's widget subtree,
 each of their `canPop` must be `true`, in addition to this canPop, in
 order for the route to be able to pop.

## Constructors

### Unnamed Constructor
Creates a page and initializes [key] for subclasses.

