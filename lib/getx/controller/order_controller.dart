import 'package:app/models/order.dart';
import 'package:app/screens/order_screen.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  // List<Item> listItem = <Item>[].obs;
  // RxList<Item> productList = <Item>[].obs;
  // RxList<Order> order = <Order>[].obs;
  // List<Order> order = <Order>[].obs;
  var order = Order();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchOrder();
  }

  // var order = new Order();
  // Future<Order> fetchOrder() async {
  Future<Order> fetchOrder() async {
    final response = await http
        .get(Uri.parse('http://54.255.129.30:8100/api/v1/user/orders'));
    if (response.statusCode == 200) {
      print("ALOOO");
      order = orderFromJson(response.body);
      // print("So luong" + order.items!.length.toString());
      // (order.items!.forEach((element) {
      //   print(element);
      // }));
      // listItem = order.items as List<Item>;
      // update();
      // return listItem;
      print(order.items!.length.toString());
      Get.to(OrderScreen());
      update();


      return order;
    } else {
      throw Exception("Fail to load order");
    }
  }
}

