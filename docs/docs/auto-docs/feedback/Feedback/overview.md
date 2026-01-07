# Overview for `Feedback`

## Description

Provides platform-specific acoustic and/or haptic feedback for certain
 actions.

 For example, to play the Android-typically click sound when a button is
 tapped, call [forTap]. For the Android-specific vibration when long pressing
 an element, call [forLongPress]. Alternatively, you can also wrap your
 [GestureDetector.onTap] or [GestureDetector.onLongPress] callback in
 [wrapForTap] or [wrapForLongPress] to achieve the same (see example code
 below).

 All methods in this class are usually called from within a
 [StatelessWidget.build] method or from a [State]'s methods as you have to
 provide a [BuildContext].

 

 To trigger platform-specific feedback before executing the actual callback:

 ```dart
 class WidgetWithWrappedHandler extends StatelessWidget 
 ```
 
 

 Alternatively, you can also call [forTap] or [forLongPress] directly within
 your tap or long press handler:

 ```dart
 class WidgetWithExplicitCall extends StatelessWidget 
 ```
 

