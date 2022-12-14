import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_order_food_app/cubit/main_page_cubit.dart';
import 'package:flutter_order_food_app/cubit/cart_cubit.dart';
import 'package:flutter_order_food_app/views/main_page/main_page.dart';
import 'package:flutter_order_food_app/views/welcome_page/welcome_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainPageCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const WelcomePage(),
      ),
    );
  }
}

