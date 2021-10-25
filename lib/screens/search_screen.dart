import 'package:app/getx/controller/search_controller.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/widgets/custom_icon_button.dart';
import 'package:app/widgets/popular_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const routeName = '/search-screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    var productData = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        titleSpacing: 0,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: SizedBox(
          child: Text('Tìm Kiếm'),
          // height: 37,
          // width: 300,
          // child: TextField(
          //     controller: seachText,
          //     textInputAction: TextInputAction.search,
          //     // onChanged: (value) {
          //     //   //
          //     // },
          //     onSubmitted: (value) {
          //       print(value);
          //     },
          //     decoration: InputDecoration(
          //       hintText: 'Tìm kiếm sản phẩm, công thức',
          //       prefixIcon: const Icon(Icons.search),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(5),
          //         borderSide: BorderSide.none,
          //       ),
          //       contentPadding: EdgeInsets.symmetric(horizontal: 10),
          //       filled: true,
          //       fillColor: Colors.white,
          //     )),
        ),
        actions: [],
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
              color: Colors.red,
              padding:
                  EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 30),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 300,
                            child: TextField(
                                controller:
                                    SearchController.textEditingController,
                                textInputAction: TextInputAction.search,
                                onSubmitted: (value) {
                                  print('${value}  here');
                                },
                                decoration: InputDecoration(
                                  hintText: 'Tìm kiếm sản phẩm, công thức',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  filled: true,
                                  fillColor: Colors.white,
                                )),
                          ),
                        ],
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(top: 10),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //           margin: EdgeInsetsDirectional.only(end: 10),
                      //           child: Text(
                      //             'Tất cả',
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.bold),
                      //           )),
                      //     ],
                      //   ),
                      // )
                      Container(
                        // color: Colors.green,
                        height: 30,
                        width: 300,
                        padding: EdgeInsets.only(top: 10),
                        child: GetBuilder<SearchController>(
                          builder: (controller) => ListView.builder(
                            itemCount: controller.listCate.length,
                            itemBuilder: (context, index) {
                              var customStyle =
                                  controller.listCate[index].isSelected == false
                                      ? TextStyle(
                                          color: Colors.white,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 15)
                                      : TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16);
                              return Container(
                                  margin: EdgeInsetsDirectional.only(end: 10),
                                  child: InkWell(
                                    onTap: () {
                                      searchController.setSelected(
                                          controller.listCate[index].id);
                                    },
                                    child: Text(
                                        '${controller.listCate[index].name}',
                                        style: customStyle),
                                  ));
                            },
                            scrollDirection: Axis.horizontal,
                            // padding: EdgeInsets.only(left: 16),
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                          ),
                        ),
                      )
                    ],
                  ),
                  CustomIconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      searchController.search();
                    },
                    margin: EdgeInsets.symmetric(),
                    backgroundColor: Colors.red,
                  )
                ],
              )),
          Container(
            child: Obx(() => Text(searchController.messSearch.value)),
          ),
          Container(
            padding: EdgeInsetsDirectional.all(5),
            // color: Colors.green,

            height: 500,
            width: 400,
            child: GetBuilder<SearchController>(
              builder: (controller) => ListView.builder(
                itemCount: controller.listMenuDetail.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: 110,
                              width: 110,
                              child: Image.network(
                                controller.listMenuDetail[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15, right: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    // color: Colors.yellow,
                                    width: 200,
                                    height: 110,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            top: 0,
                                            left: 5,
                                            child: Text(
                                              "${controller.listMenuDetail[index].name}",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black
                                                      .withOpacity(0.7)),
                                            )),
                                        Positioned(
                                          top: 30,
                                          left: 5,
                                          child: Text(
                                              "${controller.listMenuDetail[index].description}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black)),
                                        ),
                                        Positioned(
                                          top: 50,
                                          left: 5,
                                          child: Text("3 người ăn",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black)),
                                        ),
                                        Positioned(
                                            top: 85,
                                            left: 5,
                                            child: Text(
                                              "${controller.listMenuDetail[index].price}đ",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.green),
                                            )),
                                        // Positioned(
                                        //     top: 33,
                                        //     left: 5,
                                        //     child: Text(
                                        //       "$address",
                                        //       style: TextStyle(fontSize: 12),
                                        //     )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.add_circle,
                                  size: 34,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  // cart.addToCart(dish);
                                  // print(cart.getCart()[dish.dishID]?.quantity);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 10,
                        color: Colors.black,
                      ),
                    ],
                  );
                },
                scrollDirection: Axis.vertical,
                // padding: EdgeInsets.only(left: 16),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
