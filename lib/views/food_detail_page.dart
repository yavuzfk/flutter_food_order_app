import 'package:flutter/material.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';
import 'package:flutter_order_food_app/utilities/text_items.dart';
import 'package:flutter_order_food_app/widgets/product_type_button.dart';

String mockText = "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ";
class FoodDetail extends StatefulWidget {
   FoodDetail({Key? key, required this.foodPrice, required this.foodName})
      : super(key: key);
   int foodPrice=50;
   String foodName="hhhhhh";
  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorItems.backgroundColor,
      ),
      body: Container(color: ColorItems.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset('assets/img.png'),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.foodName, style: TextItems.headerText),
                    Text(widget.foodPrice.toString(), style: TextItems.headerText),
                  ],
                ),
              ),
              Text(mockText,style: TextItems.lowGrayText,),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: ProductTypeButton(type: 'Add to Cart'),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
