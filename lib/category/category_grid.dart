import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/category/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryGrid extends StatelessWidget {
  CategoryGrid({required this.onModelSelected});
  final void Function(CategoryModel) onModelSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(horizontal: MediaQuery.of(context).size.width*.07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding:  EdgeInsetsDirectional.symmetric(vertical:MediaQuery.of(context).size.height*.03),
          child: Text(
            AppLocalizations.of(context)!.pickyourcategoryinterest,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
          SizedBox(height:MediaQuery.of(context).size.height*.02,),
        Expanded(
          child: GridView.builder(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: MediaQuery.of(context).size.height*.04,
                crossAxisSpacing: MediaQuery.of(context).size.width*.05
              ),
              itemBuilder: (_, index) =>
                  InkWell(
                    onTap: (){
                      onModelSelected(CategoryModel.categories[index]);
                  },
                    child: CategoryItem(
                category: CategoryModel.categories[index],
                index:index,
              ),
                  ),
            itemCount: CategoryModel.categories.length,
          ),
        )
      ],),
    );
  }
}
