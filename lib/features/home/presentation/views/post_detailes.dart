import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/data/models/post_model.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post Details",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Divider(thickness: 1, height: 48),

              Text(post.body, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
