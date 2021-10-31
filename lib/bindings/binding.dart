import 'package:app/getx/controller/dish_detail_controller.dart';
import 'package:app/getx/controller/home_controller.dart';
import 'package:app/getx/controller/login_controller.dart';
import 'package:app/getx/controller/notify_controller.dart';
import 'package:app/getx/controller/order_controller.dart';
import 'package:app/getx/controller/order_detail_controller.dart';
import 'package:app/getx/controller/payment_controller.dart';

import 'package:app/getx/controller/search_controller.dart';
import 'package:app/getx/controller/user_controller.dart';

import 'package:app/getx/controller/menu_detail_controller.dart';

import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => OrderController());
    Get.lazyPut(() => DishDetailController());
    Get.lazyPut(() => OrderDetailController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NotifyController());
    Get.lazyPut(() => MenuDetailController());
    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => PaymentController());
  }
}
