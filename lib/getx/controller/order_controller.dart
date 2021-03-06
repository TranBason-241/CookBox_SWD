import 'dart:convert';
import 'package:app/getx/controller/cart_controller.dart';
import 'package:app/getx/controller/payment_controller.dart';
import 'package:app/getx/controller/user_controller.dart';
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
  UserController userController = Get.put(UserController());

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
            'http://54.255.129.30:8100/api/v1/user/orders?user_id=${prefs.getInt('userId')}&page_number=1&page_size=100'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });
    if (response.statusCode == 200) {
      order.value = orderFromJson(response.body);
    } else {
      throw Exception("Fail to load order");
      //Lay khoang cach
    }
  }

  void createOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    CartController cartController = Get.put(CartController());
    PaymentController paymentController = Get.put(PaymentController());
    double total = paymentController.total.value;
    // double distance = prefs.getDouble(key)

    String userName = prefs.getString('userName')!;
    int userID = prefs.getInt('userID')!;
    double distance = prefs.getDouble('distance')!;
    double shippingCost = distance * 8000;
    total += shippingCost;
    List<OrderDetail> listOrderDetail = dishToOrderDetail();
    var date = DateTime.now().toString();
    Order order = Order(
        id: 0,
        date: DateTime.parse(date),
        paymentName: 'Tien Mat',
        paymentId: 'CS',
        userId: userID,
        storeId: 1,
        userName: userName,
        storeName: 'chiNhanh1',
        total: total,
        orderStatus: 'new',
        orderDetails: listOrderDetail);
    // Map<String, dynamic> json = order.toJson();
    // print(2 + json['payment_name']);
    // print('${json}');
    await createOrderApi(order);
    fetchOrder();
    cartController.cleanCart();

    update();
    Get.off(Home());
  }

  List<OrderDetail> dishToOrderDetail() {
    CartController cartController = Get.put(CartController());
    var cart = cartController.cart;
    List<OrderDetail> listOrderDetail = [];
    cart.forEach((key, dishResponse) {
      OrderDetail orderDetail = OrderDetail(
          dishId: dishResponse.id,
          dishName: dishResponse.name,
          id: 0,
          price: dishResponse.price,
          quantity: dishResponse.quantity);
      listOrderDetail.add(orderDetail);
    });
    return listOrderDetail;
  }

  Future<void> cancelOrder(int id, String reason) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.put(
        Uri.parse(
            'http://54.255.129.30:8100/api/v1/user/orders/cancel?id=$id&note=$reason'),
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

  Future<void> confirmOrder(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.put(
        Uri.parse(
            'http://54.255.129.30:8100/api/v1/user/orders/completed?id=$id'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });
    if (response.statusCode == 200) {
      print('confirm ok');
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
      // fetchOrder();

    } else {
      // print('false roi');
      statusCreate.value = 2;
      throw Exception("Fail to load order");
    }
  }
}
