import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .75,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppTheme.primaryColor,
            height: MediaQuery.of(context).size.height*.2,
            alignment: Alignment.center,
            child: Text(
                'News App!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 12),
              color: AppTheme.whiteColor,
              child: Column(
                children: [
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      const Icon(Icons.menu),
                      const SizedBox(width: 8,),
                      Text(
                          'Categories',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      const Icon(Icons.settings),
                      const SizedBox(width: 8,),
                      Text(
                        'Settings',
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
