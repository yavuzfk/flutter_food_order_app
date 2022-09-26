import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/anasayfa_cubit.dart';
import 'package:flutter_order_food_app/views/food_detail_page/food_detail_page.dart';
import '../../../cubit/anasayfa_cubit.dart';
import '../../../entitiy/food_model.dart';
import 'food_card_widget.dart';

class MainCardList extends StatefulWidget {
  final String userName;
  const MainCardList({
    Key? key,
    required this.userName,
  }) : super(key: key);

  @override
  State<MainCardList> createState() => _MainCardListState();
}

class _MainCardListState extends State<MainCardList> {
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().getAllFood();
  }

  String foodType = "-";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AnasayfaCubit, List<Food>>(
        builder: (context, foodList) {
          if (foodList.isNotEmpty) {
            return MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: foodList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var food = foodList[index];
                    print(food.yemek_adi);

                    // bool deneme=false;
                    // if(food.yemek_adi == "Ayran" ||food.yemek_adi == "Fanta"){
                    //   deneme=true;
                    // }

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodDetail(
                                  imagePath: food.yemek_resim_adi,
                                  foodPrice: int.parse(food.yemek_fiyat),
                                  foodName: food.yemek_adi,
                                  userName: widget.userName),
                            ));
                      },
                      child: FoodCard(
                        imagePath:
                            "http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}",
                        foodName: food.yemek_adi,
                        foodPrice: food.yemek_fiyat.toString(),
                      ),
                    );
                  }),
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
// enum DrinksEnum{Ayran, Fanta, Su, Kahve}
// enum TatliEnum{Baklava, Kadayıf, Sütlaç, Tiramisu}
// enum FoodsEnum{Köfte, Lazanya, Makarna, Pizza} // 2 yemek eksik
