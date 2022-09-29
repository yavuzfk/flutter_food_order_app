
import 'package:flutter_order_food_app/entitiy/cart_model.dart';
class SepetAnswer{
  List<Cart> sepet;

  SepetAnswer({required this.sepet});

  factory SepetAnswer.fromJson(Map<String, dynamic> json){
    var jsonArray = json['sepet_yemekler'] as List;
    List<Cart> sepet = jsonArray.map((jsonArrayNesnesi) => Cart.fromJson(jsonArrayNesnesi)).toList();
    return SepetAnswer(sepet: sepet);
  }
}