import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti5_news_app/features/news/cubit/headlines/headlines_states.dart';
import 'package:nti5_news_app/features/news/views/widgets/news_item_builder.dart';
import 'package:nti5_news_app/features/news/views/widgets/section_item_builder.dart';

import '../cubit/headlines/headlines_cubit.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> HeadlinesCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Explore'),
        ),
        body: BlocBuilder<HeadlinesCubit, TopHeadlinesStates>(
          builder: (context, state) {

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: TextFormField(
                    controller: HeadlinesCubit.get(context).search,
                    decoration: InputDecoration(
                      hintText: 'Search',
                    ),
                    onChanged: (String? value){
                      HeadlinesCubit.get(context).fetchArticles();
                    },
                  ),
                ),
                SizedBox(height: 20.h,),
                SizedBox(
                  height: 37.h,
                  child: ListView.separated(
                      padding: REdgeInsets.symmetric(horizontal: 32),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index)=> SectionItemBuilder(
                          section: HeadlinesCubit.get(context).categories[index],
                          selected: index == HeadlinesCubit.get(context).categoryIndex,
                          onTap: ()=> HeadlinesCubit.get(context).onCategoryChanged(index)
                      ),
                      separatorBuilder: (context, index)=> SizedBox(width: 12.w,),
                      itemCount: HeadlinesCubit.get(context).categories.length
                  ),
                ),
                SizedBox(height: 20.h,),
                Builder(builder: (context){
                  if(state is TopHeadlinesLoadingState) {
                    return CircularProgressIndicator();
                  }
                  else if(state is TopHeadlinesErrorState) {
                    return Center(child: Text(state.error ?? ''),);
                  }
                  else if(state is TopHeadlinesSuccessState){
                    return Expanded(
                      child: ListView.separated(
                          padding: REdgeInsets.symmetric(horizontal: 32),
                          itemBuilder: (context, index) => NewsItemBuilder(
                            articleModel: state.responseModel.articles![index],
                            isFirstItem: index == 0,
                          ),
                          separatorBuilder: (context, index)=> SizedBox(height: 10,),
                          itemCount: state.responseModel.articles!.length),
                    );
                  }
                  else {
                    return Container();
                  }

                }),
              ],
            );


          }
        ),
      ),
    );
  }
}
