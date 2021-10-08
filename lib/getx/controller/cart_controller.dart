import 'package:app/models/dish.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // final double total;
  // final quantity;
  // Cart({required this.total, required this.quantity});


  Map<String, Dish> _listCart = {};
  void addToCart(Dish dish) {
    if (_listCart.containsKey(dish.dishID)) {
      _listCart[dish.dishID]?.quantity += 1;
    }
    else{
      _listCart[dish.dishID] = dish;
    }
  }
Map<String, Dish> getCart (){
  return _listCart;
}
  
}
