import 'package:app/getx/controller/dish_detail_controller.dart';
import 'package:app/models/detail_dish.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  // Cart({required this.total, required this.quantity});

  Map<int, DishResponse> cart = {};

  List<DishResponse> listItemInCart = [];

//  @override
//   onInit() {
//     super.onInit();
//     getCart();
//   }

  void addToCart(DishResponse dish, int quantity) {
    DishResponse newDish = DishResponse();
    newDish.id = 1;
    getDishByTaste(dish).then((value) {
      newDish = value;
      print(newDish.id);
      if (cart.containsKey(newDish.id)) {
        cart[newDish.id]?.quantity = cart[newDish.id]!.quantity! + quantity;
      } else {
        cart[newDish.id!] = newDish;
        cart[newDish.id]?.quantity = cart[newDish.id]!.quantity! + quantity;
      }
      print(cart[19]!.tasteDetails![0].tasteName);
      print(cart[19]!.quantity);
      update();
      Get.to(CartScreen());
    });
  }
// Map<String, Dish> getCart (){
//   return _listCart;
// }

  Future<DishResponse> getDishByTaste(DishResponse oldDish) async {
    DishResponse dish;
    final response = await http.get(Uri.parse(
        'http://54.255.129.30:8100/api/v1/user/dishes/dishTaste?store_id=1&dish_id=18&taste_id=1&taste_level=2'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      dish = dishResponseFromJson(response.body); //Tra ve 1 obj DishTest
      print('DDaya ne new id Dish ${dish.id}');

      return dish;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load dish');
    }
  }
}
