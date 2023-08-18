import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class ItemResponse {
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "urlToImage")
  String? urlToImage;
  @JsonKey(name: "publishedAt")
  String? publishedAt;

  ItemResponse(
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
  );

  factory ItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemResponseToJson(this);
}

@JsonSerializable()
class ArticlesResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "source")
  String? source;
  @JsonKey(name: "sortBy")
  String? sortBy;
  @JsonKey(name: "articles")
  List<ItemResponse>? articles;

  ArticlesResponse(
    this.status,
    this.source,
    this.sortBy,
    this.articles,
  );

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesResponseToJson(this);
}
