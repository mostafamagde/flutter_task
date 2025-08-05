import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/result.dart';
import '../../data/models/post_model.dart';
import '../../domain/use_cases/get_posts_use_case/get_posts_use_case.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetPostsUseCase _getPostsUseCase;

  PostCubit(this._getPostsUseCase) : super(PostInitial());

  Future<void> getPosts() async {
    emit(PostLoading());
    final result = await _getPostsUseCase.call();
    if (result is Success) {
      emit(PostLoaded(result.data));
    } else if (result is Error) {
      emit(PostError(result.exception.toString()));
    }
  }
}
