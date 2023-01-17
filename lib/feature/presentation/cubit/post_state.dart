import 'package:equatable/equatable.dart';
import 'package:flutter_dev/feature/domain/entity/post_entity.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostInitial extends PostState {
@override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostLoading extends PostState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PostLoaded extends PostState {
  final List<PostEntity> postsList;

  const PostLoaded(this.postsList);

  @override
  // TODO: implement props
  List<Object?> get props => [postsList];
}

class PostError extends PostState {
  final String message;

  const PostError({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}