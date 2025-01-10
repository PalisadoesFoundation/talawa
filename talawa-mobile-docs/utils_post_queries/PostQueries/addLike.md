


# addLike method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) addLike
()





<p>Add Like to a post.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>String</code>: The query related to addingLike</li>
</ul>



## Implementation

```dart
String addLike() {
  return """
   mutation likePost(\$postID: ID!) {
    likePost( id: \$postID,)
    {
      _id
    }
  }
""";
}
```







