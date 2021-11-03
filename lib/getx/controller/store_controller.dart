import 'dart:ffi';

import 'package:app/getx/controller/home_controller.dart';
import 'package:app/models/store.dart';
import 'package:app/screens/home.dart';
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
  // final selected = "address".obs;
  Rxn<Store> store = Rxn();

  void setSelected(int value) async {
    for (int i = 0; i < store.value!.items!.length; i++) {
      if (value == store.value!.items![i].id) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setDouble('distance', store.value!.items![i].distance!);
      }
    }
    Get.to(() =>Home());
  }

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
      List<String> listDistance = prefs.getStringList('storrListDistance')!;
      // print(listDistance);
      store.value = storeFromJson(response.body);
      for (int i = 0; i < store.value!.items!.length; i++) {
        store.value!.items![i].distance = double.parse(listDistance[i]);
      }
      
    } else {
      throw Exception("Fail to load order");
    }
    ;
  }
}
