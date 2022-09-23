import 'package:flutter/material.dart';
import 'package:flutter_order_food_app/utilities/text_styles.dart';

class FoodCard extends StatefulWidget {
   FoodCard(
      {Key? key,
      required this.imagePath,
      required this.foodName,
      required this.foodPrice})
      : super(key: key);
  final String imagePath;
  final String foodName;
  final String foodPrice;
  int foodSize = 1;
  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(
              //  width: 160,
              height: 100,
              child: Image.network(widget.imagePath)),
          Text(widget.foodName,style: MyTextStyles.headerText,),
          Text("Sağlıklı",style: MyTextStyles.lowGrayText,),
          Text("${widget.foodPrice} TL ",style: MyTextStyles.headerText,),

        ],
      ),
    );
  }
}
