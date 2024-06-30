import 'package:flutter/cupertino.dart';

import '../../../core/utls/app_fonts.dart';
import '../../../core/utls/app_images.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.bannerimage),
        Positioned(
          top: 10,
          child: Text("Choose What Suits\nYour Test",
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,fontFamily: AppFonts.pangolin),),
        ),

      ],

    );
  }
}
