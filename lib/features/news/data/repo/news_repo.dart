import 'package:dartz/dartz.dart';
import 'package:nti5_news_app/core/network/api_response.dart';
import 'package:nti5_news_app/core/network/end_points.dart';
import 'package:nti5_news_app/features/news/data/models/article_model.dart';

import '../../../../core/network/api_helper.dart';

class NewsRepo{

  var apiHelper = NewsAPIHelper();

  Future<Either<String, FetchArticlesResponseModel>> fetchArticles() async
  {
    try{
      var result = await apiHelper.getRequest(endPoint: EndPoints.everything);
      if(result.status){
        var responseModel = FetchArticlesResponseModel.fromJson(result.data as Map<String, dynamic>);
        return Right(responseModel);

      }
      else{
        return left(result.message);
      }

    }
    catch(e){
      return left(ApiResponse.fromError(e).message);
    }
  }
  Future<Either<String, FetchArticlesResponseModel>> fetchTopHeadlines({
    String? category,
    String? search
}) async
  {
    try{
      var result = await apiHelper.getRequest(endPoint: EndPoints.topHeadlines, queryParams: {
        'category': category,
        'q': search
      });
      if(result.status){
        var responseModel = FetchArticlesResponseModel.fromJson(result.data as Map<String, dynamic>);
        return Right(responseModel);

      }
      else{
        return left(result.message);
      }

    }
    catch(e){
      return left(ApiResponse.fromError(e).message);
    }
  }


}