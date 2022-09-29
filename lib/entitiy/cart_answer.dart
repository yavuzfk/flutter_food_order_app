
import 'package:flutter_order_food_app/entitiy/cart_model.dart';
class CartAnswer{
  List<Cart> cart;
  CartAnswer({required this.cart});

  factory CartAnswer.fromJson(Map<String, dynamic> json){
    final jsonArray = json['sepet_yemekler'] as List;
    List<Cart> cart = jsonArray.map((jsonArrayNesnesi) => Cart.fromJson(jsonArrayNesnesi)).toList();
    return CartAnswer(cart: cart);
  }
}