import 'package:bloc/bloc.dart';
import 'community_event.dart';
import 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc() : super(CommunityInitial()) {
    on<LoadCommunityPosts>(_onLoadCommunityPosts);
    on<AddPost>(_onAddPost);
    on<LikePost>(_onLikePost);
  }

  List<CommunityPost> _posts = [];

  void _onLoadCommunityPosts(LoadCommunityPosts event, Emitter<CommunityState> emit) {
    emit(CommunityLoading());
    // Simulate fetching posts from a server or database
    _posts = [
      CommunityPost(id: 1, author: "Alice", content: "This is my first post!", likes: 5),
      CommunityPost(id: 2, author: "Bob", content: "Welcome to the community!", likes: 3),
    ];
    emit(CommunityLoaded(posts: _posts));
  }

  void _onAddPost(AddPost event, Emitter<CommunityState> emit) {
    final newPost = CommunityPost(
      id: _posts.length + 1,
      author: "You",
      content: event.content,
      likes: 0,
    );
    _posts.add(newPost);
    emit(CommunityLoaded(posts: _posts));
  }

  void _onLikePost(LikePost event, Emitter<CommunityState> emit) {
    final postIndex = _posts.indexWhere((post) => post.id == event.postId);
    if (postIndex != -1) {
      _posts[postIndex].likes++;
      emit(CommunityLoaded(posts: _posts));
    }
  }
}
