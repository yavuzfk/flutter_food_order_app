import 'package:flutter/material.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';
import 'package:flutter_order_food_app/utilities/text_items.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TextItems {
  final int tutar = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Process', style: TextItems.headerText),
        backgroundColor: ColorItems.backgroundColor,
      ),
      body: Container(
        color: ColorItems.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Your Card', style: TextItems.headerText),
              Text('Check and Payment', style: TextItems.lowGrayText),
              //verileri iceren bir liste yapilacak
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                child: Text("Check Out: $tutar TL"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
