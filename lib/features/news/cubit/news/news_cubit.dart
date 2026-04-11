
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti5_news_app/features/news/cubit/news/news_states.dart';
import 'package:nti5_news_app/features/news/data/repo/news_repo.dart';

import '../../data/models/article_model.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit(): super(NewsInitialState());
  static NewsCubit get(context)=> BlocProvider.of(context);

  FetchArticlesResponseModel? responseModel;
  String? error;
  NewsRepo repo = NewsRepo();
  fetchNews() async{
    emit(NewsLoadingState());
    var result = await repo.fetchArticles();
    result.fold(
        (error) {
          this.error = error;
          emit(NewsErrorState());
        },
        (model){
          responseModel = model;
          emit(NewsSuccessState());
        }
    );
  }


}