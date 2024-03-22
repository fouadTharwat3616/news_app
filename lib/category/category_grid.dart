import 'package:flutter/material.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/category/category_model.dart';

class CategoryGrid extends StatelessWidget {
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
            'Pick your category of interest',
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
              itemBuilder: (_, index) => CategoryItem(
                category: CategoryModel.categories[index],
                index:index,
              ),
            itemCount: CategoryModel.categories.length,
          ),
        )
      ],),
    );
  }
}
