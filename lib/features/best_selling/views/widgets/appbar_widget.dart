import 'package:flowerapp/core/utls/app_colors.dart';
import 'package:flowerapp/core/utls/app_fonts.dart';
import 'package:flowerapp/core/utls/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text,
        style: TextStyle(fontFamily: AppFonts.roboto,color: AppColors.buttoncolor),),
      centerTitle: true,

      actions:[ Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(AppImages.vector),
      )],
    );
  }
}