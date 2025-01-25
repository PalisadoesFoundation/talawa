




printNavigatorState method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/)
3. [NavigationService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/NavigationService-class.html)
4. printNavigatorState method

printNavigatorState


dark\_mode

light\_mode




# printNavigatorState method


void
printNavigatorState()

This function prints current navigation state.

**params**:
None

**returns**:
None


## Implementation

```
void printNavigatorState() {
  final navigatorState = navigatorKey.currentState;
  if (navigatorState != null) {
    print('Can pop: ${navigatorState.canPop()}');
    print('Current Route: ${navigatorState.widget}');
    print('Navigator Stack: ${navigatorState.widget}');
    print(
      'Route History: ${navigatorState.widget.pages.map((page) => page.toString()).toList()}',
    );
  }
}
```

 


1. [talawa](../../index.html)
2. [navigation\_service](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/)
3. [NavigationService](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_services_navigation_service/NavigationService-class.html)
4. printNavigatorState method

##### NavigationService class





talawa
1.0.0+1






