import 'package:dio/dio.dart';
import 'package:link_development_task/data/response/response.dart';
import 'package:retrofit/http.dart';

import '../../app/constants.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String? baseUrl}) = _AppServiceClient;

  @GET("articles")
  Future<ArticlesResponse> getArticles(
    @Query("source") String source,
    @Query("apiKey") String apiKey,
  );
}
