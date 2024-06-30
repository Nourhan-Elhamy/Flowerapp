import 'package:flowerapp/core/utls/app_images.dart';
import 'package:flowerapp/core/utls/app_texts.dart';
import 'package:flowerapp/features/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/utls/app_colors.dart';
import '../../../core/utls/app_fonts.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(AppImages.confirmbar,width: double.infinity,fit: BoxFit.contain,),
          SizedBox(height: 100,),
          Image.asset(AppImages.sucessorder),
          SizedBox(height: 100,)
          ,Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: GestureDetector(
              onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c){
                    return HomeScreen();
                  }));
              },
              child: Container(
                height: 50,

                decoration: BoxDecoration(
                    color: AppColors.buttoncolor,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(AppTexts.backtohome,style: TextStyle(fontWeight:FontWeight.w700,color: AppColors.white,fontFamily: AppFonts.roboto,fontSize: 17),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
