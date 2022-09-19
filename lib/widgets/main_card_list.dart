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
            return ListView.builder(
                // shrinkWrap: true,
                itemCount: foodList.length, //3
                itemBuilder: (context, index) {
                  var food = foodList[index];
                  print(food.yemek_adi);
                  return GridView.count(
                    crossAxisCount: 2,
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child:  FoodCard(
                            imagePath: 'assets/pizza.jpg', foodName: food.yemek_adi, foodPrice: food.yemek_fiyat,)),
                    ],

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

/*
*
* Card(
      color: ColorItems.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children:   [
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetail(foodPrice: 45, foodName: "Makarna"),));
                  },
                  child: FoodCard(imagePath: 'assets/pizza.jpg')),
              SizedBox(width: 15),
              FoodCard(imagePath: 'assets/pizza.jpg'),
              SizedBox(width: 15),
              FoodCard(imagePath: 'assets/pizza.jpg'),
              SizedBox(width: 15),
              FoodCard(imagePath: 'assets/pizza.jpg'),
              SizedBox(width: 15),
              FoodCard(imagePath: 'assets/pizza.jpg'),
            ],
          ),
          Column(
            children:  const [
              FoodCard(imagePath: 'assets/pizza.jpg'),
              SizedBox(width: 15),
              FoodCard(imagePath: 'assets/pizza.jpg'),
              SizedBox(width: 15),
              FoodCard(imagePath: 'assets/pizza.jpg'),
              SizedBox(width: 15),
              FoodCard(imagePath: 'assets/pizza.jpg'),
              SizedBox(width: 15),
              FoodCard(imagePath: 'assets/pizza.jpg'),
            ],
          ),
        ],
      ),
    );
* */
