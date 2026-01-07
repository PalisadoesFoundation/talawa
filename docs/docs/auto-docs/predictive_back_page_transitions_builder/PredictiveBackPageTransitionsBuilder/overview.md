# Overview for `PredictiveBackPageTransitionsBuilder`

## Description

Used by [PageTransitionsTheme] to define a [MaterialPageRoute] page
 transition animation that looks like the default page transition used on
 Android U and above when using predictive back.

 Currently predictive back is only supported on Android U and above, and if
 this [PageTransitionsBuilder] is used by any other platform, it will fall
 back to [ZoomPageTransitionsBuilder].

 When used on Android U and above, animates along with the back gesture to
 reveal the destination route. Can be canceled by dragging back towards the
 edge of the screen.

 See also:

  * [FadeUpwardsPageTransitionsBuilder], which defines a page transition
    that's similar to the one provided by Android O.
  * [OpenUpwardsPageTransitionsBuilder], which defines a page transition
    that's similar to the one provided by Android P.
  * [ZoomPageTransitionsBuilder], which defines the default page transition
    that's similar to the one provided in Android Q.
  * [CupertinoPageTransitionsBuilder], which defines a horizontal page
    transition that matches native iOS page transitions.

## Dependencies

- PageTransitionsBuilder

## Constructors

### Unnamed Constructor
Creates an instance of a [PageTransitionsBuilder] that matches Android U's
 predictive back transition.

