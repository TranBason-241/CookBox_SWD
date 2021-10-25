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

class OrderController extends GetxController {
  var orderCreate = ResponseOrder();
  var statusCreate = 1.obs;
  // 1 default, 2 ok, 3 failed
  // List<Item> listItem = <Item>[].obs;
  // RxList<Item> productList = <Item>[].obs;
  // RxList<Order> order = <Order>[].obs;
  // List<Order> order = <Order>[].obs;
  var order = ResponseOrder();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchOrder();
  }

  // var order = new Order();
  // Future<Order> fetchOrder() async {

  Future<ResponseOrder> fetchOrder() async {
    final response = await http.get(Uri.parse(
        'http://54.255.129.30:8100/api/v1/user/orders?user_id=1&page_number=1&page_size=100'));
    if (response.statusCode == 200) {
      print("ALOOO");
      order = orderFromJson(response.body);
      print(order.items!.length.toString());
      // Get.to(OrderScreen());
      update();

      return order;
    } else {
      throw Exception("Fail to load order");
    }
  }

  Future<void> cancelOrder(int id) async {
    final response = await http.put(Uri.parse(
        'http://54.255.129.30:8100/api/v1/user/orders/cancel?id=$id'));
    if (response.statusCode == 200) {
      print('Delete ok');
      // update();
      print('object');
      // Get.to(DishDetailScreen());
      fetchOrder();
      update();
    } else {
      throw Exception("Fail to loading dish detail");
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

  Future createOrderApi(Order order) async {
    Map<String, dynamic> json1 = order.toJson();
    String body = json.encode(json1);
    print(body);
    final response = await http.post(
        Uri.parse('http://54.255.129.30:8100/api/v1/user/orders'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
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
