


# switchTheme method








void switchTheme
(\{required [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) isOn\})





<p>This function switches the app theme.</p>
<ul>
<li>```dartDart``` -&gt; ```dartLight```</li>
<li>```dartLight``` -&gt; ```dartDark```</li>
</ul>



## Implementation

```dart
void switchTheme(\{required bool isOn\}) \{
  _isDarkMode = isOn;
  _saveToPrefs();
  notifyListeners();
\}
```







