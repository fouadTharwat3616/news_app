import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_grid.dart';
import 'package:news_app/category/category_model.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:news_app/news/search_view.dart';
import 'package:news_app/settings/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        image: const DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
          fit: BoxFit.cover
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: HomeDrawer(OnDrawerItemSelected),
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: (){
               showSearch(context: context, delegate: SearchView());
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.search,
                  color: AppTheme.whiteColor,
                  size: 40,
                ),
              ),
            )
          ],
          title: Text(
            selectedCategory!=null ? selectedCategory!.tittle
              :selectedDrawerItem==DrawerItem.settings ?AppLocalizations.of(context)!.settings:AppLocalizations.of(context)!.newsapp
          ),
        ),
        body:
        selectedCategory!=null ? CategoryDetails(selectedCategory!.id)
        :selectedDrawerItem==DrawerItem.settings ?
        SettingsTab():
        CategoryGrid(onModelSelected:onModelSelected )
        ,
      ),
    );
  }
 var selectedDrawerItem =DrawerItem.categories;
  CategoryModel? selectedCategory;
  void onModelSelected(CategoryModel category)
  {
    selectedCategory=category;
    setState(() {});
  }
  void OnDrawerItemSelected(DrawerItem selectedItem)
  {
    selectedDrawerItem=selectedItem;
    selectedCategory=null;
    setState(() {});
    Navigator.of(context).pop();
  }

}
