import 'package:injectable/injectable.dart';

import '../../../../core/models/result.dart';
import '../../domain/posts_repo/posts_repo.dart';
import '../data_source/posts_data_source.dart';
import '../models/post_model.dart';
@Injectable(as: PostsRepo)
class PostsRepoImpl implements PostsRepo{
  final PostsDataSource _postsDataSource;
  PostsRepoImpl(this._postsDataSource);
  @override
  Future<Result<List<PostModel>>> getPosts() => _postsDataSource.getPosts();
}