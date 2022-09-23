import 'package:flutter/material.dart';

import '../main_page.dart';

class ProductTypeButton extends StatelessWidget {
  const ProductTypeButton({
    Key? key, required this.type,
  }) : super(key: key);
  final String type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 90,
      child: ElevatedButton(
          onPressed: () {
            if(type=='Food'){
              getFoodProducts();
            }else if(type=='Drink'){
              getDrinkProducts();
            }else if(type == 'Dessert'){
              getDessertProducts();
            }
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          child: Text(type)),
    );
  }
}