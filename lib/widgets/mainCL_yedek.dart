import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/anasayfa_cubit.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';
import '../cubit/anasayfa_cubit.dart';
import '../entitiy/food_model.dart';
import 'food_card_widget.dart';

class MainCardListYedek extends StatefulWidget {
  const MainCardListYedek({
    Key? key,
  }) : super(key: key);

  @override
  State<MainCardListYedek> createState() => _MainCardListYedekState();
}

class _MainCardListYedekState extends State<MainCardListYedek> {
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
                        imagePath: 'assets/pizza.jpg',
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
