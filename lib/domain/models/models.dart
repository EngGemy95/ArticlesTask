class ItemModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;

  ItemModel(
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  );
}

class ArticlesModel {
  String status;
  String source;
  String sortBy;
  List<ItemModel> articles;

  ArticlesModel(
    this.status,
    this.source,
    this.sortBy,
    this.articles,
  );
}
