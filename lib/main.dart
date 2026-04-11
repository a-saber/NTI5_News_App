import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cache/cache_helper.dart';
import 'features/news/views/headlines_view.dart';
import 'features/news/views/news_view.dart';
import 'features/weather/views/weather_view.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, widget){
        return MaterialApp(
            theme: ThemeData(
                fontFamily: 'Lexend_Deca'
            ),
            debugShowCheckedModeBanner: false,
          home: WeatherView(),
        );
      },
    );
  }
}