import 'package:app/getx/controller/cart_controller.dart';
import 'package:app/getx/controller/dish_detail_controller.dart';
import 'package:app/models/detail_dish.dart';
import 'package:app/models/menu_detail.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/widgets/custom_icon_button.dart';
import 'package:app/widgets/product_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  // const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-detail';

  // ProductDetailScreen({required this.dish});
  DishDetailController controller = Get.find<DishDetailController>();
  // CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
        backgroundColor: Color(0xfff32726),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Icon(Icons.share),
          IconButton(
            icon: Icon(Icons.local_mall_outlined),
            onPressed: () {
              // Navigator.of(context).pushReplacementNamed(CartScrren.routeName);
              // Navigator.pushNamed(context, CartScreen.routeName);
              Get.to(CartScreen());
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Expanded(  child:
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    color: const Color(0xffacfff),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                        image: NetworkImage((controller.dish.image == null)
                            ? ''
                            : controller.dish.image!)),
                  ),
                ),
                // ),
                // const SizedBox(
                //   height: 5,
                // ),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${controller.dish.name}',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${controller.dish.price!.toStringAsFixed(0)}đ',
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Icon(
                      //       Icons.local_mall_outlined,
                      //       color: Colors.grey,
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text('2.0k'),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Icon(
                      //       Icons.thumb_up_off_alt,
                      //       color: Colors.grey,
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text('21'),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     Image.asset("assets/images/star_filled.png"),
                      //     const SizedBox(
                      //       width: 1,
                      //     ),
                      //     const Text(
                      //       "4.9",
                      //       style: TextStyle(
                      //         color: Colors.orange,
                      //       ),
                      //     ),
                      //     SizedBox(width: 6),
                      //     Text('(124 đánh giá)')
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Điều chỉnh theo khẩu vị của bạnn',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                            Container(
                              margin: EdgeInsets.only(top: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        // color: Colors.green,
                                        width: 400,
                                        height: 80,
                                        child: GetBuilder<DishDetailController>(
                                          builder: (controller) =>
                                              ListView.builder(
                                            itemCount: controller
                                                .dish.tasteDetails!.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                margin:
                                                    EdgeInsetsDirectional.only(
                                                        top: 5),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 80,
                                                      child: Text(
                                                        "${controller.dish.tasteDetails![index].tasteName}: ",
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 22),
                                                      ),
                                                    ),
                                                    CustomIconButton(
                                                        backgroundColor: Colors
                                                            .black
                                                            .withOpacity(0.2),
                                                        icon: Icon(Icons.remove,
                                                            size: 16),
                                                        onPressed: () {
                                                          controller.editTaste(
                                                              'remove');
                                                        },
                                                        margin:
                                                            EdgeInsets.all(0)),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      child: Text(
                                                        "${controller.dish.tasteDetails![index].tasteLevel} ",
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                    ),
                                                    CustomIconButton(
                                                        backgroundColor: Colors
                                                            .black
                                                            .withOpacity(0.2),
                                                        icon: Icon(
                                                          Icons.add,
                                                          size: 16,
                                                        ),
                                                        onPressed: () {
                                                          // updateState("add");
                                                          controller
                                                              .editTaste('add');
                                                        },
                                                        margin:
                                                            EdgeInsets.all(0)),
                                                    // Text("${lv == 3 ? '(nguyên bản)' : ''}")
                                                  ],
                                                ),
                                              );
                                            },
                                            // scrollDirection: Axis.horizontal,
                                            // padding: EdgeInsets.only(left: 16),
                                            // shrinkWrap: true,
                                            // physics: BouncingScrollPhysics(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                  // Column(
                                  //   children: [
                                  //     ...controller.dish.tastes!.map((taste) =>
                                  //         Container(
                                  //           margin: EdgeInsetsDirectional.only(
                                  //               top: 5),
                                  //           child: Row(
                                  //             children: [
                                  //               Container(
                                  //                 width: 80,
                                  //                 child: Text(
                                  //                   "${taste.name}: ",
                                  //                   style: TextStyle(
                                  //                       color: Colors.red,
                                  //                       fontSize: 22),
                                  //                 ),
                                  //               ),
                                  //               CustomIconButton(
                                  //                   backgroundColor: Colors
                                  //                       .black
                                  //                       .withOpacity(0.2),
                                  //                   icon: Icon(Icons.remove,
                                  //                       size: 16),
                                  //                   onPressed: () {},
                                  //                   margin: EdgeInsets.all(0)),
                                  //               Container(
                                  //                 margin: EdgeInsets.symmetric(
                                  //                     horizontal: 10),
                                  //                 child: Text(
                                  //                   "3",
                                  //                   style:
                                  //                       TextStyle(fontSize: 18),
                                  //                 ),
                                  //               ),
                                  //               CustomIconButton(
                                  //                   backgroundColor: Colors
                                  //                       .black
                                  //                       .withOpacity(0.2),
                                  //                   icon: Icon(
                                  //                     Icons.add,
                                  //                     size: 16,
                                  //                   ),
                                  //                   onPressed: () {
                                  //                     // updateState("add");
                                  //                     controller.editTaste();
                                  //                   },
                                  //                   margin: EdgeInsets.all(0)),
                                  //               // Text("${lv == 3 ? '(nguyên bản)' : ''}")
                                  //             ],
                                  //           ),
                                  //         ))
                                  //   ],
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: Container(
                //     height: 120,
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       color: Color(0xffffffe5),
                //       border: Border.all(color: Color(0xfff1f6be)),
                //       borderRadius: BorderRadius.circular(5.0),
                //     ),
                //     child: Column(
                //       children: [
                //         proDes(
                //           icon: const FittedBox(
                //             child: Icon(
                //               Icons.access_time,
                //               color: Colors.black,
                //             ),
                //           ),
                //           t1: 'Chế biến',
                //           t2: '20 phút',
                //         ),
                //         proDes(
                //           icon: FittedBox(
                //             child: Icon(
                //               Icons.wb_twilight_rounded,
                //               color: Colors.black,
                //             ),
                //           ),
                //           t1: 'Bảo quản',
                //           t2: 'Tối đa 2 ngày',
                //         ),
                //         proDes(
                //           icon: FittedBox(
                //             child: Icon(
                //               Icons.wb_twilight_rounded,
                //               color: Colors.black,
                //             ),
                //           ),
                //           t1: 'Dinh dưỡng',
                //           t2: '2000 clories',
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mô tả',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Lorem Ipskn noty uasdasd asdasd asdasda ádasdnchanged",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thành phần dinh dưỡng',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 19),
                  width: 400,
                  height: 90,
                  child: GetBuilder<DishDetailController>(
                    builder: (controller) => ListView.builder(
                      itemCount: controller.dish.nutrientDetails!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsetsDirectional.only(top: 5),
                            child: Row(
                              children: [
                                Text(
                                    "${controller.dish.nutrientDetails![index].nutrientName}:  "),
                                Text(
                                    "${controller.dish.nutrientDetails![index].amount}")
                              ],
                            ));
                      },
                      // scrollDirection: Axis.horizontal,
                      // padding: EdgeInsets.only(left: 16),
                      // shrinkWrap: true,
                      // physics: BouncingScrollPhysics(),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thành phần Nguyên Liệu',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 19),
                  width: 400,
                  height: 100,
                  child: GetBuilder<DishDetailController>(
                    builder: (controller) => ListView.builder(
                      itemCount: controller.dish.dishIngredients!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsetsDirectional.only(top: 5),
                            child: Row(
                              children: [
                                Text(
                                    "${controller.dish.dishIngredients![index].metarialName}: "),
                                Text(
                                    "${controller.dish.dishIngredients![index].quantity}")
                              ],
                            ));
                      },
                      // scrollDirection: Axis.horizontal,
                      // padding: EdgeInsets.only(left: 16),
                      // shrinkWrap: true,
                      // physics: BouncingScrollPhysics(),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hướng dẫn",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ...controller.dish.repices![0].steps!.map((
                        v,
                      ) =>
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Bước ${counter + 1}"),
                                // Container(
                                //   width: 170,
                                //   child: Material(
                                //     elevation: 10,
                                //     child: Image.network('${v.image}'),
                                //   ),
                                // ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    "${v.description}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                )
                              ],
                            ),
                          ))
                      // Column(
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [

                      //       ],
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),

                Container(
                  height: 150,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         'Sản phẩm liên quan',
                //         style: TextStyle(
                //             fontSize: 18, fontWeight: FontWeight.bold),
                //       ),
                //       ProductGrid(),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 60,
                // ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                        // startAddNewTransaction(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.local_mall_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              controller.setQuantity('reset');
                              showButtonModalSheet(context, controller);
                            },
                            child: Text(
                              'Thêm vào giỏ hàng',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class proDes extends StatelessWidget {
  Widget icon;
  String t1;
  String t2;

  proDes({required this.icon, required this.t1, required this.t2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          SizedBox(
            width: 5,
          ),
          Text(
            '$t1',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Spacer(),
          Text(
            '$t2',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget buildCustomTaste() {
//   List listTaste = [
//     {'taste': 'Cay'},
//     {'taste': 'Chua'},
//   ];
//   return Container(
//     margin: EdgeInsets.only(top: 0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 5,
//         ),
//         Column(
//           children: [
//             ...listTaste.map((taste) => Container(
//                   margin: EdgeInsetsDirectional.only(top: 5),
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 80,
//                         child: Text(
//                           "${taste['taste']}: ",
//                           style: TextStyle(color: Colors.red, fontSize: 22),
//                         ),
//                       ),
//                       CustomIconButton(
//                           backgroundColor: Colors.black.withOpacity(0.2),
//                           icon: Icon(Icons.remove, size: 16),
//                           onPressed: () {},
//                           margin: EdgeInsets.all(0)),
//                       Container(
//                         margin: EdgeInsets.symmetric(horizontal: 10),
//                         child: Text(
//                           "3",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                       CustomIconButton(
//                           backgroundColor: Colors.black.withOpacity(0.2),
//                           icon: Icon(
//                             Icons.add,
//                             size: 16,
//                           ),
//                           onPressed: () {},
//                           margin: EdgeInsets.all(0)),
//                       // Text("${lv == 3 ? '(nguyên bản)' : ''}")
//                     ],
//                   ),
//                 ))
//           ],
//         )
//       ],
//     ),
//   );
// }

// Widget buildRecipe() {
//   List listRecipe = [
//     {
//       'image':
//           'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/uop-ga-cung-gia-vi.jpg',
//       'description':
//           "bạn trộn nước xốt ướp gà theo công thức: 2 muỗng canh nước mắm, 1 muỗng cà phê muối, 2 muỗng canh dầu ăn, 2 muỗng cà phê đường, 1 muỗng cà phê bột ngọt, 1/2 muỗng cà phê tiêu, 4 trái ớt giã nhuyễn, khuấy đều."
//     },
//     {
//       'image':
//           'https://cdn.huongnghiepaau.com/wp-content/uploads/2017/10/nuong-ga.jpg',
//       'description':
//           'Sau khoảng thời gian ướp, bạn lấy gà ra ngoài, đặt lên vỉ nướng trên bếp than hoa. Mẹo nhỏ trong cách làm gà nướng muối ớt mà không phải ai cũng biết là bạn nên nướng gà với lửa nhỏ, vì lửa lớn rất dễ làm lớp da bên ngoài bị cháy còn thịt bên trong còn sống.'
//     },
//     {
//       'image':
//           'https://thuvienamthuc.vn/app_images/news/2020/6/30/cach-lam-ga-nuong-muoi-ot-ngon-800-153822.jpg',
//       'description': 'Trình Bày Và Thưởng Thức'
//     },
//   ];
//   int counter = 0;
//   return Container(
//     margin: EdgeInsets.only(top: 12),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Hướng dẫn",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(
//           height: 12,
//         ),
//         ...listRecipe.map((
//           v,
//         ) =>
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Bước ${++counter}"),
//                   Container(
//                     width: 170,
//                     child: Material(
//                       elevation: 10,
//                       child: Image.network('${v['image']}'),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     child: Text(
//                       "${v['description']}",
//                       style: TextStyle(fontSize: 14),
//                     ),
//                   )
//                 ],
//               ),
//             ))
//         // Column(
//         //   children: [
//         //     Column(
//         //       crossAxisAlignment: CrossAxisAlignment.start,
//         //       children: [

//         //       ],
//         //     )
//         //   ],
//         // )
//       ],
//     ),
//   );
// }

showButtonModalSheet(BuildContext context, DishDetailController controller) {
  CartController cartController = Get.find<CartController>();
  // final items = <Widget>[
  //   ListTile(
  //     leading: Icon(Icons.photo_camera),
  //     title: Text('Camera'),
  //     onTap: () {},
  //   ),
  //   ListTile(
  //     leading: Icon(Icons.photo_library),
  //     title: Text('Select'),
  //     onTap: () {},
  //   ),
  //   ListTile(
  //     leading: Icon(Icons.delete),
  //     title: Text('Delete'),
  //     onTap: () {},
  //   ),
  //   Divider(),
  //   if (true)
  //     ListTile(
  //       title: Text('Cancel'),
  //       onTap: () {},
  //     ),
  // ];

  showModalBottomSheet(
    context: context,
    builder: (BuildContext _) {
      return Stack(
        children: [
          Container(
            height: 250,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.8,
                    ),
                    const Text(
                      'Tùy chọn ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              height: 110,
                              width: 130,
                              child: Image.network(
                                (controller.dish.image == null)
                                    ? ''
                                    : controller.dish.image!,
                                fit: BoxFit.cover,
                              ))
                        ],
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '${controller.dish.name}',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Obx(
                                    () => Text(
                                      '${(controller.dish.price! * controller.quantity.value).toStringAsFixed(0)}đ',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  )),
                              Container(
                                padding: EdgeInsets.only(top: 15, left: 130),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      child: CustomIconButton(
                                          backgroundColor: Colors.green,
                                          icon: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          onPressed: () {
                                            controller.setQuantity('remove');
                                          },
                                          margin: EdgeInsets.only()),
                                    ),
                                    Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Obx(
                                          () => Text(
                                            '${controller.quantity}',
                                            style: TextStyle(
                                              fontSize: 20 * 0.8,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )),
                                    Container(
                                      child: CustomIconButton(
                                          backgroundColor: Colors.green,
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                          onPressed: () {
                                            controller.setQuantity('add');
                                          },
                                          margin: EdgeInsets.only()),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                const Divider(
                  height: 1.0,
                  indent: 1.0,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  color: Colors.blueAccent,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                        // Get.to(CartScreen());
                        cartController.addToCart(
                            controller.dish, controller.quantity.value);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.local_mall_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Thêm vào giỏ hàngg',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
    isScrollControlled: true,
  );
}
