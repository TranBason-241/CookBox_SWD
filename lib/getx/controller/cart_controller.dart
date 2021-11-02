import 'package:app/getx/controller/dish_detail_controller.dart';
import 'package:app/models/detail_dish.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  // Cart({required this.total, required this.quantity});
  List<DishResponse> listChildDish = [];
  Map<int, DishResponse> cart = {};
  var total = 0.0.obs;
//  @override
//   onInit() {
//     super.onInit();
//     getCart();
//   }

  void cleanCart() {
    cart = {};
    listChildDish = [];
    total.value = 0.0;
    update();
  }

  void getTotal() {
    total.value = 0.0;
    cart.forEach((key, value) {
      total.value += (cart[key]!.price! * cart[key]!.quantity!);
    });
  }

  void deleteDishInCart(int id) {
    if (cart.containsKey(id)) {
      cart.remove(id);
    }
    update();
  }

  void editQuantity(int id, String type) {
    if (cart.containsKey(id)) {
      if (type.compareTo('add') == 0) {
        cart[id]!.quantity = cart[id]!.quantity! + 1;
        getTotal();
      } else {
        if (cart[id]!.quantity! > 1) {
          cart[id]!.quantity = cart[id]!.quantity! - 1;
          getTotal();
        }
      }

      update();
    }
    return;
  }

  void addToCart(DishResponse dish, int quantity) {
    print('Dishhhhhhhhhhhhhhhhhhhhhhhhhhhh old ${dish.id}');
    DishResponse newDish = DishResponse();
    newDish.id = 1;
    getTrueDish(dish).then((value) {
      newDish = value;
      print(newDish.id);
      if (cart.containsKey(newDish.id)) {
        cart[newDish.id]?.quantity = cart[newDish.id]!.quantity! + quantity;
      } else {
        cart[newDish.id!] = newDish;
        cart[newDish.id]?.quantity = cart[newDish.id]!.quantity! + quantity;
      }
      getTotal();
      update();
      Get.to(CartScreen());
    });
  }
// Map<String, Dish> getCart (){
//   return _listCart;
// }

  Future<DishResponse> getTrueDish(DishResponse oldDish) async {
    DishResponse dish = DishResponse();
    List<DishResponse> listDish = await getDishByTaste(oldDish);
    for (int i = 0; i < listDish.length; i++) {
      bool flag = true;
      for (int j = 0; j < listDish[i].tasteDetails!.length; j++) {
        if (listDish[i].tasteDetails![j].tasteId ==
                oldDish.tasteDetails![j].tasteId &&
            listDish[i].tasteDetails![j].tasteLevel ==
                oldDish.tasteDetails![j].tasteLevel) {
        } else {
          flag = false;
        }
      }
      if (flag) {
        dish = listDish[i];
        print('TRUE DISHHHHHHHHHHHHHHHHHHHHHHHHHH ${dish.id}');
        return dish;
      }
    }
    return dish;
  }

  Future<List<DishResponse>> getDishByTaste(DishResponse oldDish) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.get(
        Uri.parse(
            'http://54.255.129.30:8100/api/v1/user/dishes/dishparentchildren?store_id=1&dish_id=${oldDish.id}'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      // dish = dishResponseFromJson(response.body); //Tra ve 1 obj DishTest
      // print('DDaya ne new id Dish ${dish.id}');
      listChildDish = listDishResponeFromJson(response.body);

      return listChildDish;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load dish');
    }
  }
}
