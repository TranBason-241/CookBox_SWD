import 'package:app/models/detail_dish.dart';
import 'package:app/models/menu_detail.dart';
import 'package:app/screens/product_detail.dart';
import 'package:http/http.dart' as http;
// import 'package:app/testCallApi/dish_test_screen.dart';
import 'package:get/get.dart';

class DishDetailController extends GetxController {
  var isLoading = false.obs;

  var dish = DishResponse();

  // @override
  // onInit() {
  //   super.onInit();
  //   fetchDish();
  // }

  Future<DishResponse> fetchDishDetail(int id) async {
    isLoading(false);
    final response = await http.get(Uri.parse(
        'http://54.255.129.30:8100/api/v1/user/dishes/dish?store_id=1&dish_id=18'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      dish = dishResponseFromJson(response.body); //Tra ve 1 obj DishTest
      isLoading(true);
      print('DDaya ne ${dish.name}');
      Get.to(ProductDetailScreen());
      update();
      return dish;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load dish');
    }
  }

  void editTaste() {
    dish.tasteDetails![0].tasteLevel = dish.tasteDetails![0].tasteLevel! + 1;
    update();
  }
}
