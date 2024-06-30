
import 'package:flowerapp/core/utls/app_colors.dart';
import 'package:flowerapp/core/utls/app_fonts.dart';
import 'package:flowerapp/features/home/data/models/best_selling_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/utls/app_texts.dart';
import '../../cart/views/cart_screen.dart';
class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
final BestSellingModel product;
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}
class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.rose,
        body:CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: SizedBox(),
              toolbarHeight: MediaQuery.of(context).size.height*0.35,
              backgroundColor: AppColors.rose,
              flexibleSpace: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.4,
                      width: double.infinity,
                      child: Image.asset(widget.product.image)),
                             Row(

                               children: [
                                 IconButton(
                                   onPressed: (){
                                     Navigator.pop(context);
                                   },
                                     icon: Icon(Icons.arrow_back_ios_new)),
                               ],
                             ),
                ],
              ),

            ),
            SliverFillRemaining(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(35),
                      topRight:Radius.circular(35),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(widget.product.title,style: TextStyle(fontFamily: AppFonts.pangolin,fontSize: 22),)),
                          Text("${widget.product.price} LE",style: TextStyle(fontSize: 20,color: AppColors.buttoncolor,fontWeight: FontWeight.w500,fontFamily: AppFonts.pangolin,),),
                        ],
                      ),
                      Text(widget.product.desc,
                        style: TextStyle(fontSize: 14,color: AppColors.grey,fontFamily: AppFonts.roboto
                        )
                        ,),
                      Divider(color: AppColors.rose,),
                      SizedBox(height: 25,),
                      Center(
                        child: Container(

                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors:[
                                Color(0xffF7CCC6),
                                Color(0xffFCEFED),
                                Color(0xffFFFFFF)
                              ],
                                  begin: Alignment.centerRight,
                                  end: Alignment.bottomLeft
                              ),
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                  backgroundColor: AppColors.buttoncolor,
                                  child: IconButton(
                                      onPressed: (){
                                        if(widget.product.count>0) {
                                          setState(() {
                                            widget.product.count = widget.product.count -1;
                                          });
                                        }
                                      },
                                      icon:Icon(Icons.remove,color: AppColors.white,))),
                              SizedBox(width: 31,),
                              Text("${widget.product.count}",style: TextStyle(fontSize: 20),),
                              SizedBox(width: 31,),
                              CircleAvatar(
                                  backgroundColor: AppColors.buttoncolor,
                                  child: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          widget.product.count = widget.product.count +1;
                                        });
                                      },
                                      icon:Icon(Icons.add,color: AppColors.white,)))
                            ],
                          ),
                        ),

                      ),
                      SizedBox(height: 77,),
                      Container(

                        height: 50,
                        decoration: BoxDecoration(
                            color: AppColors.babypink,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(child: Text("Selected items  (${widget.product.count})",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.buttoncolor,fontFamily: AppFonts.roboto),)),
                            Expanded(child: Text("Total : ${widget.product.count * widget.product.price} LE ",textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.buttoncolor,fontFamily: AppFonts.roboto),)),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,)
                      ,GestureDetector(
                        onTap: (){

                          setState(() {
                           widget.product.addtocart=!widget.product.addtocart;
                          });
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
                              Text(AppTexts.addtocart,style: TextStyle(fontWeight:FontWeight.w700,color: AppColors.white,fontFamily: AppFonts.roboto,fontSize: 17),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
