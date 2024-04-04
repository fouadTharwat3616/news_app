import 'package:flutter/material.dart';
class settingsProvider with ChangeNotifier{
  String languagecode='en';
  void changeLanguage(String selectedLanguage)
  {
    if (selectedLanguage == languagecode) {
      return;
    }
    languagecode=selectedLanguage;
    notifyListeners();
  }

}