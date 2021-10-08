import 'dart:convert';
import 'package:app/testCallApi/dish_test.dart';
import 'package:http/http.dart' as http;
// import 'package:app/testCallApi/dish_test_screen.dart';
import 'package:get/get.dart';

class DishController extends GetxController {
  List<Item> listItem = <Item>[].obs;
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    fetchDish();
  }

  Future<List<Item>> fetchDish() async {
    isLoading(false);
    final response = await http
        .get(Uri.parse('http://54.255.129.30:8100/api/v1/user/dishes'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<DishTest> list = [];
      // return items = dishTestFromJson(response.body) as List<DishTest>;
      DishTest obj = dishTestFromJson(response.body); //Tra ve 1 obj DishTest
      isLoading(true);
      print('ggg');
      listItem = obj.items as List<Item>;
      update();
      return listItem;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
