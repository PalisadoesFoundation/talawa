# Overview for `Hero`

## Description

A widget that marks its child as being a candidate for
 [hero animations](https://docs.flutter.dev/ui/animations/hero-animations).

 When a [PageRoute] is pushed or popped with the [Navigator], the entire
 screen's content is replaced. An old route disappears and a new route
 appears. If there's a common visual feature on both routes then it can
 be helpful for orienting the user for the feature to physically move from
 one page to the other during the routes' transition. Such an animation
 is called a *hero animation*. The hero widgets "fly" in the Navigator's
 overlay during the transition and while they're in-flight they're, by
 default, not shown in their original locations in the old and new routes.

 To label a widget as such a feature, wrap it in a [Hero] widget. When
 navigation happens, the [Hero] widgets on each route are identified
 by the [HeroController]. For each pair of [Hero] widgets that have the
 same tag, a hero animation is triggered.

 If a [Hero] is already in flight when navigation occurs, its
 flight animation will be redirected to its new destination. The
 widget shown in-flight during the transition is, by default, the
 destination route's [Hero]'s child.

 For a Hero animation to trigger, the Hero has to exist on the very first
 frame of the new page's animation.

 Routes must not contain more than one [Hero] for each [tag].

 

 
 This sample shows a [Hero] used within a [ListTile].

 Tapping on the Hero-wrapped rectangle triggers a hero
 animation as a new [MaterialPageRoute] is pushed. Both the size
 and location of the rectangle animates.

 Both widgets use the same [Hero.tag].

 The Hero widget uses the matching tags to identify and execute this
 animation.

 ** See code in examples/api/lib/widgets/heroes/hero.0.dart **
 

 
 This sample shows [Hero] flight animations using default tween
 and custom rect tween.

 ** See code in examples/api/lib/widgets/heroes/hero.1.dart **
 

 ## Discussion

 Heroes and the [Navigator]'s [Overlay] [Stack] must be axis-aligned for
 all this to work. The top left and bottom right coordinates of each animated
 Hero will be converted to global coordinates and then from there converted
 to that [Stack]'s coordinate space, and the entire Hero subtree will, for
 the duration of the animation, be lifted out of its original place, and
 positioned on that stack. If the [Hero] isn't axis aligned, this is going to
 fail in a rather ugly fashion. Don't rotate your heroes!

 To make the animations look good, it's critical that the widget tree for the
 hero in both locations be essentially identical. The widget of the *target*
 is, by default, used to do the transition: when going from route A to route
 B, route B's hero's widget is placed over route A's hero's widget. Additionally,
 if the [Hero] subtree changes appearance based on an [InheritedWidget] (such
 as [MediaQuery] or [Theme]), then the hero animation may have discontinuity
 at the start or the end of the animation because route A and route B provides
 different such [InheritedWidget]s. Consider providing a custom [flightShuttleBuilder]
 to ensure smooth transitions. The default [flightShuttleBuilder] interpolates
 [MediaQuery]'s paddings. If your [Hero] widget uses custom [InheritedWidget]s
 and displays a discontinuity in the animation, try to provide custom in-flight
 transition using [flightShuttleBuilder].

 By default, both route A and route B's heroes are hidden while the
 transitioning widget is animating in-flight above the 2 routes.
 [placeholderBuilder] can be used to show a custom widget in their place
 instead once the transition has taken flight.

 During the transition, the transition widget is animated to route B's hero's
 position, and then the widget is inserted into route B. When going back from
 B to A, route A's hero's widget is, by default, placed over where route B's
 hero's widget was, and then the animation goes the other way.

 ### Nested Navigators

 If either or both routes contain nested [Navigator]s, only [Hero]es
 contained in the top-most routes (as defined by [Route.isCurrent]) *of those
 nested [Navigator]s* are considered for animation. Just like in the
 non-nested case the top-most routes containing these [Hero]es in the nested
 [Navigator]s have to be [PageRoute]s.

 ## Parts of a Hero Transition

 ![Diagrams with parts of the Hero transition.](https://flutter.github.io/assets-for-api-docs/assets/interaction/heroes.png)

## Dependencies

- StatefulWidget

## Members

- **tag**: `Object`
  The identifier for this particular hero. If the tag of this hero matches
 the tag of a hero on a [PageRoute] that we're navigating to or from, then
 a hero animation will be triggered.

- **createRectTween**: `CreateRectTween?`
  Defines how the destination hero's bounds change as it flies from the starting
 route to the destination route.

 A hero flight begins with the destination hero's [child] aligned with the
 starting hero's child. The [Tween&lt;Rect&gt;] returned by this callback is used
 to compute the hero's bounds as the flight animation's value goes from 0.0
 to 1.0.

 If this property is null, the default, then the value of
 [HeroController.createRectTween] is used. The [HeroController] created by
 [MaterialApp] creates a [MaterialRectArcTween].

- **child**: `Widget`
  The widget subtree that will "fly" from one route to another during a
 [Navigator] push or pop transition.

 The appearance of this subtree should be similar to the appearance of
 the subtrees of any other heroes in the application with the same [tag].
 Changes in scale and aspect ratio work well in hero animations, changes
 in layout or composition do not.

 

- **flightShuttleBuilder**: `HeroFlightShuttleBuilder?`
  Optional override to supply a widget that's shown during the hero's flight.

 This in-flight widget can depend on the route transition's animation as
 well as the incoming and outgoing routes' [Hero] descendants' widgets and
 layout.

 When both the source and destination [Hero]es provide a [flightShuttleBuilder],
 the destination's [flightShuttleBuilder] takes precedence.

 If none is provided, the destination route's Hero child is shown in-flight
 by default.

 ## Limitations

 If a widget built by [flightShuttleBuilder] takes part in a [Navigator]
 push transition, that widget or its descendants must not have any
 [GlobalKey] that is used in the source Hero's descendant widgets. That is
 because both subtrees will be included in the widget tree during the Hero
 flight animation, and [GlobalKey]s must be unique across the entire widget
 tree.

 If the said [GlobalKey] is essential to your application, consider providing
 a custom [placeholderBuilder] for the source Hero, to avoid the [GlobalKey]
 collision, such as a builder that builds an empty [SizedBox], keeping the
 Hero [child]'s original size.

- **placeholderBuilder**: `HeroPlaceholderBuilder?`
  Placeholder widget left in place as the Hero's [child] once the flight takes
 off.

 By default the placeholder widget is an empty [SizedBox] keeping the Hero
 child's original size, unless this Hero is a source Hero of a [Navigator]
 push transition, in which case [child] will be a descendant of the placeholder
 and will be kept [Offstage] during the Hero's flight.

- **transitionOnUserGestures**: `bool`
  Whether to perform the hero transition if the [PageRoute] transition was
 triggered by a user gesture, such as a back swipe on iOS.

 If [Hero]es with the same [tag] on both the from and the to routes have
 [transitionOnUserGestures] set to true, a back swipe gesture will
 trigger the same hero animation as a programmatically triggered push or
 pop.

 The route being popped to or the bottom route must also have
 [PageRoute.maintainState] set to true for a gesture triggered hero
 transition to work.

 Defaults to false.

## Constructors

### Unnamed Constructor
Create a hero.

 The [child] parameter and all of the its descendants must not be [Hero]es.

