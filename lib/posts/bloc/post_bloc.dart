import 'package:bloc/bloc.dart';
import 'package:bloc_jsonplaceholder/services/json_posts_services.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final RecivePost _recivePost;
  PostBloc(this._recivePost) : super(PostLoadingState()) {
    on<PostFetchedEvent>((event, emit) async {
      PostLoadingState();
      final myposts = await _recivePost.getposts();
      emit(PostLoadedState(posts: myposts));
    });
  }
}
