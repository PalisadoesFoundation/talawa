
<div>

# printNavigatorState method

</div>


void 



This function prints current navigation state.

**params**: None

**returns**: None



## Implementation

``` language-dart
void  {
  final navigatorState = navigatorKey.currentState;
  if (navigatorState != null) {
    print('Can pop: ${navigatorState.}');
    print('Current Route: ${navigatorState.widget}');
    print('Navigator Stack: ${navigatorState.widget}');
    print(
      'Route History: ${navigatorState.widget.pages.map((page) => page.).}',
    );
  }
}
```







1.  [talawa](../../index.md)
2.  [navigation_service](../../services_navigation_service/)
3.  [NavigationService](../../services_navigation_service/NavigationService-class.md)
4.  printNavigatorState method

##### NavigationService class







