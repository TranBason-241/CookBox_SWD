import 'package:app/models/order_detail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailController extends GetxController {
  var orderDetail = ResponceOrderDetail();

  @override
  void onInit() {
    super.onInit();
    fetchOrderDetail();
  }

  Future<ResponceOrderDetail> fetchOrderDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.get(
        Uri.parse('http://54.255.129.30:8100/api/v1/user/orders/orderDetail'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });
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
