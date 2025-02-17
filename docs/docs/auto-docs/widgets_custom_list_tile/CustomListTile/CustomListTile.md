
<div>

# CustomListTile constructor

</div>


const CustomListTile({

1.  [required
    [[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)]
    key, ]
2.  [required
    [[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
    index, ]
3.  [required
    [[TileType](../../enums_enums/TileType.html)]
    type, ]
4.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
    showIcon = false,
    ]
5.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)?]
    orgInfo, ]
6.  [[[User](../../models_user_user_info/User-class.html)?]
    userInfo, ]
7.  [[[Attendee](../../models_events_event_model/Attendee-class.html)?]
    attendeeInfo, ]
8.  [[[Options](../../models_options_options/Options-class.html)?]
    option, ]
9.  [dynamic
    onTapOrgInfo(]
    1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]]

    )?,
10. [dynamic ?,
    ]
11. [dynamic
    ?, ]
12. [dynamic ?,
    ]

})



## Implementation

``` language-dart
const CustomListTile({
  required Key key,
  required this.index,
  required this.type,
  this.showIcon = false,
  this.orgInfo,
  this.userInfo,
  this.attendeeInfo,
  this.option,
  this.onTapOrgInfo,
  this.onTapUserInfo,
  this.onTapAttendeeInfo,
  this.onTapOption,
}) : super(key: key);
```







1.  [talawa](../../index.html)
2.  [custom_list_tile](../../widgets_custom_list_tile/)
3.  [CustomListTile](../../widgets_custom_list_tile/CustomListTile-class.html)
4.  CustomListTile const constructor

##### CustomListTile class







