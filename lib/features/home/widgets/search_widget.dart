import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/utls/app_colors.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("search here  ..",style:
              TextStyle(fontSize: 13,fontWeight: FontWeight.w400
                  ,color: Colors.grey),),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    width:0.5,
                    color: AppColors.buttoncolor
                )
            ),
          ),
        ),
        SizedBox(width: 13,),
        Container(
          width: 37,
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.containercolor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(0),
                  bottomRight:Radius.circular(15)
              )
          ),
          child: Icon(Icons.search),
        ),

      ],
    );
  }
}
