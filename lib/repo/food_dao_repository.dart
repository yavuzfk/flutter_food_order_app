import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_order_food_app/entitiy/food_model.dart';
import 'package:flutter_order_food_app/entitiy/food_web_answer.dart';

class FoodDaoRepository{
  List<Food> parseFoodAnswer(String answer){
    return FoodWebAnswer.fromJson(json.decode(answer)).food;
  }
  Future<List<Food>> getAllFood() async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var answer = await Dio().get(url);
    if(answer.statusCode == HttpStatus.ok){
      return parseFoodAnswer(answer.data.toString());
    }else {
      print("http status error");
      return parseFoodAnswer(answer.data.toString());
    }

  }

  // Future<List<Food>> getFoodImage(String yemek_resim_adi) async {
  //   var url = "https://kasimadalan.pe.hu/yemekler/resimler/$yemek_resim_adi";
  //   var answer = await Dio().get(url);
  //   return parseFoodAnswer(answer.data.toString());
  // }

  // Future<List<Food>> getSelectedFood() async{
  //   var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
  // }

// Future<void> foodRegister(String yemek_adi, String yemek_fiyat) async {
//   var url = "";
//   var veri = {"yemek_adi":yemek_adi, "yemek_fiyati": yemek_fiyat};
//   var answer = await Dio().post(url, data: FormData.fromMap(veri));
//   print("kisi ekle: ${answer.data.toString()}");
// }

}