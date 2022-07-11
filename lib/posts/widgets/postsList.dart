import 'package:bloc_jsonplaceholder/services/json_posts_services.dart';
import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({Key? key, required this.post}) : super(key: key);

  final Posts post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(post.id.toString()),
        Text(post.title),
        Text(post.body),
      ],
    );
  }
}
