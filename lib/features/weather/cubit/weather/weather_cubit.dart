
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti5_news_app/features/weather/cubit/weather/weather_state.dart';
import 'package:nti5_news_app/features/weather/data/repo/weather_repo.dart';

import '../../data/models/weather_model.dart';

class WeatherCubit extends Cubit<WeatherStates>{
  WeatherCubit(): super(WeatherInitial());
  static WeatherCubit get(context)=> BlocProvider.of(context);

  WeatherRepo repo = WeatherRepo();
  fetchWeather() async{
    emit(WeatherLoading());
    var result = await repo.fetchWeather();
    result.fold(
            (error) {
          emit(WeatherError(error));
        },
            (model){
          emit(WeatherSuccess(model));
        }
    );
  }


}