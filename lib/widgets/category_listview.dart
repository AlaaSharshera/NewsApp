import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_container.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({
    super.key,
  });
  List<CategoryModel> categoriesList = [
    CategoryModel(image: 'assets/images/general.avif', categoryName: "General"),
    CategoryModel(image: 'assets/images/health.avif', categoryName: "health"),
    CategoryModel(
        image: 'assets/images/business.avif', categoryName: "business"),
    CategoryModel(image: 'assets/images/sports.avif', categoryName: "sports"),
    CategoryModel(image: 'assets/images/science.avif', categoryName: "science"),
    CategoryModel(
        image: 'assets/images/technology.jpeg', categoryName: "technology"),
    CategoryModel(
        image: 'assets/images/entertaiment.avif',
        categoryName: "entertainment"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (context, index) {
            return CategoryContainer(
              categoryModel: categoriesList[index],
            );
          }),
    );
  }
}
