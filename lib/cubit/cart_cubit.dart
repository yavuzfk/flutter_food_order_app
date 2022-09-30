import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/entitiy/cart_model.dart';
import 'package:flutter_order_food_app/repo/food_dao_repository.dart';

class CartCubit extends Cubit<List<Cart>> {
  CartCubit():super(<Cart>[]);

  final _foodRepo = FoodDaoRepository();

  Future<void> addCart(String foodName, String foodImageName, int foodPrice, int foodOrderCount, String userName) async {
    await _foodRepo.sepeteEkle(foodName, foodImageName, foodPrice, foodOrderCount, userName);
  }

  Future<void> getAllFoodFromCart(String userName) async {
    var list = await _foodRepo.sepetiGetir(userName);
    emit(list);
  }

  Future<void> deleteFromCart(String cartFoodId, String userName) async {
      await _foodRepo.sepettenYemekSil(cartFoodId, userName);
      await getAllFoodFromCart(userName);
  }
}