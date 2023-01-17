import 'package:flutter_dev/core/network_info/network_info.dart';
import 'package:flutter_dev/feature/data/data_source/post_local_data_source.dart';
import 'package:flutter_dev/feature/data/data_source/post_remote_data_source.dart';
import 'package:flutter_dev/feature/data/repository/post_repository_impl.dart';
import 'package:flutter_dev/feature/domain/repository/post_repository.dart';
import 'package:flutter_dev/feature/domain/usecase/get_all_post_use_case.dart';
import 'package:flutter_dev/feature/presentation/cubit/post_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerFactory(() => PostCubit(getAllPostUseCase: sl<GetAllPostUseCase>()));

  sl.registerLazySingleton(() => GetAllPostUseCase(sl()));

  sl.registerLazySingleton<PostRepository>(() =>
      PostRepositoryImpl(
          remoteDataSource: sl(),
          localDataSource: sl(),
          networkInfo: sl()));

  sl.registerLazySingleton<PostRemoteDataSource>(() => PostRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<PostLocalDataSource>(() => PostLocalDataSourceImpl(sharedPreferences: sl()));
  
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  final preference = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preference);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}