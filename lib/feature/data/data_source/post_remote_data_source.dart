import 'dart:convert';

import 'package:flutter_dev/core/error/exception.dart';
import 'package:flutter_dev/feature/data/model/post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getAllPosts() async {
    var url = 'https://www.reddit.com/r/flutterdev/new.json';
    final response = await client.get(
        Uri.parse(url), headers: {'Content-Type': 'application/json'});
    print('Url: $url');
    if(response.statusCode == 200) {
      final posts = jsonDecode(response.body);
      return (posts['data']['children'] as List).map((post) => PostModel.fromJson(post)).toList();
    } else {
      throw ServerException();
    }
  }
}