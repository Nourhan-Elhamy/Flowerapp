import 'package:flowerapp/core/utls/app_colors.dart';
import 'package:flowerapp/core/utls/app_fonts.dart';
import 'package:flowerapp/features/home/data/models/best_selling_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MilkShakeWidget extends StatefulWidget {
  const MilkShakeWidget({super.key, required this.index, });
  final int index ;
  @override
  State<MilkShakeWidget> createState() => _MilkShakeWidgetState();
}

class _MilkShakeWidgetState extends State<MilkShakeWidget> {
  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23,right: 23),
      child: Stack(
        children: [

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.pink),
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  AppColors.pink.withOpacity(0.6),
                  AppColors.pink.withOpacity(0),
                ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight
              )
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(milkshakes[widget.index].title,style: TextStyle(fontFamily: AppFonts.pangolin,fontSize: 17,fontWeight: FontWeight.w400,color: AppColors.buttoncolor),),
                      Text(milkshakes[widget.index].desc,

                          style: TextStyle(fontFamily: AppFonts.roboto,fontSize: 14,fontWeight: FontWeight.w400,color: AppColors.buttoncolor.withOpacity(0.65))),
                      SizedBox(height: 10,),
                      Text("${milkshakes[widget.index].price} LE",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.buttoncolor,fontFamily: AppFonts.roboto),),
                    ],
                  ),
                ),
                SizedBox(width: 26,),
                Image.asset(milkshakes[widget.index].image),

              ],
            ),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.buttoncolor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3),
                        bottomRight: Radius.circular(20)
                    )
                ),
                child: Icon(Icons.add,color: AppColors.white,)
            ),
          ),
        ],
      ),
    );
  }
}
