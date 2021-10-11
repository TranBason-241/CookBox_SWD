import 'package:app/models/detail_dish.dart';
import 'package:app/models/menu_detail.dart';
import 'package:http/http.dart' as http;
// import 'package:app/testCallApi/dish_test_screen.dart';
import 'package:get/get.dart';

class DishDetailController extends GetxController {
  List<Item> listItem = <Item>[].obs;

  var isLoading = false.obs;
  var dish = DishResponse();

  // @override
  // onInit() {
  //   super.onInit();
  //   fetchDish();
  // }

  Future<DishResponse> fetchDishDetail() async {
    isLoading(false);
    final response = await http.get(Uri.parse(
        'http://54.255.129.30:8100/api/v1/user/dishes/dish?store_id=1&dish_id=18'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      DishResponse obj =
          dishResponseFromJson(response.body); //Tra ve 1 obj DishTest
      isLoading(true);
      print('DDaya ne ${obj.repices![0].steps![0].description}');

      update();
      return obj;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load dish');
    }
  }
}
