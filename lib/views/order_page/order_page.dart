import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/sepet_cubit.dart';
import 'package:flutter_order_food_app/entitiy/sepet_model.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';
import 'package:flutter_order_food_app/utilities/text_styles.dart';
import 'package:flutter_order_food_app/views/order_page/widgets/food_cart_sepet.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sepetim', style: MyTextStyles.headerText),
        backgroundColor: ColorItems.backgroundColor,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back,
            color: ColorItems.orangeColor,
          ),
        ),
      ),
      body: Container(
        //  color: ColorItems.backgroundColor,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  ColorItems.gradientColor,
                  Colors.white60
                ]
            )
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
                        // width: 360,
                        height: 570,
                        child: BlocBuilder<SepetCubit, List<Sepet>>(
                            builder: (context, foodList) {
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
                                        // height: 450,
                                        child: GridView.builder(
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 1,
                                                  crossAxisSpacing: 5,
                                                  mainAxisSpacing: 5),
                                          itemCount: foodList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            var food = foodList[index];

                                            tutar += (int.parse(
                                                    food.yemek_siparis_adet) *
                                                int.parse(food.yemek_fiyat));

                                            print(food.yemek_adi);
                                            return SizedBox(
                                              // color: Colors.red,
                                              child: FoodCardSepet(
                                                imagePath:
                                                    "http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}",
                                                foodName: food.yemek_adi,
                                                foodPrice:
                                                    food.yemek_fiyat.toString(),
                                                kullaniciAdi:
                                                    food.kullanici_adi,
                                                sepetYemekId:
                                                    food.sepet_yemek_id,
                                                foodSize: int.parse(
                                                    food.yemek_siparis_adet),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 1,),

                                Text(
                                  "Tutar: ${tutar.toString()}TL",style: MyTextStyles.welcomeTextStyle,
                                )
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        }),
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const AlertDialog(
                            title: Text("Sipariş Başarıyla Verildi!!"),
                            content: Text("Lokasyon eklemek için gereken feature eklenecektir."),
                          );
                        });


                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                  child: const Text("Sipariş Ver"),
                ),
              )

              //verileri iceren bir liste yapilacak
            ],
          ),
        ),
      ),
    );
  }

  int tutarHesapla(List foodList) {
    for (int i = 0; i < foodList.length; i++) {
      tutar += int.parse(foodList[i].yemek_fiyat) *
          int.parse(foodList[i].yemek_siparis_adet);
    }
    return tutar;
  }
}
