import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/settings/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<language> languages=[language(name: 'English', code: 'en'),language(name: 'العربية', code: 'ar')];

  @override
  Widget build(BuildContext context) {
    settingsProvider provider= Provider.of<settingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsetsDirectional.only(start: 30,top: 30),
          child: Text(
            'Language',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppTheme.whiteColor
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal:15 ),
          margin: const EdgeInsets.symmetric(vertical: 20,horizontal:20 ),
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            border: Border.all(color: AppTheme.primaryColor,),
          ),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*.3,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<language>(
                value: languages.firstWhere((lang) => lang.code==provider.languagecode) ,
                items: languages.map(
                        (language) => DropdownMenuItem(
                      value: language,
                      child: Text(language.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppTheme.primaryColor
                        ),
                      ),
                    )
                ).toList(),
                onChanged: (selectedLanguage){
                  if(selectedLanguage !=null)
                  {
                    provider.changeLanguage(selectedLanguage.code);
                  }
                  setState(() {

                  });
                },
                borderRadius: BorderRadius.circular(20),
              ),

            ),
          ),
        ),
      ],
    );
  }
}
class language
{
  String name;
  String code;
  language({required this.name,required this.code});
}