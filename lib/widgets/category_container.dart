import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/category_screen.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({required this.categoryModel, super.key});
  final CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CategoryScreen(
            categoryName: categoryModel!.categoryName!,
          );
        }));
      },
      child: Container(
        width: 200.w,
        height: 120.h,
        margin: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(categoryModel!.image!),
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Text(
            categoryModel!.categoryName!,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
