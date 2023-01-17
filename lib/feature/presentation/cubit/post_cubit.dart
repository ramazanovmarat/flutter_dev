import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev/core/error/failure.dart';
import 'package:flutter_dev/feature/domain/usecase/get_all_post_use_case.dart';
import 'package:flutter_dev/feature/presentation/cubit/post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetAllPostUseCase getAllPostUseCase;

  PostCubit({required this.getAllPostUseCase}) : super(PostInitial());

  void loadPost() async {
    emit(PostLoading());

    final failureOrPost = await getAllPostUseCase.call();

    failureOrPost.fold(
            (error) => emit(PostError(message: _messageFailure(error))),
            (success) {
              print('List length: ${success.length.toString()}');
              emit(PostLoaded(success));
            });
  }

  String _messageFailure(Failure failure) {
    switch(failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}