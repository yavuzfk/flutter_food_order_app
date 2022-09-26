// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_order_food_app/cubit/sepet_cubit.dart';
// import 'package:flutter_order_food_app/entitiy/sepet_model.dart';
// import 'package:flutter_order_food_app/views/order_page/widgets/food_cart_sepet.dart';
//
// var tutar;
//
// class SepetList extends StatefulWidget {
//   final String userName;
//   const SepetList({Key? key, required this.userName}) : super(key: key);
//
//   @override
//   State<SepetList> createState() => _SepetListState();
// }
//
// class _SepetListState extends State<SepetList> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<SepetCubit>().sepettekileriGetir(widget.userName);
//     tutar = 0;
//   }
//
//   // int calcul(List list) {
//   //   for (int i = 0; i < list.length; i++) {
//   //     tutar += int.parse(list[i].yemek_fiyat) *
//   //         int.parse(list[i].yemek_siparis_adet);
//   //   }
//   //
//   //   return tutar;
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     // var foodKontrolList = <SepettenAl>[];
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 350,
//             height: 150,
//             child: BlocBuilder<SepetCubit, List<Sepet>>(
//                 builder: (context, foodList) {
//               tutar = 0;
//               Sepet fakeSepet = Sepet(
//                   sepet_yemek_id: "555",
//                   yemek_adi: "null",
//                   yemek_resim_adi: "null",
//                   yemek_fiyat: "null",
//                   yemek_siparis_adet: "jjj",
//                   kullanici_adi: "jjj");
//
//               for (int i = 0; i < foodList.length; i++) {
//                 tutar += int.parse(foodList[i].yemek_fiyat) *
//                     int.parse(foodList[i].yemek_siparis_adet);
//               }
//               if (foodList.isNotEmpty) {
//                 return Column(
//                   children: [
//                     Expanded(
//                       child: MediaQuery.removePadding(
//                         context: context,
//                         removeTop: true,
//                         child: Center(
//                           child: SizedBox(
//                             width: 220,
//                             // height: 450,
//                             child: GridView.builder(
//                               gridDelegate:
//                                   const SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 1,
//                                       crossAxisSpacing: 5,
//                                       mainAxisSpacing: 5),
//                               itemCount: foodList.length,
//                               itemBuilder: (BuildContext context, int index) {
//                                 var food = foodList[index];
//
//                                 // tutar += (int.parse(food.yemek_siparis_adet) * int.parse(food.yemek_fiyat));
//
//
//
//
//                                 print(food.yemek_adi);
//                                 return SizedBox(
//                                   // color: Colors.red,
//                                   child: FoodCardSepet(
//                                     imagePath:
//                                         "http://kasimadalan.pe.hu/yemekler/resimler/${food.yemek_resim_adi}",
//                                     foodName: food.yemek_adi,
//                                     foodPrice: food.yemek_fiyat.toString(),
//                                     kullaniciAdi: food.kullanici_adi,
//                                     sepetYemekId: food.sepet_yemek_id,
//                                     foodSize:
//                                         int.parse(food.yemek_siparis_adet),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Text(
//                       tutar.toString(),
//                     )
//                   ],
//                 );
//               } else {
//                 return const SizedBox.shrink();
//               }
//             }),
//           ),
//           // const SizedBox(
//           //   height: 20,
//           // ),
//         ],
//       ),
//     ),
//     );
//   }
// }
