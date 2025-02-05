


# showHome method








void showHome
([TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/TargetFocus-class.html) clickedTarget)





<p>This function shows the Home screen.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>clickedTarget</code>: object to identify clickedTarget.</li>
</ul>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void showHome(TargetFocus clickedTarget) {
  switch (clickedTarget.identify) {
    case "keySHMenuIcon":
      scaffoldKey.currentState!.openDrawer();
      break;
    case "keyDrawerLeaveCurrentOrg":
      navigationService.pop();
  }
}
```







