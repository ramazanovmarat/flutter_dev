import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev/feature/presentation/cubit/post_cubit.dart';
import 'package:flutter_dev/feature/presentation/cubit/post_state.dart';
import 'package:flutter_dev/feature/presentation/widgets/post_card_widget.dart';

class PostList extends StatefulWidget {
  const PostList({Key? key}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {

  Future<void> _refresh(BuildContext context) async {
    return BlocProvider.of<PostCubit>(context).loadPost();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if(state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          }
         if(state is PostError) {
            return Center(child: Text(state.message));
          }
          else if(state is PostLoaded) {
            return RefreshIndicator(
              onRefresh: () {
                return _refresh(context);
              },
              child: ListView.separated(
                itemCount: state.postsList.length,
                itemBuilder: (context, index) {
                  return PostCard(postEntity: state.postsList[index]);
                },
                separatorBuilder: (context, index) =>
                const Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Divider(thickness: 2, color: Colors.black)),
              ),
            );
          }
          return const SizedBox();
        }
    );
  }
}
