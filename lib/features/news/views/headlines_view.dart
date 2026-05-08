import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti5_news_app/features/news/cubit/headlines/headlines_cubit.dart';
import 'package:nti5_news_app/features/news/cubit/headlines/headlines_states.dart';


class HeadlinesView extends StatelessWidget {
  const HeadlinesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> HeadlinesCubit()..fetchArticles(),
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
                  return Center(child: Text(state.error ?? ''),);
                }
                else if(state is TopHeadlinesSuccessState && state.responseModel.articles != null){
                  return Column(
                    children:
                    [
                      Text('${state.responseModel.totalResults ?? 0}'),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index)=> Text(state.responseModel!.articles?[index].title??''),
                            separatorBuilder: (context, index)=> SizedBox(height: 20,),
                            itemCount: state.responseModel!.articles!.length
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
