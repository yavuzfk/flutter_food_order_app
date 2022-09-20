import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/anasayfa_cubit.dart';
import '../cubit/anasayfa_cubit.dart';
import '../entitiy/food_model.dart';
import 'food_card_widget.dart';

class MainCardList extends StatefulWidget {
  const MainCardList({
    Key? key,
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
                      mainAxisSpacing: 5
                  ),

                  itemCount: foodList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var food = foodList[index];
                    print(food.yemek_adi);
                    return GestureDetector(
                      onTap: () {},
                      child: FoodCard(
                        imagePath: "http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}",
                        foodName: food.yemek_adi,
                        foodPrice: food.yemek_fiyat,
                      ),
                    );
                  }),
            );
          } else {
            print("ELS-----------------E");
            return const Center();
          }
        },
      ),
    );
  }
}


