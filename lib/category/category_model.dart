import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class CategoryModel{
  final String id;
  final String tittle;
  final String imageName;
  final Color color;

  CategoryModel(
      {
        required this.id,
        required this.tittle,
        required this.imageName,
        required this.color}
      );

 static List<CategoryModel> categories=[
    CategoryModel(
        id: 'sports',
        tittle:'Sports',
        imageName: 'ball.png',
        color: const Color(0xffC91C22),
    ),
    CategoryModel(
      id: 'health',
      tittle:'Health',
      imageName: 'health.png',
      color: const Color(0xffED1E79),
    ),
    CategoryModel(
      id: 'business',
      tittle:'Business',
      imageName: 'bussines.png',
      color: const Color(0xffCF7E48),
    ),
    CategoryModel(
      id: 'entertainment',
      tittle:'Entertainment',
      imageName: 'environment.png',
      color: const Color(0xff4882CF),
    ),
    CategoryModel(
      id: 'science',
      tittle:'Science',
      imageName: 'science.png',
      color: const Color(0xffF2D352),
    ),
    CategoryModel(
      id: 'technology',
      tittle:'Technology',
      imageName: 'Politics.png',
      color: const Color(0xff003E90),
    )
  ];
}