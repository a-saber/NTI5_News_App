import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti5_news_app/features/news/cubit/headlines/headlines_states.dart';

import '../../data/models/article_model.dart';
import '../../data/repo/news_repo.dart';

class HeadlinesCubit extends Cubit<TopHeadlinesStates>{
  HeadlinesCubit() : super(TopHeadlinesInitialState());
  static HeadlinesCubit get(context)=> BlocProvider.of(context);

  FetchArticlesResponseModel? responseModel;
  String? error;
  NewsRepo repo = NewsRepo();
  fetchTasks() async{
    emit(TopHeadlinesLoadingState());
    var result = await repo.fetchTopHeadlines();
    result.fold(
            (error) {
          this.error = error;
          emit(TopHeadlinesErrorState());
        },
            (model){
          responseModel = model;
          emit(TopHeadlinesSuccessState());
        }
    );
  }
}