import 'package:flutter/material.dart';
import 'package:flutter_dev/feature/domain/entity/post_entity.dart';
import 'package:flutter_dev/feature/presentation/widgets/cached_network_image.dart';

class PostDetailPage extends StatelessWidget {
  final PostEntity postEntity;
  const PostDetailPage({Key? key, required this.postEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postEntity.title!),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                postEntity.thumbnail == "self" || postEntity.thumbnail == 'default'
                    ? Container()
                    : PostCacheImage(imageUrl: postEntity.thumbnail, width: 200, height: 200),
                const SizedBox(height: 15),
                Text('${postEntity.ups}', style: const TextStyle(fontSize: 25),),
                const SizedBox(height: 15),
                Text(postEntity.selftext),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
