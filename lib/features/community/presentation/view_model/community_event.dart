import 'package:equatable/equatable.dart';

abstract class CommunityEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCommunityPosts extends CommunityEvent {}

class AddPost extends CommunityEvent {
  final String content;

  AddPost({required this.content});

  @override
  List<Object?> get props => [content];
}

class LikePost extends CommunityEvent {
  final int postId;

  LikePost({required this.postId});

  @override
  List<Object?> get props => [postId];
}
