import 'dart:convert';
import 'dart:math';

import 'package:app/getx/controller/cart_controller.dart';
import 'package:app/models/order.dart';
import 'package:app/models/order_detail.dart';
import 'package:app/screens/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// class OrderBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.put(OrderController);
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController {
  Rxn<ResponseOrder> order = Rxn();
  var orderCreate = ResponseOrder();
  var statusCreate = 1.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchOrder();
  }

  // var order = new Order();
  // Future<Order> fetchOrder() async {
  Future<void> fetchOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.get(
        Uri.parse(
            'http://54.255.129.30:8100/api/v1/user/orders?user_id=1&page_number=1&page_size=100'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });
    if (response.statusCode == 200) {
      order.value = orderFromJson(response.body);
    } else {
      throw Exception("Fail to load order");
    }
  }

  void createOrder() {
    CartController cartController = Get.put(CartController());
    var cart = cartController.cart;
    Random random = new Random();
    int randomID = random.nextInt(1000);

    OrderDetail orderDetail = OrderDetail(
        id: randomID, dishId: 18, dishName: 'string', quantity: 10, price: 300);

    List<OrderDetail> listOrderDetail = [orderDetail];
    Order order = Order(
        id: randomID,
        date: DateTime.parse("2021-10-21T15:16:08.778Z"),
        paymentName: 'Tien Mat',
        paymentId: 'CS',
        userId: 1,
        storeId: 1,
        userName: 'abc',
        storeName: 'chiNhanh1',
        total: 200,
        orderStatus: 'new',
        orderDetails: listOrderDetail);

    // Map<String, dynamic> json = order.toJson();
    // print(2 + json['payment_name']);
    // print('${json}');
    createOrderApi(order);
  }

  Future<void> cancelOrder(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.put(
        Uri.parse('http://54.255.129.30:8100/api/v1/user/orders/cancel?id=$id'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });
    if (response.statusCode == 200) {
      print('Delete ok');
      // update();

      // Get.to(DishDetailScreen());
      fetchOrder();
      update();
    } else {
      throw Exception("Fail to loading dish detail");
    }
  }

  Future createOrderApi(Order order) async {
    Map<String, dynamic> json1 = order.toJson();
    String body = json.encode(json1);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.post(
        Uri.parse('http://54.255.129.30:8100/api/v1/user/orders'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        },
        body: body);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      // print(response.body);
      // print('ok');
      statusCreate.value = 1;
      Get.to(Home());
    } else {
      // print('false roi');
      statusCreate.value = 2;
      throw Exception("Fail to load order");
    }
  }
}
