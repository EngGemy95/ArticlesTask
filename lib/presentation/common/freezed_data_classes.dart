import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class GetArticlesObject with _$GetArticlesObject {
  factory GetArticlesObject(String source, String apiKey) = _GetArticlesObject;
}
