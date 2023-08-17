


# removeLike method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) removeLike
()





<p>Remove Like from a post.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>String</code>: The query related to removingLike</li>
</ul>



## Implementation

```dart
String removeLike() {
  return """
   mutation unlikePost(\$postID: ID!) {
    unlikePost( id: \$postID,)
    {
      _id
      likedBy{
      _id
      }
    }
  }
""";
}
```







