


# onTabTapped method








void onTabTapped
([int](https://api.flutter.dev/flutter/dart-core/int-class.html) index)





<p>Handles click on <a href="https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html">BottomNavigationBarItem</a>.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>index</code>: it is track of current page index.</li>
</ul>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void onTabTapped(int index) {
  currentPageIndex = index;
  notifyListeners();
}
```







