import 'dart:convert';

import 'package:flutter_dev/core/error/exception.dart';
import 'package:flutter_dev/feature/data/model/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getPostCache();
  Future<void> postToCache(List<PostModel> posts);
}

const CACHED_POST_LIST = 'CACHED_POST_LIST';

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<PostModel>> getPostCache() {
    final jsonPostList = sharedPreferences.getStringList(CACHED_POST_LIST);
    if(jsonPostList!.isNotEmpty) {
      print('Get Post from Cache: ${jsonPostList.length}');
      return Future.value(jsonPostList.map((post) => PostModel.fromJson(jsonDecode(post))).toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> postToCache(List<PostModel> posts) {
    final List<String> jsonPostList = posts.map((post) => jsonEncode(post.toJson())).toList();

    sharedPreferences.setStringList(CACHED_POST_LIST, jsonPostList);
    print('Posts to write Cache: ${jsonPostList.length}');
    return Future.value(jsonPostList);
  }

}