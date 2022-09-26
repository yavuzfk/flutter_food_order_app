import 'package:flutter/material.dart';
import 'package:flutter_order_food_app/views/food_detail_page/food_detail_page.dart';

class SearchButton extends StatelessWidget {
  SearchButton({
    Key? key,
    required TextEditingController textEditingController,
    required this.userName,
  })  : _textEditingController = textEditingController,
        super(key: key);

  var foodMap = {
    "Ayran": 3,
    "Fanta": 6,
    "Baklava": 25,
    "Kadayıf": 22,
    "Kahve": 16,
    "Köfte": 25,
    "Lazanya": 32,
    "Makarna": 28,
    "Pizza": 45,
    "Su": 2,
    "Sütlaç": 10,
    "Tiramisu": 23
  };
  final TextEditingController _textEditingController;
  final String userName;
  int foodPrice = 0;
  bool isThere = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
          onPressed: () {
            print(_textEditingController.text);

            foodMap.forEach((key, value) {
              if (key == _textEditingController.text) {
                foodPrice = value;
                isThere = true;
              }
            });

            isThere
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetail(
                          imagePath:
                              "${_textEditingController.text.toLowerCase()}.png",
                          foodPrice: foodPrice,
                          foodName: _textEditingController.text,
                          userName: userName),
                    ))
                :  const SizedBox.shrink();
          },
          icon: const Icon(Icons.search, color: Colors.white)),
    );
  }
}
