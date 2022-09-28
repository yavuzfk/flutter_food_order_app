import 'package:flutter/material.dart';
import 'package:flutter_order_food_app/views/main_page/main_page.dart';
import 'package:flutter_order_food_app/views/order_page/order_page.dart';

class BottomAppBarS extends StatelessWidget {
  const BottomAppBarS({
    Key? key,
    required TabController tabController,
    required this.backgroundColor, required this.userName,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final double _iconSize = 30;
  final Color backgroundColor;
  final String userName;

  @override
  Widget build(BuildContext context) {
    const String _userPageMessage = "Kullanıcı Sayfası Henüz Oluşturulmadı";

    return BottomAppBar(
      color: backgroundColor,
      child: TabBar(
        padding: EdgeInsets.zero,
        onTap: (value) {},
        controller: _tabController,
        tabs: [
          Tab(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(userName: userName)));
              },
              child: Icon(
                Icons.home,
                size: _iconSize,
              ),
            ),
          ),
          Tab(
            icon: GestureDetector(
              onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(userName:userName ),));
              },
              child: Icon(
                Icons.shopping_cart,
                size: _iconSize,
              ),
            ),
          ),
          Tab(
            icon: GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_userPageMessage)));
              },
              child: Icon(
                Icons.person_outline,
                size: _iconSize,
              ),
            ),
          ),
        ],
        labelColor: Colors.deepOrange,
        unselectedLabelColor: Colors.black45,
        indicatorColor: Colors.transparent,
      ),
    );
  }
}
