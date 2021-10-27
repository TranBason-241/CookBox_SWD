import 'package:app/models/menu_detail.dart';
import 'package:http/http.dart' as http;
// import 'package:app/testCallApi/dish_test_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuDetailController extends GetxController {
  List<Item> listItem = <Item>[].obs;

  var isLoading = false.obs;
  int categoryID;
  MenuDetailController({this.categoryID = 2});

  @override
  onInit() {
    super.onInit();
    fetchDish();
  }

  Future<List<Item>> fetchDish() async {
    isLoading(false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.get(
        Uri.parse(
            'http://54.255.129.30:8100/api/v1/user/dishes?store_id=1&category_id=2'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });

    print(categoryID);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<MenuDetail> list = [];
      MenuDetail obj = dishTestFromJson(response.body); //Tra ve 1 obj DishTest
      isLoading(true);
      listItem = obj.items as List<Item>;
      update();
      return listItem;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load dish');
    }
  }
}
