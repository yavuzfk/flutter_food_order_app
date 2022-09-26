
import 'package:flutter_order_food_app/entitiy/sepet_model.dart';
class SepetAnswer{
  List<Sepet> sepet;

  SepetAnswer({required this.sepet});

  factory SepetAnswer.fromJson(Map<String, dynamic> json){
    var jsonArray = json['sepet_yemekler'] as List;
    List<Sepet> sepet = jsonArray.map((jsonArrayNesnesi) => Sepet.fromJson(jsonArrayNesnesi)).toList();
    return SepetAnswer(sepet: sepet);
  }
}