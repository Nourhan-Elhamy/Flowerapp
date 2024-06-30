import 'package:flowerapp/core/utls/app_colors.dart';
import 'package:flowerapp/core/utls/app_fonts.dart';
import 'package:flowerapp/core/utls/app_images.dart';
import 'package:flowerapp/features/home/data/models/category_model.dart';
import 'package:flutter/cupertino.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key, required this.index});
final int index;
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 75,
          decoration: BoxDecoration(
            gradient: LinearGradient(

              colors:[ AppColors.pink.withOpacity(0.6),
              AppColors.pink.withOpacity(0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            ),

            shape: BoxShape.circle

          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Image.asset(categorymodel[widget.index].image,height: 50,),
          ),


          ),
        Text(categorymodel[widget.index].title,style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontFamily: AppFonts.syne
        ),)

      ],
    );

  }
}
