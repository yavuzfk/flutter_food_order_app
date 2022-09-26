import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/entitiy/sepet_model.dart';
import 'package:flutter_order_food_app/repo/food_dao_repository.dart';

class SepetCubit extends Cubit<List<Sepet>> {
  SepetCubit():super(<Sepet>[]);

  var foodRepo = FoodDaoRepository();

  Future<void> sepeteEkle(String yemek_adi, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    await foodRepo.sepeteEkle(yemek_adi, yemek_resim_adi, yemek_fiyat, yemek_siparis_adet, kullanici_adi);
  }

  Future<void> sepettekileriGetir(String kullanici_adi) async {
    var list = await foodRepo.sepetiGetir(kullanici_adi);
    emit(list);
  }

  Future<void> sepettenSil(String sepet_yemek_id, String kullanici_adi) async {
      await foodRepo.sepettenYemekSil(sepet_yemek_id, kullanici_adi);
      await sepettekileriGetir(kullanici_adi);
  }
}