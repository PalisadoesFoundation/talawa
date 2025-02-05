


# switchTheme method








void switchTheme
({required [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isOn})





<p>This function switches the app theme.</p>
<ul>
<li><code>Dart</code> -&gt; <code>Light</code></li>
<li><code>Light</code> -&gt; <code>Dark</code></li>
</ul>



## Implementation

```dart
void switchTheme({required bool isOn}) {
  _isDarkMode = isOn;
  _saveToPrefs();
  notifyListeners();
}
```







