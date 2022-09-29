import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_order_food_app/entitiy/food_model.dart';
import 'package:flutter_order_food_app/entitiy/food_answer.dart';
import 'package:flutter_order_food_app/entitiy/cart_answer.dart';
import 'package:flutter_order_food_app/entitiy/cart_model.dart';
import 'package:flutter_order_food_app/repo/url_extension.dart';
import 'package:flutter_order_food_app/utilities/text_styles.dart';
import 'package:flutter_order_food_app/utilities/string_items.dart';

// API isimleri ve icerik Turkce yazildigi icin Turkce kullanilmistir.

class FoodDaoRepository with MyTextStyles {
  final String urlTail = ".php";

  List<Food> parseFoodAnswer(String answer) {
    return FoodAnswer.fromJson(json.decode(answer)).food;
  }

  List<Cart> parseSepetAnswer(String answer) {
    return CartAnswer.fromJson(json.decode(answer)).cart;
  }

  Future<List<Food>> getAllFood() async {
    var url = StringItems().mainUrl + UrlPaths.tumYemekleriGetir.name+urlTail;
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
    var url = StringItems().mainUrl + UrlPaths.sepeteYemekEkle.name + urlTail;
    var data = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi": kullanici_adi
    };
    var answer = await Dio().post(url, data: FormData.fromMap(data));
    print("sepete Ekle: ${answer.data.toString()}");
    print(
        "Yemek adı: $yemek_adi - Yemek resim adi: $yemek_resim_adi - yemek siparis adedi: $yemek_siparis_adet - kullanici: $kullanici_adi");
  }

  Future<List<Cart>> sepetiGetir(String kullanici_adi) async {
    var url = StringItems().mainUrl + UrlPaths.sepettekiYemekleriGetir.name + urlTail;
    var data = {"kullanici_adi": kullanici_adi};
    var answer = await Dio().post(url, data: FormData.fromMap(data));
    return parseSepetAnswer(answer.data.toString());
  }

  Future<void> sepettenYemekSil(
      String sepet_yemek_id, String kullanici_adi) async {
    var url = StringItems().mainUrl + UrlPaths.sepettenYemekSil.name + urlTail;
    var data = {
      "sepet_yemek_id": sepet_yemek_id,
      "kullanici_adi": kullanici_adi
    };
    var answer = await Dio().post(url, data: FormData.fromMap(data));
    print(
        "sepetten sil: $sepet_yemek_id $kullanici_adi => ${answer.data.toString()}");
  }
}


