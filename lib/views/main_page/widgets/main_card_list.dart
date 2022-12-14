import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/main_page_cubit.dart';
import 'package:flutter_order_food_app/repo/url_extension.dart';
import 'package:flutter_order_food_app/utilities/string_items.dart';
import 'package:flutter_order_food_app/views/food_detail_page/food_detail_page.dart';
import '../../../cubit/main_page_cubit.dart';
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
    context.read<MainPageCubit>().getAllFood();
  }

  String foodType = "-";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainPageCubit, List<Food>>(
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
                    print(food.foodName);
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FoodDetail(
                                  imagePath: food.foodImageName,
                                  foodPrice: int.parse(food.foodPrice),
                                  foodName: food.foodName,
                                  userName: widget.userName),
                            ));
                      },
                      child: FoodCard(
                        imagePath:
                            "${StringItems().mainUrl}${UrlPaths.resimler.name}/${food.foodImageName}",
                        foodName: food.foodName,
                        foodPrice: food.foodPrice.toString(),
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
