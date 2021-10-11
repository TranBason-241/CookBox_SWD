

import 'package:app/providers/products.dart';
import 'package:app/getx/controller/menu_detail_controller.dart';
import 'package:app/models/menu_detail.dart';
import 'package:app/widgets/popular_item.dart';
// import 'package:app/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ListViewCart extends StatelessWidget {
  String type;
  ListViewCart(this.type);

  var listDish = [];
  @override
  // Lish<Dish> dish = [];
  Widget build(BuildContext context) {
    final MenuDetailController controller = Get.find<MenuDetailController>();
    List<Item> listDish = controller.listItem;

    //  final Dishs _p = Get.put(Dishs());
    //  List<Dish> listDish = _p.getType(type);

    // final productData = Provider.of<Products>(context);
    // var products = productData.items;
    // products = productData.getType(type).toList();

    return Container(
          height: 274,
          child: ListView.builder(
              itemCount: listDish.length,
              scrollDirection: Axis.horizontal,
              // padding: EdgeInsets.only(left: 16),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              // itemBuilder: (context, index) => ChangeNotifierProvider.value(
              //       value: products[index],
              //       child: PopularItemsCard(type),
              //     )
              itemBuilder: (context, index) {
                Item dish = listDish[index];
                return PopularItemsCard(
                  dish: dish,
                );
              }),
        );
  }
}
