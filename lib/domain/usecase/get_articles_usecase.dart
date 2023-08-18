import 'package:dartz/dartz.dart';
import 'package:link_development_task/domain/models/models.dart';
import 'package:link_development_task/domain/usecase/base_usecase.dart';

import '../../data/network/Failure.dart';
import '../repository/repository.dart';

class GetArticlesUseCase extends BaseUseCase<GetArticlesInput, ArticlesModel> {
  final Repository _repository;

  GetArticlesUseCase(this._repository);

  @override
  Future<Either<Failure, ArticlesModel>> execute(GetArticlesInput input) async {
    return await _repository.getArticles(input.source, input.apiKey);
  }
}

class GetArticlesInput {
  String source;
  String apiKey;

  GetArticlesInput(this.source, this.apiKey);
}
