import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/anasayfa_cubit.dart';
import 'package:flutter_order_food_app/utilities/color_items.dart';
import 'package:flutter_order_food_app/utilities/text_styles.dart';
import 'package:flutter_order_food_app/views/main_page/widgets/bottom_app_bar.dart';
import 'package:flutter_order_food_app/views/main_page/widgets/food_card_widget.dart';
import 'package:flutter_order_food_app/views/main_page/widgets/product_type_button.dart';
import 'package:flutter_order_food_app/views/main_page/widgets/search_button.dart';
import 'package:flutter_order_food_app/views/order_page/order_page.dart';
import '../../entitiy/food_model.dart';
import '../food_detail_page/food_detail_page.dart';
import 'widgets/main_card_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.userName}) : super(key: key);
  final String userName;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TextEditingController _textEditingController;
  late final TabController _tabController;

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
  String foodType = "-";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
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
                            subtitle: const Text("Hoşgeldin"),
                            title: Text("Merhaba ${widget.userName}"),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderPage(userName: widget.userName)));
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
                            textEditingController: _textEditingController,
                            userName: widget.userName,
                        )
                      ],
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 16.0),
                    //   child: FoodTypeButtons(),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Keşfet",
                            style: MyTextStyles.headerText,
                          ),
                          TextButton(
                            onPressed: () {
                              print("see all 1 clicked");
                            },
                            child: Text(
                              "see all",
                              style: MyTextStyles.lowGrayText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 0.0),
                      height: 550.0,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children:  [
                          SizedBox(height: 540, child: MainCardList(
                            userName: widget.userName,

                          )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
            height: 60,
            child: BottomAppBarS(
              userName: widget.userName,
              tabController: _tabController,
              backgroundColor: ColorItems.backgroundColor,
            )));
  }

  // Row FoodTypeButtons() {
  //   return Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: const [
  //                       ProductTypeButton(type: "Yemek"),
  //                       ProductTypeButton(type: "İçecek"),
  //                       ProductTypeButton(type: "Tatlı"),
  //                     ],
  //                   );
  // }
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
