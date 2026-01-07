# Overview for `TransitionDelegate`

## Description

The delegate that decides how pages added and removed from [Navigator.pages]
 transition in or out of the screen.

 This abstract class implements the API to be called by [Navigator] when it
 requires explicit decisions on how the routes transition on or off the screen.

 To make route transition decisions, subclass must implement [resolve].

 
 The following example demonstrates how to implement a subclass that always
 removes or adds routes without animated transitions and puts the removed
 routes at the top of the list.

 ```dart
 class NoAnimationTransitionDelegate extends TransitionDelegate&lt;void&gt; 

 ```
 

 See also:

  * [Navigator.transitionDelegate], which uses this class to make route
    transition decisions.
  * [DefaultTransitionDelegate], which implements the default way to decide
    how routes transition in or out of the screen.

## Constructors

### Unnamed Constructor
Creates a delegate and enables subclass to create a constant class.

