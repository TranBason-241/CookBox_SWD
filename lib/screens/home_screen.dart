import 'package:app/getx/controller/cart_controller.dart';
import 'package:app/getx/controller/dish_detail_controller.dart';
import 'package:app/getx/controller/order_controller.dart';
import 'package:app/getx/controller/order_detail_controller.dart';
import 'package:app/getx/controller/search_controller.dart';
import 'package:app/models/detail_dish.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/order/new_order_screen.dart';
import 'package:app/screens/search_screen.dart';
import 'package:app/getx/controller/menu_detail_controller.dart';
import 'package:app/widgets/custom_navbar.dart';
import 'package:app/widgets/listview_popular.dart';
import 'package:app/widgets/popular_item.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static void initialize() {
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'));
    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? route) async {
      if (route != null) {
        print("object ne bn oi" + route);
        // Get.to(OrderScreen(), binding: OrderBinding());
        // Get.to(route);
        Get.toNamed(route);
      }
    });
  }

  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails('cookbox', 'cookbox channel',
            importance: Importance.max, priority: Priority.high),
      );
      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.title,
        notificationDetails,
        payload: message.data['route'],
      );
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'https://cf.shopee.vn/file/b19a4998332c28c3fe1014429f12b2c5',
    'https://cdn.chanhtuoi.com/uploads/2021/07/foodmap.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD-qQL9OpIzo1logABt9hiMAEz0gpviVf8jA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRvabEVjmLblf-tX64eNpj6ZRtl_IH1weF_A&usqp=CAU',
  ];

  final MenuDetailController controller =
      Get.put(MenuDetailController(categoryID: 2));

  final DishDetailController controller2 = Get.put(DishDetailController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMessage = message.data['route'];
        // Get.to(OrderScreen(), binding: OrderBinding());
        print(routeFromMessage + 'Hlsssslo');
        Get.toNamed(routeFromMessage);
        var _fcm = FirebaseMessaging.instance;
        _fcm.getToken().then((value) => print('The |||' + value!));
      }
    });
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.body);
        print(message.notification!.title);
        LocalNotificationService.display(message);
      }
      var _fcm = FirebaseMessaging.instance;
      _fcm.getToken().then((value) => print('The |||' + value!));
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMessage = message.data['route'];
      // Get.to(OrderScreen(), binding: OrderBinding());
      // Get.to(routeFromMessage);
      print(routeFromMessage + 'Hllo');
      Get.toNamed(routeFromMessage);
      var _fcm = FirebaseMessaging.instance;
      _fcm.getToken().then((value) => print('The|||' + value!));
    });
  }

  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    // var a = controller2.fetchDishDetail();
    // print(' ${a.name}');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        titleSpacing: 0,
        elevation: 0.0,
        title: TextButton(
          onPressed: () {},
          child: Row(
            children: [
              // Icon(Icons.fmd_good_outlined, color: Colors.white),
              Icon(
                Icons.store_mall_directory,
                color: Colors.white,
              ),
              SizedBox(
                width: 100,
                child: Obx(
                  () => Text(
                    controller.name.value == ''
                        ? 'CookboxApp'
                        : controller.name.value,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),

              //   const Icon(Icons.keyboard_arrow_down_rounded,
              //       color: Colors.white),
            ],
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                autofocus: false,
                onTap: () {
                  Get.to(SearchScreen());
                },
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm sản phẩm',
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
                    // Container(
                    //   decoration: BoxDecoration(
                    //       border: Border.all(color: Colors.red),
                    //       borderRadius:
                    //           const BorderRadius.all(Radius.circular(2))),
                    //   child: SizedBox(
                    //       height: 150.0,
                    //       width: double.infinity,
                    //       child: Carousel(
                    //         dotSpacing: 15.0,
                    //         dotSize: 6.0,
                    //         dotIncreasedColor: Colors.red,
                    //         dotBgColor: Colors.transparent,
                    //         indicatorBgPadding: 3.0,
                    //         dotPosition: DotPosition.bottomCenter,
                    //         dotHorizontalPadding: 5,
                    //         dotVerticalPadding: 5,
                    //         images: images
                    //             .map((item) => Container(
                    //                   child: Image.network(
                    //                     item,
                    //                     fit: BoxFit.cover,
                    //                   ),
                    //                 ))
                    //             .toList(),
                    //       )),
                    // ),
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
                            onPressed: () {
                              searchController.viewMore(2);
                              Get.to(SearchScreen());
                            },
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
                    /////
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
