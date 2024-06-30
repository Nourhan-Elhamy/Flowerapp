import 'package:flowerapp/features/home/home_screen.dart';
import 'package:flowerapp/features/product_details/views/product_details.dart';
import 'package:flowerapp/features/splash/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(fontFamily: "Majalla"),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
