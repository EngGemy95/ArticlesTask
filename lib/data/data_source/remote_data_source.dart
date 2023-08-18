import 'package:link_development_task/data/response/response.dart';
import '../network/app_api.dart';

abstract class RemoteDataSource {
  Future<ArticlesResponse> getArticles(String source, String apiKey);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<ArticlesResponse> getArticles(String source, String apiKey) async {
    return await _appServiceClient.getArticles(source, apiKey);
  }
}
