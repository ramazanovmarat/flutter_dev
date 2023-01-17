import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String thumbnail;
  final String title;
  final int ups;
  final String selftext;

  const PostEntity({
      required this.thumbnail,
      required this.title,
      required this.ups,
      required this.selftext
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    thumbnail,
    title,
    ups,
    selftext,
  ];
}