import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/category/category_grid.dart';
import 'package:news_app/drawer/home_drawer.dart';
class HomeScreen extends StatelessWidget {
  static const String routeName='/';
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
        drawer: HomeDrawer(),
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body:CategoryGrid(),
      ),
    );
  }
}
