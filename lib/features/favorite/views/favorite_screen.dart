


import 'package:flowerapp/core/utls/app_texts.dart';
import 'package:flowerapp/features/best_selling/views/widgets/appbar_widget.dart';
import 'package:flowerapp/features/home/data/models/best_selling_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utls/app_colors.dart';



class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}
class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {
    List<BestSellingModel> favlist =bestsellingmodel.where((bestsellingmodel) => bestsellingmodel.fav==true).toList();
    return Scaffold(

      body:  Column(
        children: [
          AppbarWidget(text: AppTexts.favorite),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(5),
                itemCount: favlist.length,
                itemBuilder: (context,index){
                  return Card(
                    color: AppColors.pink.withOpacity(0.9),
                    child: ListTile(
                      title: Text(favlist[index].title.toString(),style: TextStyle( fontWeight: FontWeight.w600,
                          color: AppColors.buttoncolor)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(favlist[index].desc),
                          Text("Price : ${favlist[index].price.toString()}  LE",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: AppColors.buttoncolor),),
                        ],
                      ),
                      leading:  Image.asset(favlist[index].image,height: 90,width: 90,),
                      trailing: GestureDetector(
                        onTap: (){
                          setState(() {
                            favlist[index].fav=false;
                          });

                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.pink.withOpacity(0.1),
                          child: Icon(Icons.favorite,color: AppColors.buttoncolor,),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ) ,
    );
  }
}

