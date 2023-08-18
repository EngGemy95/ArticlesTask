import 'package:link_development_task/app/extensions.dart';

import '../../app/constants.dart';
import '../../domain/models/models.dart';
import '../response/response.dart';

extension ItemsResponseMapper on ItemResponse? {
  ItemModel toDomain() {
    return ItemModel(
      this?.author.orEmpty() ?? Constants.empty,
      this?.title.orEmpty() ?? Constants.empty,
      this?.description.orEmpty() ?? Constants.empty,
      this?.url.orEmpty() ?? Constants.empty,
      this?.urlToImage.orEmpty() ?? Constants.empty,
      this?.publishedAt.orEmpty() ?? Constants.empty,
    );
  }
}

extension GetArticlesResponseMapper on ArticlesResponse? {
  ArticlesModel toDomain() {
    List<ItemModel> articles =
        (this?.articles?.map((itemResponse) => itemResponse.toDomain()) ??
                const Iterable.empty())
            .toList();
    return ArticlesModel(
        this?.status.orEmpty() ?? Constants.empty,
        this?.source.orEmpty() ?? Constants.empty,
        this?.sortBy.orEmpty() ?? Constants.empty,
        articles);
  }
}
