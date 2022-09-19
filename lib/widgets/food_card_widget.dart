import 'package:flutter/material.dart';
import 'package:flutter_order_food_app/utilities/text_items.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key, required this.imagePath, required this.foodName, required this.foodPrice}) : super(key: key);
final String imagePath;
final String foodName;
final String foodPrice;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 160,
              height: 100,
              child: Image.asset(imagePath)),
          Text(foodName,style: TextItems.headerText,),
          Text("Domates soslu ",style: TextItems.lowGrayText,),
          Text("${foodPrice} TL ",style: TextItems.headerText,),

        ],
      ),
    );
  }
}

