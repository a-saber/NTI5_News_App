import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti5_news_app/features/news/cubit/news/news_states.dart';

import '../cubit/news/news_cubit.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> NewsCubit()..fetchTasks(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: BlocBuilder<NewsCubit, NewsState>(
          builder: (context, state){
            var cubit = NewsCubit.get(context);
            if(state is NewsLoadingState) {
              return CircularProgressIndicator();
            }
            else if(state is NewsErrorState){
              return Center(child: Text(cubit.error ?? ''),);
            }
            else if(state is NewsSuccessState && cubit.responseModel != null){
              return Column(
                children:
                [
                  Text('${cubit.responseModel!.totalResults ?? 0}'),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index)=> Text(cubit.responseModel!.articles?[index].title??''),
                      separatorBuilder: (context, index)=> SizedBox(height: 20,),
                      itemCount: cubit.responseModel!.articles!.length
                    ),
                  )
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
