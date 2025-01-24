




printNavigatorState method - NavigationService class - navigation\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/navigation\_service.dart](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
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
2. [navigation\_service](../../services_navigation_service/services_navigation_service-library.html)
3. [NavigationService](../../services_navigation_service/NavigationService-class.html)
4. printNavigatorState method

##### NavigationService class





talawa
1.0.0+1






