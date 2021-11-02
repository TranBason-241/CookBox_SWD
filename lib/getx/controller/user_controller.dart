import 'package:app/models/order_detail.dart';
import 'package:app/models/user.dart';
import 'package:app/screens/ggmap/ride_picker_page.dart';
import 'package:app/screens/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserController extends GetxController {
  var user = UserLogin().obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController numberEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  Future<UserLogin> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString('email')!;
    String token = prefs.getString('token')!;
    final response = await http.get(
        Uri.parse('http://54.255.129.30:8100/api/v1/user/accounts/${email}'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });
    if (response.statusCode == 200) {
      // print("call api getUser");
      UserLogin userInfo = userFromJson(response.body);
      user.value = userInfo;
      prefs.setInt('userId', userInfo.id!);
      // print('emailllllllllllllllllllllll ${user.value.email}');
      update();
      return user.value;
    } else {
      throw Exception("Fail to user detail");
    }
  }

  void updateUser(type) async {
    //Edit obj

    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    if (type.compareTo('name') == 0) {
      user.value.name = nameEditingController.text;
    } else if (type.compareTo('phone') == 0) {
      user.value.phone = numberEditingController.text;
    } else if (type.compareTo('phone_required') == 0) {
      user.value.phone = numberEditingController.text;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    Map<String, dynamic> json1 = user.toJson();
    String body = json.encode(json1);
    final response = await http.put(
        Uri.parse('http://54.255.129.30:8100/api/v1/user/accounts'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        },
        body: body);
    if (response.statusCode == 200) {
      print('update thanh cong');
      // User userInfo = userFromJson(response.body);
      // user.value = userInfo;
      // print(user.value.email);
      fetchUser();
      update();
      if (type.compareTo('phone_required') == 0) {
        Get.to(RidePickerPage());
        // Get.to(Home());
        
      } else {
        Get.back();
      }
    } else {
      throw Exception("Fail to order detail");
    }
  }
}
