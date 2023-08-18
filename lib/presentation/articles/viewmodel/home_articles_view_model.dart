import 'dart:async';

import 'package:link_development_task/app/constants.dart';
import 'package:link_development_task/domain/usecase/get_articles_usecase.dart';
import 'package:link_development_task/presentation/base/base_viewmodel.dart';
import '../../../app/app_prefs.dart';
import '../../../data/network/Failure.dart';
import '../../../domain/models/models.dart';
import '../../common/freezed_data_classes.dart';

class HomeArticlesViewModel extends BaseViewModel
    with HomeArticlesViewModelInput, HomeArticlesViewModelOutput {
  final StreamController<List<ItemModel>> _moviesStreamController =
      StreamController.broadcast();

  final StreamController isRequestFailedStreamController =
      StreamController<Failure>.broadcast();

  List<ItemModel> items = [];
  List<ItemModel> cahchedPopularItems = [];
  List<ItemModel> cahchedTopRatedItems = [];

  final GetArticlesUseCase _getArticlesUseCase;
  // We can use Shared Preference for many purpose like cached articles
  final AppPreference _appPreference;

  HomeArticlesViewModel(this._getArticlesUseCase, this._appPreference);

  GetArticlesObject _getArticlesObject = GetArticlesObject("", "");

  @override
  void start() {}

  @override
  void dispose() {
    _moviesStreamController.close();
    isRequestFailedStreamController.close();
  }

  @override
  getArticles(String source, String apiKey) async {
    (await _getArticlesUseCase.execute(GetArticlesInput(source, apiKey))).fold(
        (failure) {
      // I Test Failure if i change the api key to return an error ( unAuthorized )
      List<ItemModel> emptyItems = [];
      inputArticles.add(emptyItems);
      inputIsRequestFailed.add(failure);
    }, (data) async {
      (await _getArticlesUseCase
              .execute(GetArticlesInput(Constants.associatedPress, apiKey)))
          .fold((failure) {
        List<ItemModel> emptyItems = [];
        inputArticles.add(emptyItems);
        inputIsRequestFailed.add(failure);
      }, (anotherData) {
        List<ItemModel> combinedList = [];
        combinedList.addAll(data.articles);
        combinedList.addAll(anotherData.articles);

        inputArticles.add(combinedList);
      });
    });
  }

  @override
  Sink get inputArticles => _moviesStreamController.sink;

  @override
  Sink get inputIsRequestFailed => isRequestFailedStreamController.sink;

  @override
  Stream<Failure> get outputIsRequestFailed =>
      isRequestFailedStreamController.stream
          .map((failureObject) => failureObject);

  @override
  Stream<List<ItemModel>> get outputArticles =>
      _moviesStreamController.stream.map((articles) => articles);

  @override
  setApiKey(String apiKey) {
    _getArticlesObject = _getArticlesObject.copyWith(apiKey: apiKey);
  }

  @override
  String getSource() {
    return _getArticlesObject.source;
  }

  @override
  setSource(String source) {
    return _getArticlesObject = _getArticlesObject.copyWith(source: source);
  }

  @override
  String getApiKey() {
    return _getArticlesObject.apiKey;
  }
}

abstract mixin class HomeArticlesViewModelInput {
  getArticles(String source, String apiKey);
  setApiKey(String apiKey);
  String getApiKey();
  setSource(String source);
  String getSource();
  Sink get inputArticles;
  Sink get inputIsRequestFailed;
}

abstract mixin class HomeArticlesViewModelOutput {
  Stream<List<ItemModel>> get outputArticles;
  Stream<Failure> get outputIsRequestFailed;
}
