import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/sepet_cubit.dart';
import 'package:flutter_order_food_app/repo/url_extension.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';
import 'package:flutter_order_food_app/utilities/string_items.dart';
import 'package:flutter_order_food_app/utilities/text_styles.dart';

String mockText =
    "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ev"
    "er since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ";

class FoodDetail extends StatefulWidget {
  FoodDetail(
      {Key? key,
      required this.foodPrice,
      required this.foodName,
      required this.imagePath,
      required this.userName})
      : super(key: key);
  final int foodPrice;
  final String foodName;
  final String imagePath;
  final String userName;
  int foodSize = 1;
  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorItems.backgroundColor,
      ),
      body: Container(
        color: ColorItems.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.network(
                      "${StringItems().mainUrl}${UrlPaths.resimler.name}/${widget.imagePath}"),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.foodName, style: MyTextStyles.headerText),
                    Text("${widget.foodPrice.toString()} TL",
                        style: MyTextStyles.headerText),
                  ],
                ),
              ),
              Text(
                mockText,
                style: MyTextStyles.lowGrayText,
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: incrementButtons(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        print(widget.foodSize);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "${widget.foodSize} adet ${widget.foodName} sepete eklendi!")));
                        context.read<SepetCubit>().sepeteEkle(
                            widget.foodName,
                            widget.imagePath,
                            widget.foodPrice,
                            widget.foodSize,
                            widget.userName);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepOrange,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text("SEPETE EKLE")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row incrementButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              widget.foodSize--;
            });
          },
          child: const Text(
            "-",
            style: TextStyle(fontSize: 30, color: Colors.deepOrange),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(widget.foodSize.toString()),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              widget.foodSize++;
            });
          },
          child: const Text(
            "+",
            style: TextStyle(fontSize: 20, color: Colors.deepOrange),
          ),
        ),
      ],
    );
  }
}
