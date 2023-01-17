import 'package:dartz/dartz.dart';
import 'package:flutter_dev/core/error/exception.dart';
import 'package:flutter_dev/core/error/failure.dart';
import 'package:flutter_dev/core/network_info/network_info.dart';
import 'package:flutter_dev/feature/data/data_source/post_local_data_source.dart';
import 'package:flutter_dev/feature/data/data_source/post_remote_data_source.dart';
import 'package:flutter_dev/feature/domain/entity/post_entity.dart';
import 'package:flutter_dev/feature/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl({
      required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo
  });

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPost() async {
    if(await networkInfo.isConnected) {
      try {
        final remotePost = await remoteDataSource.getAllPosts();
        localDataSource.postToCache(remotePost);
        return Right(remotePost);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPost = await localDataSource.getPostCache();
        return Right(localPost);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}