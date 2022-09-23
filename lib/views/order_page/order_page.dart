import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/sepet_cubit.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';
import 'package:flutter_order_food_app/utilities/text_styles.dart';
import 'package:flutter_order_food_app/views_and_widgets/order_page/widgets/sepet_list.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key, required this.userName}) : super(key: key);
  final String userName;
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with MyTextStyles {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SepetCubit>().sepettekileriGetir(widget.userName);
  }
  int tutar = 77;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ödeme İşlemleri', style: MyTextStyles.headerText),
        backgroundColor: ColorItems.backgroundColor,
      ),
      body: Container(
        //  color: ColorItems.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
             Padding(
               padding: const EdgeInsets.only(left: 70),
               child: Align(
                   alignment: Alignment.centerLeft,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Sepetim', style: MyTextStyles.headerText),
                       Text('Kondtrol ve Ödeme Noktası',
                           style: MyTextStyles.lowGrayText)
                     ],
                   ),)
             ),
              Container(
                color: Colors.red,
                  height: 460,
                  child: SepetList(
                    userName: widget.userName,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tutar=tutar;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  child: Text("Sipariş Ver"),
                ),
              )

              //verileri iceren bir liste yapilacak
            ],
          ),
        ),
      ),
    );
  }
}
