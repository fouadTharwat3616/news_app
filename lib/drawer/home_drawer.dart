import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  // static const int categoriesIndex=0;
  // static const int settingsIndex=1;
  final void Function(DrawerItem) onItemSelected;
  HomeDrawer(this.onItemSelected);
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
              padding:  EdgeInsetsDirectional.only(start: MediaQuery.of(context).size.width*.03),
              color: AppTheme.whiteColor,
              child: Column(
                children: [
                  SizedBox(height:MediaQuery.of(context).size.height*.01,),
                  InkWell(
                    onTap: (){
                      onItemSelected(DrawerItem.categories);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.menu),
                        SizedBox(width: MediaQuery.of(context).size.width*.02,),
                        Text(
                            'Categories',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height*.02,),
                  InkWell(
                    onTap: (){
                      onItemSelected(DrawerItem.settings);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        SizedBox(width: MediaQuery.of(context).size.width*.02,),
                        Text(
                          'Settings',
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
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
enum DrawerItem{
  categories,
  settings;
}