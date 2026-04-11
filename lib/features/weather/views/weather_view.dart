import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/weather/weather_cubit.dart';
import '../cubit/weather/weather_state.dart';


class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> WeatherCubit()..fetchWeather(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Weather'),
          ),
          body: BlocBuilder<WeatherCubit, WeatherStates>(
              builder: (context, state){
                var cubit = WeatherCubit.get(context);
                if(state is WeatherLoading) {
                  return CircularProgressIndicator();
                }
                else if(state is WeatherError){
                  return Center(child: Text(state.error),);
                }
                else if(state is WeatherSuccess ){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                    [
                     Text(state.responseModel.name ?? '', style: TextStyle(fontSize: 30),),
                     Text(state.responseModel.sys?.country ?? ''),
                     Text(state.responseModel.weather?.first.main ?? ''),
                    ],
                  );

                }
                else{
                  return Container();
                }
              }
          ),
        )
    );
  }
}
