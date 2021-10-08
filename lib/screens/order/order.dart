import 'package:app/screens/order/dahoantat.dart';
import 'package:app/screens/order/dahuy.dart';
import 'package:app/screens/order/dangden.dart';

import '/providers/orders.dart' show Orders;
import '/widgets/custom_navbar.dart';
import '/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/cart.dart';
import '/screens/cart_screen.dart';
import '/widgets/bage.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);
  static const routeName = '/order';

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  // int currentTab = 1;
  // final List<Widget> screens = [
  //   HomeScreen(),
  //   OrderScreen(),
  // ];
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    //   return Scaffold(
    //       appBar: AppBar(
    //         title: Text(
    //           'Đơn hàng',
    //           style: TextStyle(fontWeight: FontWeight.w600),
    //         ),
    //         actions: [
    //           Consumer<Cart>(
    //             builder: (_, cartData, ch) => Badge(
    //               child: ch as Widget,
    //               value: cartData.itemCount.toString(),
    //               color: Colors.red,
    //             ),
    //             child: IconButton(
    //               icon: Icon(Icons.local_mall_outlined),
    //               onPressed: () {
    //                 Navigator.pushNamed(context, CartScreen.routeName);
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //       body: Stack(
    //         children: [
    //           SafeArea(
    //             child: ListView.builder(
    //               itemCount: orderData.orders.length,
    //               itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
    //             ),
    //           ),
    //           Positioned(
    //               bottom: 0,
    //               left: 0,
    //               child: CustomNavbar(
    //                 order: true,
    //               )),
    //         ],
    //       ));
    // }

    //
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xfff32726),
            title: Text(
              'Đơn hàng',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            actions: [
              Consumer<Cart>(
                builder: (_, cartData, ch) => Badge(
                  child: ch as Widget,
                  value: cartData.itemCount.toString(),
                  color: Colors.red,
                ),
                child: IconButton(
                  icon: Icon(Icons.local_mall_outlined),
                  onPressed: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                ),
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.red,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: [
                Tab(
                  // icon: Icon(Icons.category_outlined),
                  text: 'Đang đến',
                ),
                Tab(
                  // icon: Icon(Icons.category_outlined),
                  text: 'Đã hoàn thành',
                ),
                Tab(
                  // icon: Icon(Icons.category_outlined),
                  text: 'Đã hủy',
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              TabBarView(children: [
                DangDen(),
                dahoantat(),
                Dahuy(),
              ]),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: CustomNavbar(
                    order: true,
                  )),
            ],
          )),
    );
  }
}
