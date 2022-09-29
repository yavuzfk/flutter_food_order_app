import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/sepet_cubit.dart';
import 'package:flutter_order_food_app/entitiy/cart_model.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';
import 'package:flutter_order_food_app/utilities/string_items.dart';
import 'package:flutter_order_food_app/utilities/style_items.dart';
import 'package:flutter_order_food_app/utilities/text_styles.dart';
import 'package:flutter_order_food_app/views/order_page/widgets/siparis_button.dart';


class OrderPage extends StatefulWidget {
  const OrderPage({Key? key, required this.userName}) : super(key: key);
  final String userName;
  @override
  State<OrderPage> createState() => _OrderPageState();
}

var tutar;

class _OrderPageState extends State<OrderPage> with MyTextStyles {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SepetCubit>().sepettekileriGetir(widget.userName);
    tutar = 0;
  }

  int foodSize = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sepetim', style: MyTextStyles.headerText),
        backgroundColor: ColorItems.backgroundColor,
        leading: IconButton(
          onPressed: Navigator
              .of(context)
              .pop,
          icon: const Icon(
            Icons.arrow_back,
            color: ColorItems.orangeColor,
          ),
        ),
      ),
      body: Container(
        //  color: ColorItems.backgroundColor,
        width: 395,
        decoration: BoxDecoration(
          gradient: StyleItems().linearGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 600,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 570,
                        child: BlocBuilder<SepetCubit, List<Cart>>(
                            builder: (context, foodList) {
                              tutar = 0;
                              tutar = tutarHesapla(foodList);
                              if (foodList.isNotEmpty) {
                                return Column(
                                  children: [
                                    Expanded(
                                      child: MediaQuery.removePadding(
                                        context: context,
                                        removeTop: true,
                                        child: Center(
                                          child: SizedBox(
                                            width: 220,
                                            child: GridView.builder(
                                              gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 1,
                                                  crossAxisSpacing: 5,
                                                  mainAxisSpacing: 5),
                                              itemCount: foodList.length,
                                              itemBuilder: (
                                                  BuildContext context,
                                                  int index) {
                                                var food = foodList[index];
                                                print(food.foodName);
                                                return SizedBox(
                                                  // color: Colors.red,
                                                  child: Card(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          //  width: 160,
                                                            height: 110,
                                                            child: Image
                                                                .network(
                                                                StringItems()
                                                                    .imagesMainPath +
                                                                    food
                                                                        .foodImageName)),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment
                                                              .spaceEvenly,
                                                          children: [
                                                            Text(
                                                              food.foodName,
                                                              style: MyTextStyles
                                                                  .headerText,
                                                            ),
                                                            Text(
                                                              "${food
                                                                  .foodPrice} TL ",
                                                              style: MyTextStyles
                                                                  .headerText,
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 10),
                                                        IncrementButtonsRow(
                                                            context, food,
                                                            foodList),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Tutar: ${tutar.toString()}TL",
                                      style: MyTextStyles.welcomeTextStyle,
                                    )
                                  ],
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
               Container(
                 width: MediaQuery.of(context).size.width * 0.86,
                 child: SimpleRoundIconButton2(
                   backgroundColor: ColorItems.orangeColor,
                   buttonText:  Text(
                     StringItems().siparisButtonText,
                     style: const TextStyle(color: Colors.white),
                   ),
                   icon: const Icon(Icons.payment),
                   iconAlignment: Alignment.centerRight,
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }

  Row IncrementButtonsRow(BuildContext context, Cart food,
      List<Cart> foodList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              foodSize--;
            });
          },
          child: const Text(
            "-",
            style: TextStyle(fontSize: 30, color: Colors.deepOrange),
          ),
        ),
        Text(foodSize.toString()),
        TextButton(
          onPressed: () {
            setState(() {
              foodSize++;
            });
          },
          child: const Text(
            "+",
            style: TextStyle(fontSize: 20, color: Colors.deepOrange),
          ),
        ),
        const Spacer(),
        TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(StringItems().deleteFoodMessage),
                action: SnackBarAction(
                  label: "Evet",
                  onPressed: () {
                    context
                        .read<SepetCubit>()
                        .sepettenSil(food.cartFoodId, food.userName);

                    if (foodList.length == 1) {
                      setState(() {
                        foodList.clear();
                      });
                    }
                  },
                ),
              ));
            },
            child: const Text(
              "Kaldır",
              style: TextStyle(color: Colors.red, fontSize: 10),
            ))
      ],
    );
  }

  int tutarHesapla(List foodList) {
    for (int i = 0; i < foodList.length; i++) {
      tutar += int.parse(foodList[i].foodPrice) *
          int.parse(foodList[i].foodOrderCount);
    }
    return tutar;
  }


}