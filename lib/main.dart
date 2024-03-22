import 'package:flutter/material.dart';
import 'package:news_app/api_service.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/home_screen.dart';

void main() {
  // APIService.getSources('sports');
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: {
       HomeScreen.routeName:(_) => HomeScreen(),
     },
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}



