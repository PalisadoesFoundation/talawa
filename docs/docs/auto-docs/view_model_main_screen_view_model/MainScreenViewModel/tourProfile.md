


# tourProfile method








void tourProfile
()





<p>This function show the tutorial for the profile page.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void tourProfile() {
  targets.clear();
  targets.add(
    focusTarget(
      keyBNProfile,
      'keyBNProfile',
      'This is the Profile tab here you can see all options related to account, app setting, invitation, help etc',
      isCircle: true,
      align: ContentAlign.top,
      nextCrossAlign: CrossAxisAlignment.start,
    ),
  );
  targets.add(
    focusTarget(
      keySPAppSetting,
      'keySPAppSetting',
      'You can edit application settings like language, theme etc from here',
    ),
  );
  targets.add(
    focusTarget(
      keySPHelp,
      'keySPHelp',
      'For any help we are always there. You can reach us from here',
    ),
  );
  targets.add(
    focusTarget(
      keySPDonateUs,
      'keySPDonateUs',
      'To help your organization grow you can support them financially from here',
    ),
  );
  targets.add(
    focusTarget(
      keySPInvite,
      'keySPInvite',
      'Wanna invite colleague, invite them from here',
    ),
  );
  targets.add(
    focusTarget(
      keySPPalisadoes,
      'keySPPalisadoes',
      'You are all set to go lets get you in',
      isEnd: true,
    ),
  );
  showTutorial(
    onFinish: () {
      if (!tourComplete && !tourSkipped) {
        tourComplete = true;
        onTabTapped(0);
      }
    },
    onClickTarget: (TargetFocus a) {},
  );
}
```







