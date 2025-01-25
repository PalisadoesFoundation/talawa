




iconButton method - ProfilePageViewModel class - profile\_page\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/after\_auth\_view\_models/profile\_view\_models/profile\_page\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3. [ProfilePageViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. iconButton method

iconButton


dark\_mode

light\_mode




# iconButton method


dynamic
iconButton(

1. dynamic icon,
2. void onTap()

)

This widget returns the button for social media sharing option.

**params**:

* `icon`: This is Widget type with icon details.
* `onTap`: This is Function which invoke on tap.

**returns**:

* `Widget`: Icon Button

## Implementation

```
Widget iconButton(Widget icon, void Function() onTap) {
  return Stack(
    children: [
      IconButton(
        key: const Key('iconbtn1'),
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

 


1. [talawa](../../index.html)
2. [profile\_page\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/)
3. [ProfilePageViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_after_auth_view_models_profile_view_models_profile_page_view_model/ProfilePageViewModel-class.html)
4. iconButton method

##### ProfilePageViewModel class





talawa
1.0.0+1






