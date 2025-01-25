




pop method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/)
3. [NavigationService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/NavigationService-class.html)
4. pop method

pop


dark\_mode

light\_mode




# pop method


void
pop()

This function pops the current state.

**params**:
None

**returns**:
None


## Implementation

```
void pop() {
  if (navigatorKey.currentState?.canPop() ?? false) {
    return navigatorKey.currentState!.pop();
  }
}
```

 


1. [talawa](../../index.html)
2. [navigation\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/)
3. [NavigationService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/NavigationService-class.html)
4. pop method

##### NavigationService class





talawa
1.0.0+1






