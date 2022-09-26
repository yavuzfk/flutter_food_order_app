import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/sepet_cubit.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';
import 'package:flutter_order_food_app/utilities/text_styles.dart';

class FoodCardSepet extends StatefulWidget {
  FoodCardSepet(
      {Key? key,
      required this.imagePath,
      required this.foodName,
      required this.foodPrice,
      required this.sepetYemekId,
      required this.kullaniciAdi,
      required this.foodSize})
      : super(key: key);
  final String imagePath;
  final String foodName;
  final String foodPrice;
  final String sepetYemekId;
  final String kullaniciAdi;
   int foodSize;
  @override
  State<FoodCardSepet> createState() => _FoodCardSepetState();
}

class _FoodCardSepetState extends State<FoodCardSepet> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(
              //  width: 160,
              height: 110,
              child: Image.network(widget.imagePath)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.foodName,
                style: MyTextStyles.headerText,
              ),
              // Text("Sağlıklı",style: TextItems.lowGrayText,),
              Text(
                "${widget.foodPrice} TL ",
                style: MyTextStyles.headerText,
              ),
            ],
          ),
          const SizedBox(height: 10),
          incrementButtons(context)
        ],
      ),
    );
  }

  Row incrementButtons(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(onPressed: () {
              setState(() {
                widget.foodSize--;
              });
            }, child: const Text(
              "-",
              style: TextStyle(fontSize: 30,color: Colors.deepOrange),
            ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Text(widget.foodSize.toString()),
            ),
            TextButton(onPressed: () {
              setState(() {
                widget.foodSize++;
              });
            }, child: const Text(
              "+",
              style: TextStyle(fontSize: 20,color: Colors.deepOrange),
            ),),
            Spacer(),
            TextButton(
                onPressed: () {
                  context
                      .read<SepetCubit>()
                      .sepettenSil(widget.sepetYemekId, widget.kullaniciAdi);

                },
                child: const Text(
                  "Kaldır",
                  style: TextStyle(color: Colors.red, fontSize: 10),
                ))
          ],
        );
  }
}
