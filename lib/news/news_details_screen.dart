import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class newsDetailsScreen extends StatefulWidget {
  static const String routeName = 'News Details';

  @override
  State<newsDetailsScreen> createState() => _newsDetailsScreenState();
}

class _newsDetailsScreenState extends State<newsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    News args = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.source?.name ?? '',
          style: TextStyle(color: AppTheme.whiteColor),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: args.urlToImage ?? '',
                placeholder: (_, __) => Center(
                    child: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                )),
                errorWidget: (_, __, ___) => const Center(
                    child: Icon(
                  Icons.error_outline_outlined,
                  size: 50,
                )),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(args.source?.name ?? '',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.lightNavy,
                    fontSize: 10,
                    fontWeight: FontWeight.w400)),
            const SizedBox(
              height: 5,
            ),
            Text(args.title ?? '',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                  args.publishedAt != null
                      ? timeago.format(DateTime.tryParse(args.publishedAt!) ??
                          DateTime.now())
                      : '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppTheme.lightNavy, fontSize: 13)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(args.content ?? '',
                style: Theme.of(context).textTheme.titleSmall),
            TextButton(
                onPressed: () {
                  Uri url = Uri.parse(args.url ?? '');
                  _launchUrl(url);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'View Full Article',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.blackColor),
                    ),
                    Icon(
                      Icons.arrow_forward_outlined,
                      size: 10,
                      color: AppTheme.blackColor,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(
        url,
        //mode: LaunchMode.inAppWebView
    )
    ) {
      throw Exception('Could not launch $url');
    }
  }
}
