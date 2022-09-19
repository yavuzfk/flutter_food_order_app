import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/anasayfa_cubit.dart';
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
            return ListView.builder(
                itemCount: foodList.length, //3
                itemBuilder: (context, index) {
                  var food = foodList[index];
                  print(food.yemek_adi);
                  return Card(
                    //  color: ColorItems.backgroundColor,
                    child:
                    GestureDetector(
                        onTap: () {},
                        child:  FoodCard(
                          imagePath: 'assets/pizza.jpg', foodName: food.yemek_adi, foodPrice: food.yemek_fiyat,)),
                    // const SizedBox(width: 15),
                  );
                });
          } else {
            print("ELS-----------------E");
            return const Center();
          }
        },
      ),
    );
  }
}
