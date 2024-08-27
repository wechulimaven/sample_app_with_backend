import 'package:flutter/material.dart';
import 'package:social_app/core/post_model.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (post.imageUrl != null)
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.network(
                      post.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              post.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'by ${post.author ?? 'Wechuli'} • ${post.createdAt!.toLocal()}',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              post.content,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
