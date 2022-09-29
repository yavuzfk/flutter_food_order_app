import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_order_food_app/entitiy/food_model.dart';
import 'package:flutter_order_food_app/entitiy/food_answer.dart';
import 'package:flutter_order_food_app/entitiy/cart_answer.dart';
import 'package:flutter_order_food_app/entitiy/cart_model.dart';
import 'package:flutter_order_food_app/utilities/text_styles.dart';
import 'package:flutter_order_food_app/utilities/string_items.dart';

class FoodDaoRepository with MyTextStyles {
  List<Food> parseFoodAnswer(String answer) {
    return FoodAnswer.fromJson(json.decode(answer)).food;
  }

  List<Cart> parseSepetAnswer(String answer) {
    return SepetAnswer.fromJson(json.decode(answer)).sepet;
  }

  Future<List<Food>> getAllFood() async {
    var url = StringItems().tumYemekleriGetirUrl;
    var answer = await Dio().get(url);
    if (answer.statusCode == HttpStatus.ok) {
      return parseFoodAnswer(answer.data.toString());
    } else {
      print("http status error");
      return parseFoodAnswer(answer.data.toString());
    }
  }

  Future<void> sepeteEkle(String yemek_adi, String yemek_resim_adi,
      int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    var url = StringItems().sepeteEkleUrl;
    var veri = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi": kullanici_adi
    };
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print("sepete Ekle: ${cevap.data.toString()}");
    print(
        "Yemek adı: $yemek_adi - Yemek resim adi: $yemek_resim_adi - yemek siparis adedi: $yemek_siparis_adet - kullanici: $kullanici_adi");
  }

  Future<List<Cart>> sepetiGetir(String kullanici_adi) async {
    var url = StringItems().sepettekileriGetirUrl;
    var veri = {"kullanici_adi": kullanici_adi};
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    return parseSepetAnswer(cevap.data.toString());
  }

  Future<void> sepettenYemekSil(
      String sepet_yemek_id, String kullanici_adi) async {
    var url = StringItems().sepettenYemekSilUrl;
    var veri = {
      "sepet_yemek_id": sepet_yemek_id,
      "kullanici_adi": kullanici_adi
    };
    var cevap = await Dio().post(url, data: FormData.fromMap(veri));
    print(
        "sepetten sil: $sepet_yemek_id $kullanici_adi => ${cevap.data.toString()}");
  }

}


