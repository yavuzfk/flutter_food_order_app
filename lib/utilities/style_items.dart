import 'package:flutter/material.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';

class StyleItems{
  final LinearGradient linearGradient =  const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        ColorItems.gradientColor,
        Colors.white60
      ]
  );

}