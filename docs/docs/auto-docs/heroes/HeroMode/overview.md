# Overview for `HeroMode`

## Description

Enables or disables [Hero]es in the widget subtree.

 

 When [enabled] is false, all [Hero] widgets in this subtree will not be
 involved in hero animations.

 When [enabled] is true (the default), [Hero] widgets may be involved in
 hero animations, as usual.

## Dependencies

- StatelessWidget

## Members

- **child**: `Widget`
  The subtree to place inside the [HeroMode].

- **enabled**: `bool`
  Whether or not [Hero]es are enabled in this subtree.

 If this property is false, the [Hero]es in this subtree will not animate
 on route changes. Otherwise, they will animate as usual.

 Defaults to true.

## Constructors

### Unnamed Constructor
Creates a widget that enables or disables [Hero]es.

