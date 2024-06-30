import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utls/app_colors.dart';
import '../../../core/utls/app_fonts.dart';
import 'package:flowerapp/features/best_selling/views/widgets/appbar_widget.dart';
import 'package:flowerapp/features/home/data/models/best_selling_model.dart';
import 'package:flowerapp/features/search/views/widgets/milkshake_search_widget.dart';
import '../../product_details/views/product_details.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<BestSellingModel> searchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppbarWidget(text: "Milkshake"),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          searchList = milkshakes
                              .where((element) => element.title
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.pink),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 37,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.containercolor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Icon(Icons.search),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.pink),
          Expanded(
            child: ListView.separated(
              itemCount: searchList.isEmpty ? milkshakes.length : searchList.length,
              itemBuilder: (context, index) {
                final product = searchList.isEmpty ? milkshakes[index] : searchList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(product: product),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23, right: 23),
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
                                      SizedBox(height: 10),
                                      Text(
                                        "${product.price} LE",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.buttoncolor,
                                          fontFamily: AppFonts.roboto,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset(
                                product.image,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.buttoncolor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 28);
              },
            ),
          ),
        ],
      ),
    );
  }
}