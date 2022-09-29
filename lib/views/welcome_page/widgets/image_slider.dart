import 'package:flutter/material.dart';
import 'package:flutter_order_food_app/cubit/anasayfa_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/utilities/string_items.dart';
import '../../../cubit/anasayfa_cubit.dart';
import '../../../entitiy/food_model.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
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
            return Container(
               color: Colors.redAccent.withOpacity(0.1),
              child: ListView.builder(

                  scrollDirection: Axis.horizontal,
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    var food = foodList[index];
                    print(food.foodName);
                    return Card(
                      elevation: 8,
                      shadowColor: Colors.red,
                      child: Column(
                        children: [
                          SizedBox(
                              //width: 160,
                              height: 200,
                              child: Image.network(
                                  StringItems().imagesMainPath + food.foodImageName)),
                        ],
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
