
import 'package:flutter_order_food_app/entitiy/food_model.dart';

class FoodWebAnswer{
   List<Food> food;
   FoodWebAnswer({required this.food});

   factory FoodWebAnswer.fromJson(Map<String, dynamic> json){
     var jsonArray = json['yemekler'] as List;
     List<Food> food = jsonArray.map((jsonArrayNesnesi) => Food.fromJson(jsonArrayNesnesi)).toList();
     return FoodWebAnswer(food: food);
   }
}