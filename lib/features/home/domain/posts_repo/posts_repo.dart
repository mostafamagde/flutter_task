import '../../../../../core/models/result.dart';

import '../../data/models/post_model.dart';

abstract class PostsRepo {
  Future<Result<List<PostModel>>> getPosts();
}