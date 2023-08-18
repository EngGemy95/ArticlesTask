// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemResponse _$ItemResponseFromJson(Map<String, dynamic> json) => ItemResponse(
      json['author'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      json['url'] as String?,
      json['urlToImage'] as String?,
      json['publishedAt'] as String?,
    );

Map<String, dynamic> _$ItemResponseToJson(ItemResponse instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
    };

ArticlesResponse _$ArticlesResponseFromJson(Map<String, dynamic> json) =>
    ArticlesResponse(
      json['status'] as String?,
      json['source'] as String?,
      json['sortBy'] as String?,
      (json['articles'] as List<dynamic>?)
          ?.map((e) => ItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticlesResponseToJson(ArticlesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'source': instance.source,
      'sortBy': instance.sortBy,
      'articles': instance.articles,
    };
