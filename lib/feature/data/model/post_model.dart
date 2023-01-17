import 'package:flutter_dev/feature/domain/entity/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    required thumbnail,
    required title,
    required ups,
    required selftext,
  }) : super(
    thumbnail: thumbnail,
    title: title,
    ups: ups,
    selftext: selftext,
  );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        thumbnail: json['data']['thumbnail'],
        title: json['data']['title'],
        ups: json['data']['ups'],
        selftext: json['data']['selftext'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thumbnail' : thumbnail,
      'title' : title,
      'ups' : ups,
      'selftext' : selftext,
    };
  }
}