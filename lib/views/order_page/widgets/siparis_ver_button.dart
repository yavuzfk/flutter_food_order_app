import 'package:flutter/material.dart';
import 'package:flutter_order_food_app/utilities/string_items.dart';

class SiparisButton extends StatelessWidget {
  const SiparisButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(StringItems().alertTitle),
                content: Text(StringItems().alertMessage),
              );
            });
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.deepOrange,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      child: const Text("Sipariş Ver"),
    );
  }
}