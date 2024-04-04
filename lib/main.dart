import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/news/news_details_screen.dart';
import 'package:news_app/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context) => settingsProvider(),
      child: NewsApp()));
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    settingsProvider provider=Provider.of<settingsProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       localizationsDelegates: AppLocalizations.localizationsDelegates,
       supportedLocales:AppLocalizations.supportedLocales,
      locale:  Locale(provider.languagecode),
     routes: {
       HomeScreen.routeName:(_) => HomeScreen(),
       newsDetailsScreen.routeName:(_) => newsDetailsScreen(),
     },
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}



