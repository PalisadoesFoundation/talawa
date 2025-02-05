


# uploadPost method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) uploadPost
()





<p>Upload a post to database.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>String</code>: The query related to uploadingPost.</li>
</ul>



## Implementation

```dart
String uploadPost() {
  return '''
  mutation CreatePost(
  \$text: String!
  \$title: String!
  \$imageUrl: URL
  \$videoUrl: URL
  \$organizationId: ID!
) {
  createPost(
    data: {
      text: \$text
      title: \$title
      imageUrl: \$imageUrl
      videoUrl: \$videoUrl
      organizationId: \$organizationId
    }
  ) {
    _id
  }
}
  ''';
}
```







