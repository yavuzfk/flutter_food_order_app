import 'package:flutter/material.dart';

class BottomAppBarS extends StatelessWidget {
  const BottomAppBarS({
    Key? key,
    required TabController tabController,
    required this.backgroundColor,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;
  final double _iconSize = 35;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
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

              },
              child: Icon(
                Icons.restaurant_menu,
                size: _iconSize,
              ),
            ),
          ),
          Tab(
            icon: GestureDetector(
              onTap: () {

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
