import 'package:flutter/material.dart';
import 'package:flowerapp/core/utls/app_colors.dart';
import 'package:flowerapp/features/best_selling/views/widgets/appbar_widget.dart';
import 'package:flowerapp/features/home/data/models/best_selling_model.dart';
import 'package:flowerapp/features/home/widgets/sweet_widget.dart';


import '../../product_details/views/product_details.dart';

class BestSellingScreen extends StatefulWidget {
  const BestSellingScreen({Key? key}) : super(key: key);

  @override
  State<BestSellingScreen> createState() => _BestSellingScreenState();
}

class _BestSellingScreenState extends State<BestSellingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppbarWidget(
            text: "Best Selling",
          ),
          Divider(
            color: AppColors.pink,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: bestsellingmodel.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final product = bestsellingmodel[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(product: product),
                        ),
                      );
                    },
                    child: SweetWidget(index: index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
