
<div>

# saveUserInHive method

</div>


void 



save user in hive.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  final box = Hive.box<User>('currentUser');
  if (box.get('user') == null) {
    box.put('user', _currentUser!);
  } else {
    box.put('user', _currentUser!);
  }
}
```







1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  saveUserInHive method

##### UserConfig class







