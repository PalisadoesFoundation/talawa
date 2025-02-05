


# getPostCreatedDuration method








[String](https://api.flutter.dev/flutter/dart-core/String-class.html) getPostCreatedDuration
()





<p>this is to get duration of post.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>String</code>: date is returned in ago form.</li>
</ul>



## Implementation

```dart
String getPostCreatedDuration() {
  if (DateTime.now().difference(this.createdAt!).inSeconds < 60) {
    return '${DateTime.now().difference(this.createdAt!).inSeconds} Seconds Ago';
  } else if (DateTime.now().difference(this.createdAt!).inMinutes < 60) {
    return '${DateTime.now().difference(this.createdAt!).inMinutes} Minutes Ago';
  } else if (DateTime.now().difference(this.createdAt!).inHours < 24) {
    return '${DateTime.now().difference(this.createdAt!).inHours} Hours Ago';
  } else if (DateTime.now().difference(this.createdAt!).inDays < 30) {
    return '${DateTime.now().difference(this.createdAt!).inDays} Days Ago';
  } else if (DateTime.now().difference(this.createdAt!).inDays < 365) {
    return '${DateTime.now().difference(this.createdAt!).inDays ~/ 30} Months Ago';
  } else {
    return '${DateTime.now().difference(this.createdAt!).inDays ~/ 365} Years Ago';
  }
}
```







