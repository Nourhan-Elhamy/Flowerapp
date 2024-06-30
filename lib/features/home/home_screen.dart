
import 'package:flowerapp/core/utls/app_images.dart';
import 'package:flowerapp/core/utls/app_texts.dart';
import 'package:flowerapp/features/best_selling/views/best_selling_screen.dart';
import 'package:flowerapp/features/cart/views/cart_screen.dart';
import 'package:flowerapp/features/favorite/views/favorite_screen.dart';
import 'package:flowerapp/features/home/data/models/best_selling_model.dart';
import 'package:flowerapp/features/home/data/models/category_model.dart';
import 'package:flowerapp/features/home/widgets/banner.dart';

import 'package:flowerapp/features/home/widgets/category_widget.dart';
import 'package:flowerapp/features/home/widgets/search_widget.dart';
import 'package:flowerapp/features/home/widgets/seemore_widget.dart';
import 'package:flowerapp/features/home/widgets/sweet_widget.dart';
import 'package:flowerapp/features/search/views/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.appbarimage),
        centerTitle: true,

      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 29,),
            Text("Nour Elhamy",style: TextStyle(fontSize: 30),),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (c){
                  return FavoriteScreen();
                }));
              },
                child: Row(
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(width: 5,),
                    Text("Favorite items",style: TextStyle(fontSize: 20),),
                  ],
                )
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (c){
                 return CartScreen();
                }));
              },
              child: Row(
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(width: 5,),
                  Text("Cart",style: TextStyle(fontSize: 20),),
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BannerWidget(),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c){
                    return SearchScreen();
                  }));
                },
                  child: SearchWidget()),
            ),
            SliverToBoxAdapter(
              child: SeeMoreWidget(
                text: AppTexts.discover,
              ),
            ),
           SliverToBoxAdapter(

              child: SizedBox(
                height: 95,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (c,index){
                      return CategoryWidget(index: index,);
                    },
                    separatorBuilder: (c,index){
                      return SizedBox(width: 30,);
                    },
                    itemCount: categorymodel.length),
              )

            ),
            SliverToBoxAdapter(
              child:  GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c){
                    return BestSellingScreen();
                  }));
                },
                child: SeeMoreWidget(
                    text: AppTexts.bestselling),
              ),
            ),
            SliverGrid.builder(

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10
              ),
              itemCount: 4,
              itemBuilder: (context,index){
                return SweetWidget(
                  index: index,
                );
              },

            )

          ],
        ),
      ),

    );
  }
}