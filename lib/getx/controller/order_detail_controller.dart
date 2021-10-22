import 'package:app/models/order_detail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderDetailController extends GetxController {
  var orderDetail = OrderDetail();

  @override
  void onInit() {
    super.onInit();
    fetchOrderDetail();
  }

  Future<OrderDetail> fetchOrderDetail() async {
    final response = await http.get(
        Uri.parse('http://54.255.129.30:8100/api/v1/user/orders/orderDetail'));
    if (response.statusCode == 200) {
      print("ALOOO");
      orderDetail = orderDetailFromJson(response.body);
      // Get.to(OrderScreen());
      print("object");
      update();

      return orderDetail;
    } else {
      throw Exception("Fail to order detail");
    }
  }
}
