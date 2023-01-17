import 'package:dartz/dartz.dart';
import 'package:flutter_dev/core/error/failure.dart';
import 'package:flutter_dev/feature/domain/entity/post_entity.dart';
import 'package:flutter_dev/feature/domain/repository/post_repository.dart';

class GetAllPostUseCase{
  final PostRepository postRepository;

  GetAllPostUseCase(this.postRepository);

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await postRepository.getAllPost();
  }
}