




initialiseStream method - UserConfig class - user\_config library - Dart API







menu

1. [talawa](../../index.html)
2. [services/user\_config.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. initialiseStream method

initialiseStream


dark\_mode

light\_mode




# initialiseStream method


void
initialiseStream()

initialise.

**params**:
None

**returns**:
None


## Implementation

```
void initialiseStream() {
  _currentOrgInfoStream =
      _currentOrgInfoController.stream.asBroadcastStream();
}
```

 


1. [talawa](../../index.html)
2. [user\_config](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/)
3. [UserConfig](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_user_config/UserConfig-class.html)
4. initialiseStream method

##### UserConfig class





talawa
1.0.0+1






