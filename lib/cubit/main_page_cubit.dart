import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/entitiy/food_model.dart';
import 'package:flutter_order_food_app/repo/food_dao_repository.dart';

class MainPageCubit extends Cubit<List<Food>> {
  MainPageCubit():super(<Food>[]);

  var foodRepo = FoodDaoRepository();

  Future<void> getAllFood() async {
    var list = await foodRepo.getAllFood();
    emit(list);
  }
}