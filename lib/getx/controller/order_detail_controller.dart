import 'package:app/models/order_detail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailController());
  }
}

class OrderDetailController extends GetxController {
  var orderDetail = ResponceOrderDetail();
  var orderId = 2;

  @override
  void onInit() {
    super.onInit();
    orderId = Get.arguments['orderId'];
    fetchOrderDetail(orderId);
  }

  Future<ResponceOrderDetail> fetchOrderDetail(int id) async {
    final response = await http.get(Uri.parse(
        'http://54.255.129.30:8100/api/v1/user/orders/orderDetail?order_id=$id'));
    if (response.statusCode == 200) {
      orderDetail = orderDetailFromJson(response.body);
      update();
      return orderDetail;
    } else {
      throw Exception("Fail to order detail");
    }
  }
}
