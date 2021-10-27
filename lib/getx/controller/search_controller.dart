import 'package:app/models/category.dart';
import 'package:app/models/menu_detail.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SearchController extends GetxController {
  static TextEditingController textEditingController = TextEditingController();
  List<DishCategory> listCate =
      <DishCategory>[DishCategory(id: 0, name: 'Tất cả', isSelected: true)].obs;
  MenuDetail menuDetailRespone = MenuDetail();
  List<Item> listMenuDetail = <Item>[].obs;
  var messSearch = ''.obs;
  @override
  onInit() {
    super.onInit();
    fetchCate();
    search();
  }

  Future<List<DishCategory>> fetchCate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.get(
        Uri.parse('http://54.255.129.30:8100/api/v1/user/categories'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });

    if (response.statusCode == 200) {
      CategoryRespone obj =
          categoryResponeFromJson(response.body); //Tra ve 1 obj DishTest
      // isLoading(true);
      // listCate = obj.items as List<DishCategory>;
      List<DishCategory> listCate2 = obj.items as List<DishCategory>;
      listCate.addAll(listCate2);
      // listCate2.map((cate) => {listCate.add(cate)});

      update();
      return listCate;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load category');
    }
  }

  void setSelected(id) {
    for (int i = 0; i < listCate.length; i++) {
      if (listCate[i].isSelected) {
        listCate[i].isSelected = false;
      }
      if (listCate[i].id == id) {
        listCate[i].isSelected = true;
      }
    }
    update();
  }

  String getSelectedCateId() {
    String id = '';
    for (int i = 0; i < listCate.length; i++) {
      if (listCate[i].isSelected && listCate[i].id != 0) {
        id = listCate[i].id!.toString();
      }
    }
    return id;
  }

  Future<MenuDetail> search() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.get(
        Uri.parse(
            'http://54.255.129.30:8100/api/v1/user/dishes?store_id=1&name=${textEditingController.text}&category_id=${getSelectedCateId()}'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<MenuDetail> list = [];
      menuDetailRespone =
          dishTestFromJson(response.body); //Tra ve 1 obj DishTest
      listMenuDetail = menuDetailRespone.items as List<Item>;
      print(listMenuDetail[0].name);
      update();
      messSearch.value = '';
      return menuDetailRespone;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      listMenuDetail = [];
      update();
      messSearch.value = 'Không có sản phẩm';
      throw Exception('Failed to load category');
    }
  }

  Future<MenuDetail> viewMore(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    final response = await http.get(
        Uri.parse(
            'http://54.255.129.30:8100/api/v1/user/dishes?store_id=1&category_id=${id}'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          "Authorization": "Bearer ${token}"
        });

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<MenuDetail> list = [];
      menuDetailRespone =
          dishTestFromJson(response.body); //Tra ve 1 obj DishTest
      listMenuDetail = menuDetailRespone.items as List<Item>;
      print(listMenuDetail[0].name);
      update();
      messSearch.value = '';
      setSelected(id);
      // textEditingController.value = '';
      return menuDetailRespone;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      listMenuDetail = [];
      update();
      messSearch.value = 'Không có sản phẩm';
      throw Exception('Failed to load category');
    }
  }
}
