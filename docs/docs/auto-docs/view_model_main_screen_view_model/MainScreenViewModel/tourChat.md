


# tourChat method








void tourChat
()





<p>This function show the tour of chats.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void tourChat() {
  targets.clear();
  targets.add(
    focusTarget(
      keyBNChat,
      'keyBNChat',
      'This is the Chat tab here you can see all your messages of the current selected organization',
      isCircle: true,
      align: ContentAlign.top,
    ),
  );
  showTutorial(
    onFinish: () {
      onTabTapped(currentPageIndex + 1);
      if (!tourComplete && !tourSkipped) {
        tourProfile();
      }
    },
    onClickTarget: (TargetFocus a) {},
  );
}
```







