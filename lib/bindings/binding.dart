import 'package:app/getx/controller/home_controller.dart';
import 'package:app/getx/controller/login_controller.dart';
import 'package:app/getx/controller/notify_controller.dart';
import 'package:app/getx/controller/order_controller.dart';
import 'package:app/getx/controller/order_detail_controller.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/getx/controller/menu_detail_controller.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  // int categoryID;
  // Binding({this.categoryID = 3});

  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => OrderController());
    // Get.lazyPut(() => OrderDetailController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NotifyController());
    Get.lazyPut(() => MenuDetailController());
  }
}
