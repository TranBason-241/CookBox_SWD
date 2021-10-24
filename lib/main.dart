import 'package:app/bindings/binding.dart';
import 'package:app/models/order_detail.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/notify_screen.dart';
import 'package:app/screens/order/new_order_screen.dart';
import 'package:app/screens/order_detail_screen.dart';
import 'package:app/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Binding().dependencies();
  runApp(GetMaterialApp(
    initialRoute: '/login',
    getPages: [
      GetPage(
        name: '/login',
        page: () => LoginScreen(),
        binding: Binding(),
      ),
      GetPage(
        name: '/home',
        page: () => Home(),
        binding: Binding(),
      ),
      GetPage(
        name: '/order',
        page: () => OrderScreen(),
        binding: Binding(),
      ),
      GetPage(
        name: '/new_order',
        page: () => NewOrderScreen(),
        binding: Binding(),
      ),
      // GetPage(
      //   name: '/order_detail',
      //   page: () => OrderDetailScreen(),
      //   binding: Binding(),
      // ),
      GetPage(
        name: '/notify',
        page: () => NotifyScreen(),
        binding: Binding(),
      ),
      GetPage(
        name: '/cart',
        page: () => CartScreen(),
        binding: Binding(),
      ),
    ],
  ));
}
