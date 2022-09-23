
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/entitiy/food_model.dart';
import 'package:flutter_order_food_app/repo/food_dao_repository.dart';

class AnasayfaCubit extends Cubit<List<Food>> {
  AnasayfaCubit():super(<Food>[]);

  var foodRepo = FoodDaoRepository();

  Future<void> getAllFood() async {
    var list = await foodRepo.getAllFood();
    emit(list);
  }

  // Future<String> getFoodImage(String yemek_resim_adi) async {
  //   String list = (await foodRepo.getFoodImage(yemek_resim_adi)) as String;
  //   return list;
  //   //emit(list);
  // }
}