import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/news/news_item.dart';

class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {}

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        image: const DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child:query.isEmpty ? Center(child: Text('Enter anyThing',style: TextStyle(color: AppTheme.primaryColor),))
          : FutureBuilder(
        future: APIService.searchNews(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: AppTheme.primaryColor));
          } else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong!'));
          } else if (snapshot.data?.status != 'ok') {
            return Center(child: Text('Try again!'));
          }
          final news = snapshot.data?.news ?? [];
          return ListView.builder(
            itemBuilder: (context, index) => NewsItem(news[index]),
            itemCount: news.length,
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        image: const DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: FutureBuilder(
        future: APIService.searchNews(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: AppTheme.primaryColor));
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          } else if (snapshot.data?.status != 'ok') {
            return const Center(child: Text('Try again!'));
          }
          final news = snapshot.data?.news ?? [];
          return ListView.builder(
            itemBuilder: (context, index) => NewsItem(news[index]),
            itemCount: news.length,
          );
        },
      ),
    );
  }
}
