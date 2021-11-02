import 'package:app/models/store.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/picker_store_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(StoreController());
  }
}

class StoreController extends GetxController {
  final selected = "address".obs;

  void setSelected(String value) {
    selected.value = value;
  }

  Rxn<Store> store = Rxn();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchStore();
  }

  Future<void> fetchStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token')!;
    final response = await http.get(
      Uri.parse('http://54.255.129.30:8100/api/StoresUser'),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      store.value = storeFromJson(response.body);
    } else {
      throw Exception("Fail to load order");
    }
    ;
  }
}
