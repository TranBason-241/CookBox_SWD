import 'package:app/getx/controller/cart_controller.dart';
import 'package:app/models/detail_dish.dart';
import 'package:app/models/menu_detail.dart';
import 'package:http/http.dart' as http;
// import 'package:app/testCallApi/dish_test_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  List<DishResponse> listItem = <DishResponse>[];
  double total = 0;
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchTotal();
  }

  void fetchTotal() async {
    print('vcllllllllllllllllllllllllllllllllll');
    List<DishResponse> listDish = [];
    CartController cartController = Get.put(CartController());
    var cart = cartController.cart;
    cart.forEach((key, value) {
      listDish.add(cart[key]!);
      
    });
    listItem = listDish;

    for (int i = 0; i < listDish.length; i++) {
      total += (listDish[i].price! * listDish[i].quantity!);
       print('vcllllllllllllllllllllllllllllllllll');
    }
    update();
  }
}
