import 'package:flutter/material.dart';
import 'package:flutter_dev/feature/domain/entity/post_entity.dart';
import 'package:flutter_dev/feature/presentation/pages/post_detail_page.dart';
import 'package:flutter_dev/feature/presentation/widgets/cached_network_image.dart';

class PostCard extends StatelessWidget {
  final PostEntity postEntity;

  const PostCard({Key? key, required this.postEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => PostDetailPage(postEntity: postEntity)));
        },
        child: Column(
          children: [
            postEntity.thumbnail == 'self' || postEntity.thumbnail == 'default'
                ? Container()
                : PostCacheImage(imageUrl: postEntity.thumbnail, width: 150, height: 150),
            const SizedBox(width: 10),
            Text(postEntity.title, style: const TextStyle(fontSize: 25)),
          ],
        ),
      ),
    );
  }
}
