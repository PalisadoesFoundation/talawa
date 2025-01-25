




saveUserInHive method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. saveUserInHive method

saveUserInHive


dark\_mode

light\_mode




# saveUserInHive method


void
saveUserInHive()

save user in hive.

**params**:
None

**returns**:
None


## Implementation

```
void saveUserInHive() {
  final box = Hive.box<User>('currentUser');
  if (box.get('user') == null) {
    box.put('user', _currentUser!);
  } else {
    box.put('user', _currentUser!);
  }
}
```

 


1. [talawa](../../index.html)
2. [user\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. saveUserInHive method

##### UserConfig class





talawa
1.0.0+1






