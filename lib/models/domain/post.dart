/// Minimal Post domain model for Comment references
/// Full Post model will be created in Part 3
class Post {
  const Post({
    required this.id,
    this.caption,
  });

  final String id;
  final String? caption;
}
