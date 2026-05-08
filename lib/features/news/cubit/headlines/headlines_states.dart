import '../../data/models/article_model.dart';

abstract class TopHeadlinesStates{}
class TopHeadlinesInitialState extends TopHeadlinesStates{}
class TopHeadlinesLoadingState extends TopHeadlinesStates{}
class TopHeadlinesSuccessState extends TopHeadlinesStates{
  FetchArticlesResponseModel responseModel;
  TopHeadlinesSuccessState({required this.responseModel});
}
class TopHeadlinesErrorState extends TopHeadlinesStates{
  String error;
  TopHeadlinesErrorState({required this.error});
}