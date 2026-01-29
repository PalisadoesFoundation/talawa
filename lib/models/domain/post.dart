/// Minimal Post domain model for Comment references.
///
/// Full Post model will be created in Part 3.
class Post {
  const Post({
    required this.id,
    this.caption,
  });

  /// Unique identifier for the post.
  final String id;

  /// Optional caption describing the post.
  final String? caption;
}
