import 'package:flowerapp/core/utls/app_colors.dart';
import 'package:flowerapp/core/utls/app_fonts.dart';
import 'package:flowerapp/features/onboarding/data/models/onboarding_models.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController= PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:PageView.builder(
          itemCount: onboarding.length,
      controller: pageController,
      itemBuilder: (c,index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(onboarding[index].backgroundImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(onboarding[index].image),
                  SizedBox(height: 20,),
                  Text(onboarding[index].title,
                    style: TextStyle(fontFamily: AppFonts.rocksalt,fontSize: 24,fontWeight: FontWeight.w400),),

                  SizedBox(height: 12,),
                  Text(onboarding[index].desc,textAlign: TextAlign.center,style: TextStyle(
                    fontSize: 22,fontWeight: FontWeight.w400
                  ),),
                  SizedBox(height: 40,),

                  MaterialButton(onPressed: (){

                    if(index==onboarding.length -1){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
                        return HomeScreen();
                      }));
                    }
                    else {
                      pageController.animateToPage(index + 1,
                          duration: Duration(seconds: 1),
                          curve: Curves.bounceInOut
                      );
                    }
                  }
                      ,child: Text(onboarding[index].buttonText,style: TextStyle(color: AppColors.white,),),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(60),
                        bottomLeft: Radius.circular(4)
                      )
                    ),
                    minWidth: double.infinity,
                    color: AppColors.buttoncolor,
                  ),
                  SizedBox(height: 14,),
                  SmoothPageIndicator(
                      controller: pageController,
                      count: onboarding.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: AppColors.buttoncolor,
                      dotColor: Colors.grey.withOpacity(0.5),
                      dotHeight: 10,
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }
    ),
    );
  }
}