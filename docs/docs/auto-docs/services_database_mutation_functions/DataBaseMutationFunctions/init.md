


# init method








void init
()





<p>initialization function.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void init() {
  clientNonAuth = graphqlConfig.clientToQuery();
  clientAuth = graphqlConfig.authClient();
  _query = Queries();
}
```







