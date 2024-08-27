// lib/models/post.dart
class Post {
  final String title;
  final String? author;
  final String content;
  final String? imageUrl;
  final DateTime? createdAt;

  Post({
    required this.title,
    this.author,
    required this.content,
    this.imageUrl,
    this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      author: json['author'],
      content: json['content'],
      imageUrl: json['image_file'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'content': content,
    };
  }
}
