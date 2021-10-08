import 'package:app/providers/orders.dart' show Orders;
import 'package:app/widgets/custom_navbar.dart';
import 'package:app/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class OrderScreen extends StatelessWidget {
static const routeName = '/orders';
// final PageStorageBucket bucket = PageStorageBucket();
// Widget currentScreen = OrderScreen();
@override
Widget build(BuildContext context) {
  // final orderData = Provider.of<Orders>(context);
  return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Đơn hàng'),
      ),
      body: Stack(
        children: [
          // SafeArea(
          //   child: ListView.builder(
          //     itemCount: orderData.orders.length,
          //     itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
          //   ),
          // ),
          // Positioned(
          //     bottom: 0,
          //     left: 0,
          //     child: CustomNavbar(
          //       order: true,
          //     )),
        ],
      ));
}
}