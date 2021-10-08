import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;

    //name
  final String title;  

  //image
  final String img;

  //Co can quantity ko ?
  final int quantity;
  final double price;
  //Them
  // String category;
  // String des;
  // String numOfper;
  // String nutrient;
  // bool status;
  // String parentID;
  // List<int> listRecipe;
  // List<int> listIng;




  CartItem(
      {required this.id,
      required this.title,
      required this.img,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmout {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });

    return double.parse(total.toStringAsFixed(2));
  }

  void addItem(String productId, String img, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            img: existingCartItem.img,
            quantity: existingCartItem.quantity + 1,
            price: existingCartItem.price),
      );
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              img: img,
              quantity: 1,
              price: price));
    }
    print(_items.length);
    notifyListeners();
  }

  void removeItem(String productID) {
    _items.remove(productID);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
