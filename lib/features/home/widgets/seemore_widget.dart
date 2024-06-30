import 'package:flowerapp/core/utls/app_fonts.dart';
import 'package:flowerapp/core/utls/app_images.dart';
import 'package:flowerapp/core/utls/app_texts.dart';
import 'package:flutter/cupertino.dart';

class SeeMoreWidget extends StatelessWidget {
  const SeeMoreWidget({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(
        top: 29,
        left: 5
      ),
      child: Row(
        children: [
          Text(text,style: TextStyle(
            fontFamily: AppFonts.roboto
          ),),
          Spacer(),
           Image.asset(AppImages.seemoreimage)
        ],
      ),
    );
  }
}
