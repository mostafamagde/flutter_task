
import '../../../../core/models/result.dart';
import '../models/post_model.dart';

abstract class PostsDataSource {
  Future<Result<List<PostModel>>> getPosts();

}