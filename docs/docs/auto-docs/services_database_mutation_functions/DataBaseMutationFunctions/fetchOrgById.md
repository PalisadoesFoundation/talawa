


# fetchOrgById method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html) fetchOrgById
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) id)





<p>This function fetch the organization using the <code>id</code> passed.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>id</code>: id that identifies a particular org</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;dynamic&gt;</code>: it returns Future of dynamic</li>
</ul>



## Implementation

```dart
Future<dynamic> fetchOrgById(String id) async {
  final QueryResult result = await clientNonAuth
      .mutate(MutationOptions(document: gql(_query.fetchOrgById(id))));
  // if there is an error or exception in [result]
  if (result.hasException) {
    final exception = encounteredExceptionOrError(result.exception!);
    if (exception!) {
      fetchOrgById(id);
    }
  } else if (result.data != null && result.isConcrete) {
    return OrgInfo.fromJson(
      // ignore: collection_methods_unrelated_type
      (result.data!['organizations'] as Map<String, dynamic>)[0]
          as Map<String, dynamic>,
    );
  }
  return false;
}
```







