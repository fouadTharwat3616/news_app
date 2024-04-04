import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/sources.dart';

class TabItem extends StatelessWidget {
  Sources source;
  bool isSelected;
  TabItem({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor: Colors.transparent,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ?Colors.transparent : AppTheme.primaryColor,
            width: 2
          )
        ),
        child: Text(
          source.name ?? '',
          style: TextStyle(
            color:isSelected ? AppTheme.whiteColor:AppTheme.blackColor,
          ),
        ),
      ),
    );
  }
}
