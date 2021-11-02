import 'package:app/getx/controller/cart_controller.dart';
import 'package:app/models/detail_dish.dart';
// import 'package:app/testCallApi/dish_test_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentController extends GetxController {
  List<DishResponse> listItem = <DishResponse>[];
  var total = 0.0.obs;
  var totalFinal = 0.0.obs;
  var isLoading = false.obs;
  var distance = 0.0.obs;
  @override
  onInit() {
    super.onInit();
    fetchTotal();
  }

  void fetchTotal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    distance.value = prefs.getDouble('distance')!;
    print('DMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMm ${distance.value}');
    List<DishResponse> listDish = [];
    CartController cartController = Get.put(CartController());
    var cart = cartController.cart;
    cart.forEach((key, value) {
      listDish.add(cart[key]!);
      // print(cart[key]!.name);
    });
    listItem = listDish;
    // print(listItem);
    for (int i = 0; i < listDish.length; i++) {
      total.value += (listDish[i].price! * listDish[i].quantity!);
    }
    totalFinal.value = total.value + distance.value * 8000;
    update();
  }
}
