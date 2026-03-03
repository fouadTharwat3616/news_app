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
    return Container(
      decoration:  BoxDecoration(
        color: AppTheme.whiteColor,
        image: const DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            args.source?.name ?? '',
            style: TextStyle(color: AppTheme.whiteColor),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width*.03),
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
               SizedBox(
                height:MediaQuery.of(context).size.width*.02,
              ),
              Text(args.source?.name ?? '',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.lightNavy,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
               SizedBox(
                height:MediaQuery.of(context).size.height*.02,
              ),
              Text(args.title ?? '',
                  style: Theme.of(context).textTheme.titleMedium),
               SizedBox(
                height:MediaQuery.of(context).size.height*.02,
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
                        ?.copyWith(color: AppTheme.lightNavy, fontSize: 15)),
              ),
              SizedBox(
                height:MediaQuery.of(context).size.height*.02,
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
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.blackColor),
                      ),
                      SizedBox(
                        width:MediaQuery.of(context).size.width*.01,
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 15,
                        color: AppTheme.blackColor,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url,))
    {
      throw Exception('Could not launch $url');
    }
  }
}
