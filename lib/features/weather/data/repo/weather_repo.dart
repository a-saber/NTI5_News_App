import 'package:dartz/dartz.dart';
import 'package:nti5_news_app/features/weather/data/models/weather_model.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/network/api_response.dart';
import '../../../../core/network/end_points.dart';

class WeatherRepo{
  var apiHelper = WeatherAPIHelper();

  Future<Either<String, WeatherModel>> fetchWeather() async
  {
    try{
      var result = await apiHelper.getRequest(
        endPoint: EndPoints.weather,
        queryParams: {
          'lat': 30.5877893,
          'lon': 31.4798788
        }
      );
      if(result.status){
        var responseModel = WeatherModel.fromJson(result.data as Map<String, dynamic>);
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