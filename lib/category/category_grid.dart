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
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 24),
          child: Text(
            AppLocalizations.of(context)!.pickyourcategoryinterest,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        const SizedBox(height: 20,),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24
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
