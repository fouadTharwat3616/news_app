import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/tabs/sources_tab.dart';
import 'package:news_app/tabs/tab_item.dart';

class CategoryDetails extends StatelessWidget {
  final String CategoryId;

  const CategoryDetails(this.CategoryId);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: APIService.getSources(CategoryId),
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
        final sources=snapshot.data?.sources ?? [];
    return SourcesTabs(sources);
    }
    );
  }
}
