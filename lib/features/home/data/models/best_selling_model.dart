import 'dart:core';

import 'package:flowerapp/core/utls/app_images.dart';

class BestSellingModel{
  final String image;
  final String title;
  final String desc;
  final int price;
  bool addtocart;
  int count;
  bool fav;
  
  
  BestSellingModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.price,
     this.count=0,
    this.addtocart=false,
    this.fav=false
  
  });
  
}

List <BestSellingModel> milkshakes=[
  BestSellingModel(image:AppImages.oreomilkshake, title: "Oreo Milkshake", desc: "There are many variations of passages of Lorem \nIpsum available, he majority have There are many\nvariations of passages of Lorem Ipsum available,\nhe majority have", price: 45),
  BestSellingModel(image:AppImages.vanillamilkshake, title: "Vanilla Milkshake", desc: "There are many variations of passages of Lorem\nIpsum available, he majority have There are many\nvariations of passages of Lorem Ipsum available,\nhe majority have", price: 45),
  BestSellingModel(image:AppImages.chocolatemilkshake, title: "Chocolate Milkshake", desc: "There are many variations of passages of Lorem\nIpsum available, he majority have There are many\nvariations of passages of Lorem Ipsum available,\nhe majority have", price: 45),
  BestSellingModel(image:AppImages.mangomilkshake, title: "Mango Milkshake", desc: "There are many variations of passages of Lorem\nIpsum available, he majority have There are many\nvariations of passages of Lorem Ipsum available,\nhe majority have", price: 45),
  BestSellingModel(image:AppImages.spanishlatte, title: "Spanish Latte", desc: "There are many variations of passages of Lorem \nIpsum available, he majority have There are many\nvariations of passages of Lorem Ipsum available,\nhe majority have", price: 45),
];
List <BestSellingModel> bestsellingmodel=[
  BestSellingModel(image: AppImages.donuts, title: "Donuts", desc: "Flower : creamy", price: 45),
  BestSellingModel(image: AppImages.cake, title: "Piece of cake", desc: "Flower : creamy", price: 45),
  BestSellingModel(image: AppImages.donuts, title: "Donuts", desc: "Flower : creamy", price: 45),
  BestSellingModel(image: AppImages.cake, title: "Piece of cake", desc: "Flower : creamy", price: 45),

  BestSellingModel(image: AppImages.donuts, title: "Donuts", desc: "Flower : creamy", price: 45),
  BestSellingModel(image: AppImages.cake, title: "Piece of cake", desc: "Flower : creamy", price: 45),

  BestSellingModel(image: AppImages.donuts, title: "Donuts", desc: "Flower : creamy", price: 45),
  BestSellingModel(image: AppImages.cake, title: "Piece of cake", desc: "Flower : creamy", price: 45),

];