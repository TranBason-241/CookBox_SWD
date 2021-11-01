import 'package:app/getx/controller/cart_controller.dart';
import 'package:app/models/detail_dish.dart';
// import 'package:app/testCallApi/dish_test_screen.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  List<DishResponse> listItem = <DishResponse>[];
  double total = 0;
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchTotal();
  }

  void fetchTotal() {
    List<DishResponse> listDish = [];
    CartController cartController = Get.put(CartController());
    var cart = cartController.cart;
    cart.forEach((key, value) {
      listDish.add(cart[key]!);
    });
    listItem = listDish;

    for (int i = 0; i < listDish.length; i++) {
      total += (listDish[i].price! * listDish[i].quantity!);
    }
    update();
  }
}
