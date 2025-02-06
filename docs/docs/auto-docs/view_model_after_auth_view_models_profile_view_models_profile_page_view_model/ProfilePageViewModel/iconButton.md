


# iconButton method








[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) iconButton
([Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) icon, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) onTap)





<p>This widget returns the button for social media sharing option.</p>
<p>params:</p>
<ul>
<li>```darticon``` : This is ```dartWidget``` type with icon details.</li>
<li>```dartonTap``` : This is ```dartFunction```, which invoke on tap.</li>
</ul>



## Implementation

```dart
Widget iconButton(Widget icon, Function onTap) \{
  return Stack(
    children: [
      IconButton(
        onPressed: () \{
          print('tapped');
          onTap();
        \},
        icon: icon,
      ),
    ],
  );
\}
```







