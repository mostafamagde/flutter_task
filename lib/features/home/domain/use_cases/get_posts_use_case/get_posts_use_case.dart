import '../../../../../core/models/result.dart';
import 'package:injectable/injectable.dart';

import '../../posts_repo/posts_repo.dart';

@injectable
class GetPostsUseCase {
  final PostsRepo _getPostsRepository;
  GetPostsUseCase(this._getPostsRepository);
  Future<Result> call() => _getPostsRepository.getPosts();
}