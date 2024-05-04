


# tourAddPost method








void tourAddPost
()





<p>This function show the tutorial to add Post in the organization.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void tourAddPost() {
  targets.clear();
  targets.add(
    focusTarget(
      keyBNPost,
      'keyBNPost',
      'This is the Create post tab here you can add post to the current selected organization',
      isCircle: true,
      align: ContentAlign.top,
    ),
  );
  showTutorial(
    onFinish: () {
      onTabTapped(currentPageIndex + 1);
      if (!tourComplete && !tourSkipped) {
        tourChat();
      }
    },
    onClickTarget: (TargetFocus a) {},
  );
}
```







