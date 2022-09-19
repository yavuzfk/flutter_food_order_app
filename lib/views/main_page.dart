import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/anasayfa_cubit.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';
import 'package:flutter_order_food_app/utilities/text_items.dart';
import 'package:flutter_order_food_app/views/order_page.dart';
import 'package:flutter_order_food_app/widgets/bottom_app_bar.dart';
import 'package:flutter_order_food_app/widgets/mainCL_yedek.dart';
import 'package:flutter_order_food_app/widgets/product_type_button.dart';
import 'package:flutter_order_food_app/widgets/search_button.dart';
import '../widgets/main_card_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TextEditingController _textEditingController;
  late final TabController _tabController;
  final String userName = "Yavuz";

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _tabController = TabController(length: 3, vsync: this);
    context.read<AnasayfaCubit>().getAllFood();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: ColorItems.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.person,
                          color: ColorItems.notificationIconColor),
                      SizedBox(
                        width: 150,
                        child: ListTile(
                          subtitle: const Text("Welcome"),
                          title: Text("Hi $userName"),
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderPage()));
                        },
                        child: const Icon(
                          Icons.shopping_cart_checkout,
                          color: ColorItems.notificationIconColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 280,
                        child: TextField(
                          controller: _textEditingController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecorator.searchInputDecoration,
                        ),
                      ),
                      SearchButton(
                          textEditingController: _textEditingController)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        ProductTypeButton(type: "Food"),
                        ProductTypeButton(type: "Drink"),
                        ProductTypeButton(type: "Dessert"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discover",
                          style: TextItems.headerText,
                        ),
                        TextButton(
                          onPressed: () {
                            print("see all 1 clicked");
                          },
                          child: Text(
                            "see all",
                            style: TextItems.lowGrayText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 0.0),
                    height: 460.0,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: const [
                        SizedBox(height: 550, child: MainCardListYedek()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
            height: 60,
            child: BottomAppBarS(
              tabController: _tabController,
              backgroundColor: ColorItems.backgroundColor,
            )));
  }
}

void getFoodProducts() {
  print("get foods");
}

void getDrinkProducts() {
  print("get drink");
}

void getDessertProducts() {
  print("get desssert");
}

class InputDecorator {
  static InputDecoration searchInputDecoration = InputDecoration(
    //  border: OutlineInputBorder(),
    labelText: 'Search',
    labelStyle:
        const TextStyle(fontSize: 16, color: ColorItems.notificationIconColor),
    hintText: 'Enter your search',
    hintStyle: const TextStyle(fontSize: 16),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    filled: true,
    //contentPadding: EdgeInsets.all(16),
    prefixIcon: const Icon(Icons.search),
  );
}
