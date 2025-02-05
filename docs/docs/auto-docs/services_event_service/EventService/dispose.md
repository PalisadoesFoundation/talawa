


# dispose method








void dispose
()





<p>This function is used to cancel the stream subscription of an organization.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void dispose() {
  _currentOrganizationStreamSubscription.cancel();
}
```







