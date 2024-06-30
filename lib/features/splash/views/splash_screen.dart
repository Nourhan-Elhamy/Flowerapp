import 'package:flowerapp/core/utls/app_colors.dart';
import 'package:flowerapp/core/utls/app_images.dart';
import 'package:flowerapp/features/onboarding/views/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Future.delayed(Duration(
      seconds: 3,
    ),
        (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c){
        return OnboardingScreen();
      }
      ));
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Image.asset(AppImages.splash,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,)

      
        
      
    );
  }
}
