import 'package:dartz/dartz.dart';
import 'package:link_development_task/domain/models/models.dart';

import '../../data/network/Failure.dart';

abstract class Repository {
  Future<Either<Failure, ArticlesModel>> getArticles(
      String source, String apiKey);
}
