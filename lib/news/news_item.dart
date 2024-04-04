import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/news/news_details_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.news);
final News news;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(
            newsDetailsScreen.routeName,
          arguments: news
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                placeholder: (_, __) => Center(child: CircularProgressIndicator(color: AppTheme.primaryColor,)),
                errorWidget: (_, __, ___) => const Center(
                    child: Icon(
                      Icons.error_outline_outlined,
                      size: 50,
                    )
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Text(
                news.source?.name ?? '',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppTheme.lightNavy,
                fontSize: 10,
                fontWeight: FontWeight.w400
              )
            ),
            const SizedBox(height: 5,),
            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(height: 5,),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                  news.publishedAt != null
                      ? timeago.format(DateTime.tryParse(news.publishedAt!) ?? DateTime.now())
                      : '',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.lightNavy,
                  fontSize: 13
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
