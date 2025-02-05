


# iconButton method








[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) iconButton
([Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) icon, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) onTap)





<p>This widget returns the button for social media sharing option.</p>
<p>params:</p>
<ul>
<li><code>icon</code> : This is <code>Widget</code> type with icon details.</li>
<li><code>onTap</code> : This is <code>Function</code>, which invoke on tap.</li>
</ul>



## Implementation

```dart
Widget iconButton(Widget icon, Function onTap) {
  return Stack(
    children: [
      IconButton(
        onPressed: () {
          print('tapped');
          onTap();
        },
        icon: icon,
      ),
    ],
  );
}
```







