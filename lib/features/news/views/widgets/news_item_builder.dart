import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti5_news_app/features/news/data/models/article_model.dart';

class NewsItemBuilder extends StatelessWidget {
  const NewsItemBuilder({
    super.key,
    required this.isFirstItem,
    required this.articleModel,
  });

  final bool isFirstItem;
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isFirstItem)
       Column(
        children: [
          if (articleModel.urlToImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                articleModel.urlToImage ?? '',
                height: 206.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.image_not_supported),
              ),
            ),
          SizedBox(height: 16.h),
          Text(
            articleModel.title ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 16.h),

          Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 10.w,),
              Text(articleModel.author??''),
              SizedBox(width: 10.w,),
              Text(articleModel.publishedAt??''),
            ],
          )
        ],
      ),
        Row(
          children:
          [
            Expanded(
              child: Column(
                children: [
                  Text(
                    articleModel.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 10.w,),
                      if (articleModel.author != null)
                        Expanded(child: Text(articleModel.author??'', maxLines: 1, overflow: TextOverflow.ellipsis,)),
                      // SizedBox(width: 10.w,),
                      if (articleModel.publishedAt != null)
                        Expanded(child: Text(articleModel.publishedAt??'', maxLines: 1, overflow: TextOverflow.ellipsis,)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 8.w,),
            if (articleModel.urlToImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  articleModel.urlToImage ?? '',
                  height: 80.h,
                  width: 112.w,
                  fit: BoxFit.cover,
                ),
              ),
          ],
        )

      ],
    );
  }
}
