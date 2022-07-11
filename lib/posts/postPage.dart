import 'package:bloc_jsonplaceholder/posts/widgets/postsList.dart';
import 'package:bloc_jsonplaceholder/services/json_posts_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/post_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(RepositoryProvider.of<RecivePost>(context))
        ..add(PostFetchedEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("GET JSON DATA"),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PostLoadedState) {
              print(state);
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return PostListItem(post: state.posts[index]);
                },
              );
            }
            return const Center(
              child: Text('UNKNOWN ERROR OCCURED !'),
            );
          },
        ),
      ),
    );
  }
}
