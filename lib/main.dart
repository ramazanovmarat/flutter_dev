import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev/feature/presentation/cubit/post_cubit.dart';
import 'package:flutter_dev/feature/presentation/pages/home_page.dart';
import 'package:flutter_dev/locator_service.dart';
import 'locator_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostCubit>(
        create: (_) => sl<PostCubit>()..loadPost(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        )
    );
  }
}

