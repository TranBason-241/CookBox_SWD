import 'package:app/models/order_detail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailController());
  }
}

class OrderDetailController extends GetxController {
  
  final Rxn<ResponceOrderDetail> orderDetail = Rxn();
  int orderId = 0;
  var isLoading = false.obs;
  double total = 0.0;

  @override
  void onInit() {
    super.onInit();
    orderId = Get.arguments['orderId'];
    total = Get.arguments['total'];
    print(total.toString() + 'âksakjhdkhfjdhj');
    fetchOrderDetail(orderId);
  }

  Future<void> fetchOrderDetail(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    isLoading(true);
    final response = await http.get(
        Uri.parse(
            'http://54.255.129.30:8100/api/v1/user/orders/orderDetail?order_id=$id'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      orderDetail.value = orderDetailFromJson(response.body);
      update();
    } else {
      throw Exception("Fail to order detail");
    }
  }
}