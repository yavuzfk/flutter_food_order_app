import 'package:flutter/material.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';
import 'package:flutter_order_food_app/utilities/text_styles.dart';
import 'package:flutter_order_food_app/views/main_page/main_page.dart';
import 'package:flutter_order_food_app/views/welcome_page/widgets/image_slider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          // height: 660,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    ColorItems.gradientColor,
                    Colors.white10
                  ]
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(

              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
                  child: Text(
                    "Hızlı Yemek Siparişi",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    height: 210.0,
                  //  child: const ImageSlider(),
                  ),
                ),
                const SizedBox(
                  height: 195,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "DEVAM ETMEK İÇİN LÜTFEN KULLANICI ADINI GİRİN",
                      style: MyTextStyles.lowWhiteText,
                    ),
                  ),
                ),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    labelText: "Kullanıcı Adı",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 2),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MainPage(userName: _controller.text),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),

                    ),
                    child: const Text("Yemek Sipariş Ver"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
