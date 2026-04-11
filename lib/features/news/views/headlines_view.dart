import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti5_news_app/features/news/cubit/headlines/headlines_cubit.dart';
import 'package:nti5_news_app/features/news/cubit/headlines/headlines_states.dart';


class HeadlinesView extends StatelessWidget {
  const HeadlinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> HeadlinesCubit()..fetchTasks(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Top Headlines'),
          ),
          body: BlocBuilder<HeadlinesCubit, TopHeadlinesStates>(
              builder: (context, state){
                var cubit = HeadlinesCubit.get(context);
                if(state is TopHeadlinesLoadingState) {
                  return CircularProgressIndicator();
                }
                else if(state is TopHeadlinesErrorState){
                  return Center(child: Text(cubit.error ?? ''),);
                }
                else if(state is TopHeadlinesSuccessState && cubit.responseModel != null){
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
