import 'package:equatable/equatable.dart';

class CommunityPost {
  final int id;
  final String author;
  final String content;
  int likes;

  CommunityPost({required this.id, required this.author, required this.content, this.likes = 0});
}

abstract class CommunityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CommunityInitial extends CommunityState {}

class CommunityLoading extends CommunityState {}

class CommunityLoaded extends CommunityState {
  final List<CommunityPost> posts;

  CommunityLoaded({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class CommunityError extends CommunityState {
  final String errorMessage;

  CommunityError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
