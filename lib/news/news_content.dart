import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/news/news_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({required this.sourceId});
 final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIService.getNews(sourceId),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator(color: AppTheme.primaryColor,));
        }
        else if(snapshot.hasError)
        {
          return const Center(child: Text('Something went wrong!'));
        }
        else if(snapshot.data?.status !='ok')
        {
          return const Center(child: Text('Try again!'));
        }
        final news=snapshot.data?.news ?? [];
        return ListView.builder(
              itemBuilder: (context, index) => NewsItem(news[index]),
            itemCount: news.length,
          );
        },
    );
  }
}
