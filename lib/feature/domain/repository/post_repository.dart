import 'package:dartz/dartz.dart';
import 'package:flutter_dev/core/error/failure.dart';
import 'package:flutter_dev/feature/domain/entity/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getAllPost();
}