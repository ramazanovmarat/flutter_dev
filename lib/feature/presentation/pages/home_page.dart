import 'package:flutter/material.dart';
import 'package:flutter_dev/feature/presentation/widgets/post_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dev'),
        centerTitle: true,
      ),
      body: const PostList(),
    );
  }
}
