import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Vịt Kho Măng Tươi',
      description: 'A red shirt - it is pretty red! shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
      type: 1,
    ),
    Product(
      id: 'p2',
      title: 'Ba Rọi Heo Kho Mắm Ruốc',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
      type: 2,
    ),
    Product(
      id: 'p3',
      title: 'Sườn Non Heo Rim Tôm Thẻ',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
      type: 2,
    ),
    Product(
      id: 'p4',
      title: 'Đùi Gà Góc Tư Kho Sả Ớt',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
      type: 2,
    ),
    Product(
      id: 'p5',
      title: 'Vị Kho Gừng',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
      type: 3,
    ),
    Product(
      id: 'p6',
      title: 'Cá Kèo Kho Tiêu',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
      type: 3,
    ),
    Product(
      id: 'p7',
      title: 'Cá Kèo Kho Ga',
      description: 'Prepare any meal you want.',
      price: 31,
      imageUrl:
          'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp',
      type: 3,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> getType(int type) {
    if (type == 1) return _items.where((element) => element.type == 1).toList();
    if (type == 2) return _items.where((element) => element.type == 2).toList();
    return _items.where((element) => element.type == 3).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }

  List<Product> listSearch(String name) {
    if (name.isEmpty) return [];
    return _items
        .where((productIem) => productIem.title.contains(name))
        .toList();
  }

  String name = '{}';
  List<Product> get searchList {
    int l = listSearch(name).length;
    print(l);
    return listSearch(name);
  }

  int count = 1;
  int get counter => count;
  int addCounter() {
    count++;

    notifyListeners();
    return count;
  }

  int divCounter() {
    if (count <= 1) {
      count = 1;
    } else {
      count--;
    }

    notifyListeners();
    return count;
  }
}
