import 'package:flowerapp/core/utls/app_colors.dart';
import 'package:flowerapp/core/utls/app_fonts.dart';
import 'package:flowerapp/core/utls/app_images.dart';
import 'package:flowerapp/core/utls/app_texts.dart';
import 'package:flowerapp/features/best_selling/views/widgets/appbar_widget.dart';

import 'package:flowerapp/features/confirm/views/confirm_screen.dart';
import 'package:flowerapp/features/home/data/models/best_selling_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<BestSellingModel>  productsInCart= bestsellingmodel.where((product) => product.addtocart).toList()+milkshakes.where((product) => product.addtocart).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarWidget(text: AppTexts.cart),
          Divider(color: AppColors.pink,),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index){
                return SizedBox(height: 28,);
              },
              itemCount: productsInCart.length,
                itemBuilder:(context,index){
                  final product= productsInCart[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      right: 23,
                      left: 23
                    ),
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
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),

                                child: Expanded(
                                  child: Column(

                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        style: TextStyle(
                                          fontFamily: AppFonts.pangolin,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.buttoncolor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          product.desc.length > 50 ? product.desc.substring(0, 50) : product.desc,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,

                                          style: TextStyle(
                                            fontFamily: AppFonts.roboto,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.buttoncolor.withOpacity(0.65),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                       "Price: ${ product.price} LE",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.pricecolor,
                                          fontFamily: AppFonts.roboto,
                                        ),
                                      ),
                                      SizedBox(height: 12,),
                                      Text("Total : ${product.count*product.price} LE",
                                      style: TextStyle(fontSize: 18,fontFamily: AppFonts.roboto),)
                                    ],),
                                ),
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                   product.image,
                                    height: 100,
                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xffF7CCC6),
                                          Color(0xffFCEFED),
                                          Color(0xffFFFFFF)
                                        ],
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft
                                      )
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                            backgroundColor: AppColors.buttoncolor,
                                            child: IconButton(
                                                onPressed: (){
                                                  if(product.count>0) {
                                                    setState(() {
                                                      product.count = product.count -1;
                                                    });
                                                  }
                                                },
                                                icon:Icon(Icons.remove,color: AppColors.white,))),
                                        SizedBox(width: 20,),
                                        Text("${product.count}",style: TextStyle(fontSize: 20),),
                                        SizedBox(width: 20,),
                                        CircleAvatar(
                                            backgroundColor: AppColors.buttoncolor,
                                            child: IconButton(
                                                onPressed: (){
                                                  setState(() {
                                                    product.count = product.count +1;
                                                  });
                                                },
                                                icon:Icon(Icons.add,color: AppColors.white,)))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                productsInCart.removeAt(index);
                              });
                            },
                            child: Container(
                              width: 30,
                              decoration: BoxDecoration(
                                color: AppColors.containercolor,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Image.asset(AppImages.cancelimage)
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
              } ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (c){
                  return ConfirmScreen();
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
                    Text(AppTexts.confirm,style: TextStyle(fontWeight:FontWeight.w700,color: AppColors.white,fontFamily: AppFonts.roboto,fontSize: 17),),
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
