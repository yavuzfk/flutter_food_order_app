
import 'package:flutter_order_food_app/entitiy/food_model.dart';

class FoodAnswer{
   List<Food> food;
   FoodAnswer({required this.food});

   factory FoodAnswer.fromJson(Map<String, dynamic> json){
     var jsonArray = json['yemekler'] as List;
     List<Food> food = jsonArray.map((jsonArrayNesnesi) => Food.fromJson(jsonArrayNesnesi)).toList();
     return FoodAnswer(food: food);
   }
}