import 'dart:core';

import 'package:flowerapp/core/utls/app_images.dart';

class CategoryModel{
   final String image;
   final String title;




  CategoryModel({
     required this.title,
    required this.image
});



}

List <CategoryModel> categorymodel = [
  CategoryModel(title: "Milkshake", image: AppImages.milkshake),
  CategoryModel(title: "Flore vitamin", image: AppImages.florevitamin),
  CategoryModel(title: "Spanish latte", image: AppImages.spanishlatte),
  CategoryModel(title: "Chocolate drinks", image: AppImages.chocolatedrinks),
];
