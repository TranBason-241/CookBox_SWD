import 'package:app/bindings/binding.dart';
import 'package:app/models/order_detail.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/notify_screen.dart';
import 'package:app/screens/order/cancelled_order_screen.dart';
import 'package:app/screens/order/completed_order_screen.dart';
import 'package:app/screens/order/new_order_screen.dart';
import 'package:app/screens/order/processing_order_screen.dart';
import 'package:app/screens/order_detail_screen.dart';
import 'package:app/screens/order_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await Firebase.initializeApp();
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
      GetPage(
        name: '/proccessing_order',
        page: () => ProccessingOrderScreen(),
        binding: Binding(),
      ),
      GetPage(
        name: '/completed_order',
        page: () => CompletedOrderScreen(),
        binding: Binding(),
      ),
      GetPage(
        name: '/calcel_order',
        page: () => CancelledOrderScreen(),
        binding: Binding(),
      ),
      GetPage(
        name: '/order_detail',
        page: () => OrderDetailScreen(),
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
