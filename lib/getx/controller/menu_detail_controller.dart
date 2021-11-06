import 'package:app/models/menu_detail.dart';
import 'package:http/http.dart' as http;
// import 'package:app/testCallApi/dish_test_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuDetailController extends GetxController {
  List<Item> listItem = <Item>[].obs;
  Map<String, List<Item>> listOfCateShow = {};
  var isLoading = false.obs;
  int categoryID;
  MenuDetailController({this.categoryID = 2});
  var name = ''.obs;

  @override
  onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    getMenuDetailByCate(1).then((value) => listOfCateShow['1'] = value);
    getMenuDetailByCate(2).then((value) => listOfCateShow['2'] = value);
  }

  Future<List<Item>> getMenuDetailByCate(int cateID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('storeName')!;
    String token = prefs.getString('token')!;
    String storeId = prefs.getString('storeId')!;
    // String storeName = prefs.getString('storeName')!;

    // print(name);
    final response = await http.get(
        Uri.parse(
            'http://54.255.129.30:8100/api/v1/user/dishes?store_id=$storeId&category_id=$cateID'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
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
