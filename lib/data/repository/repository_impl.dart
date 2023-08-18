import 'package:dartz/dartz.dart';
import '../../data/mapper/mapper.dart';
import '../../data/network/Failure.dart';
import '../../domain/models/models.dart';
import '../../app/app_prefs.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final AppPreference _appPreference;

  RepositoryImpl(
      this._remoteDataSource, this._networkInfo, this._appPreference);

  @override
  Future<Either<Failure, ArticlesModel>> getArticles(
      String source, String apiKey) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getArticles(source, apiKey);
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
