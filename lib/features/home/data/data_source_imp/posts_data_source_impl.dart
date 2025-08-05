import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import '../../../../core/api_manager/api_constants.dart';
import '../../../../core/api_manager/api_manager.dart';
import '../../../../core/exceptions/exceptions_impl.dart';
import '../../../../core/models/error_data.dart';
import '../../../../core/models/result.dart';
import '../data_source/posts_data_source.dart';
import '../models/post_model.dart';

@Injectable(as: PostsDataSource)
class PostsDataSourceImpl implements PostsDataSource {
  final ApiManager apiManager;

  PostsDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<PostModel>>> getPosts() async {
    try {
      final response = await apiManager.get(ApiConstants.posts);

      if (response.statusCode == 200) {
        List<PostModel> posts =
            (response.data as List)
                .map((post) => PostModel.fromJson(post))
                .toList();
        return Success(posts);
      } else {
        return Error(CustomException("Unexpected error occurred"));
      }
    } catch (e) {
      if (e is DioException) {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.connectionError ||
            e.type == DioExceptionType.badCertificate) {
          return Error(NetworkError("Network timeout, please try again"));
        } else if (e.type == DioExceptionType.badResponse) {
          return Error(ClientError(ErrorModel.fromJson(e.response?.data)));
        } else {
          return Error(CustomException("An unexpected error occurred"));
        }
      } else {
        return Error(CustomException("An unexpected error occurred"));
      }
    }
  }
}
