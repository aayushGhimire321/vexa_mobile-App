import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:vexa/app/constants/strings.dart';

import '../view_model/community_bloc.dart';
import '../view_model/community_event.dart';
import '../view_model/community_state.dart';

class CommunityScreen extends StatelessWidget {
  final TextEditingController postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommunityBloc()..add(LoadCommunityPosts()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.communityTitle),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<CommunityBloc, CommunityState>(
                builder: (context, state) {
                  if (state is CommunityLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CommunityLoaded) {
                    return ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        final post = state.posts[index];
                        return Card(
                          margin: EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(post.author),
                            subtitle: Text(post.content),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.thumb_up),
                                  onPressed: () {
                                    context.read<CommunityBloc>().add(LikePost(postId: post.id));
                                  },
                                ),
                                Text(post.likes.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is CommunityError) {
                    return Center(child: Text(state.errorMessage));
                  }

                  return Center(child: Text(AppStrings.genericErrorMessage));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: postController,
                      decoration: InputDecoration(
                        labelText: AppStrings.newPostPlaceholder,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (postController.text.isNotEmpty) {
                        context.read<CommunityBloc>().add(AddPost(content: postController.text));
                        postController.clear();
                      }
                    },
                    child: Text(AppStrings.postButton),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
