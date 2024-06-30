import 'package:flowerapp/core/utls/app_colors.dart';
import 'package:flowerapp/core/utls/app_images.dart';
import 'package:flowerapp/core/utls/app_texts.dart';
import 'package:flowerapp/features/home/data/models/best_selling_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SweetWidget extends StatefulWidget {
  const SweetWidget({super.key, required this.index});

  final int index;

  @override
  State<SweetWidget> createState() => _SweetWidgetState();
}

class _SweetWidgetState extends State<SweetWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
               padding: EdgeInsets.only(left: 12),
               width: 170,

              decoration: BoxDecoration(
                border: Border.all(color: AppColors.pink),
                gradient: LinearGradient(
                  colors: [
                    AppColors.pink.withOpacity(0.5),
                    AppColors.pink.withOpacity(0),

                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
                borderRadius: BorderRadius.circular(20),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Image.asset(bestsellingmodel[widget.index].image)),
                  Text(bestsellingmodel[widget.index].title,style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.buttoncolor
                  ),),
                  Text(bestsellingmodel[widget.index].desc,style:
                    TextStyle(
                      color: AppColors.grey
                    ),),
                  Text("${bestsellingmodel[widget.index].price} LE",
                  style: TextStyle(
                    color: AppColors.buttoncolor,
                    fontSize: 13,
                    fontWeight: FontWeight.w700
                  ),)

                ],

              ),
            ),
          Container(
              decoration: BoxDecoration(
                  color: AppColors.buttoncolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      bottomRight: Radius.circular(20)
                  )
              ),
              child: Icon(Icons.add,color: AppColors.white,)
          ),
          Positioned(
            top: 0,
              child:
          CircleAvatar(
              backgroundColor: AppColors.pink.withOpacity(0.2),
                child:
                GestureDetector(
                  onTap: (){
                    setState(() {
                      bestsellingmodel[widget.index].fav=!bestsellingmodel[widget.index].fav;
                    });
                  },
                  child: Icon(
                    bestsellingmodel[widget.index].fav==true?
                        Icons.favorite :
                    Icons.favorite_border,color: AppColors.buttoncolor,),
                )),
          )

        ],
      ),
    );
  }
}
