


# tourEventTargets method








void tourEventTargets
()





<p>This function show the tutorial for Events.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void tourEventTargets() {
  targets.clear();
  targets.add(
    focusTarget(
      keyBNEvents,
      'keyBNEvents',
      'This is the Events tab here you can see all event related information of the current selected organization',
      isCircle: true,
      align: ContentAlign.top,
    ),
  );
  targets.add(
    focusTarget(
      keySECategoryMenu,
      'keySECategoryMenu',
      'Filter Events based on categories',
    ),
  );
  targets.add(
    focusTarget(
      keySEDateFilter,
      'keySEDateFilter',
      'Filter Events between selected dates',
    ),
  );
  targets.add(
    focusTarget(
      keySECard,
      'keySECard',
      'Description of event to see more details click on the card',
    ),
  );
  targets.add(
    focusTarget(
      keySEAdd,
      'keySEAdd',
      'You can create a new event from here',
      align: ContentAlign.top,
    ),
  );
  showTutorial(
    onFinish: () {
      onTabTapped(currentPageIndex + 1);
      if (!tourComplete && !tourSkipped) {
        tourAddPost();
      }
    },
    onClickTarget: (TargetFocus a) {},
  );
}
```







