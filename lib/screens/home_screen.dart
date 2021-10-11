import 'package:app/getx/controller/dish_detail_controller.dart';
import 'package:app/models/detail_dish.dart';
import 'package:app/providers/cart.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/order_screen.dart';
import 'package:app/screens/search_screen.dart';
import 'package:app/getx/controller/menu_detail_controller.dart';
import 'package:app/models/menu_detail.dart';
import 'package:app/widgets/bage.dart';
import 'package:app/widgets/custom_navbar.dart';
import 'package:app/widgets/listview_popular.dart';
import 'package:app/widgets/popular_item.dart';
import 'package:app/widgets/product_grid.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  final List<String> images = [
    'https://cf.shopee.vn/file/b19a4998332c28c3fe1014429f12b2c5',
    'https://cdn.chanhtuoi.com/uploads/2021/07/foodmap.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD-qQL9OpIzo1logABt9hiMAEz0gpviVf8jA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRvabEVjmLblf-tX64eNpj6ZRtl_IH1weF_A&usqp=CAU',
  ];
  // final DishController controller = Get.put(DishController(categoryID: 1));
  final MenuDetailController controller =
      Get.put(MenuDetailController(categoryID: 2));
  final DishDetailController controller2 = Get.put(DishDetailController());



  @override
  Widget build(BuildContext context) {

    var a = controller2.fetchDishDetail();

    // print(' ${a.name}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        titleSpacing: 0,
        elevation: 0.0,
        title: TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.fmd_good_outlined, color: Colors.white),
                Text(
                  'TP. HCM',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white),
              ],
            )),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                autofocus: false,
                onTap: () {
                  Navigator.pushNamed(context, SearchScreen.routeName);
                },
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm sản phẩm, công thức',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.zero,
                  filled: true,
                  fillColor: Colors.white,
                )),
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {},
              child: IconButton(
                  icon: Icon(
                    Icons.local_mall_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.to(CartScreen());
                  }))
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2))),
                      child: SizedBox(
                          height: 150.0,
                          width: double.infinity,
                          child: Carousel(
                            dotSpacing: 15.0,
                            dotSize: 6.0,
                            dotIncreasedColor: Colors.red,
                            dotBgColor: Colors.transparent,
                            indicatorBgPadding: 3.0,
                            dotPosition: DotPosition.bottomCenter,
                            dotHorizontalPadding: 5,
                            dotVerticalPadding: 5,
                            images: images
                                .map((item) => Container(
                                      child: Image.network(
                                        item,
                                        fit: BoxFit.cover,
                                      ),
                                    ))
                                .toList(),
                          )),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Giảm giá',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              // color: Colors.grey.shade500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Xem tất cả",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 274,
                      width: 1200,
                      child: GetBuilder<MenuDetailController>(
                        builder: (controller) => ListView.builder(
                          itemCount: controller.listItem.length,
                          itemBuilder: (context, index) {
                            return PopularItemsCard(
                              dish: controller.listItem[index],
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          // padding: EdgeInsets.only(left: 16),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Giảm giá',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              // color: Colors.grey.shade500,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Xem tất cả",
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 274,
                      width: 1200,
                      child: GetBuilder<MenuDetailController>(
                        builder: (controller2) => ListView.builder(
                          itemCount: controller2.listItem.length,
                          itemBuilder: (context, index) {
                            return PopularItemsCard(
                              dish: controller2.listItem[index],
                            );
                          },
                          scrollDirection: Axis.horizontal,
                          // padding: EdgeInsets.only(left: 16),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                        ),
                      ),
                    )
                    // Container(
                    //   // padding: EdgeInsets.only(left: 16, right: 16),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         'Món Hot Trong Tuần',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.normal,
                    //           fontSize: 20,
                    //           // color: Colors.grey.shade500,
                    //         ),
                    //       ),
                    //       TextButton(
                    //         onPressed: () {},
                    //         child: const Text(
                    //           "Xem tất cả",
                    //           style: TextStyle(
                    //               // fontWeight: FontWeight.bold,
                    //               fontSize: 14,
                    //               color: Colors.blue),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   height: 274,
                    //   child: ListViewCart('Chó'),
                    // ),
                    // Container(
                    //   // padding: EdgeInsets.only(left: 16, right: 16),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         'Món Dễ Chế Biến',
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.normal,
                    //           fontSize: 20,
                    //           // color: Colors.grey.shade500,
                    //         ),
                    //       ),
                    //       TextButton(
                    //         onPressed: () {},
                    //         child: const Text(
                    //           "Xem tất cả",
                    //           style: TextStyle(
                    //               // fontWeight: FontWeight.bold,
                    //               fontSize: 14,
                    //               color: Colors.blue),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   height: 274,
                    //   child: ListViewCart('Gà'),
                    // ),
                    // SizedBox(
                    //   height: 40,
                    // ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //     bottom: 0,
          //     left: 0,
          //     child: CustomNavbar(
          //       home: true,
          //     )),
        ],
      ),
    );
  }
}
