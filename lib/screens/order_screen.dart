import 'package:app/getx/controller/order_controller.dart';
import 'package:app/getx/controller/order_detail_controller.dart';
import 'package:app/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';
// final PageStorageBucket bucket = PageStorageBucket();
// Widget currentScreen = OrderScreen();
  final OrderDetailController controllerdd = Get.put(OrderDetailController());
  @override
  Widget build(BuildContext context) {
    // final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Đơn hàng'),
        ),
        body: SafeArea(
          // child: ListView.builder(
          //   itemCount: orderData.orders.length,
          //   itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
          // ),
          child: Column(
            children: [
              // Container(
              //   height: 274,
              //   child: GetBuilder<OrderController>(
              //     builder: (controller) => ListView.builder(
              //       // itemCount: controller.order.items!.length,
              //       itemCount: 1,
              //       itemBuilder: (context, index) {
              //         // return PopularItemsCard(
              //         //   dish: controller.listItem[index],
              //         // );

              //         return Container(
              //             child: Column(
              //           children: [
              //             Text(controller.order.items!.first.date.toString()),
              //             Text(controller.order.items!.first.id.toString()),
              //             Text(controller.order.items!.first.paymentName
              //                 .toString()),
              //             // Text(
              //             //   controller.order.items!.first.date.toString(),
              //             // ),
              //           ],
              //         ));
              //       },
              //       scrollDirection: Axis.horizontal,
              //       // padding: EdgeInsets.only(left: 16),
              //       shrinkWrap: true,
              //       physics: BouncingScrollPhysics(),
              //     ),
              //   ),
              // ),
              Container(
                height: 274,
                child: GetBuilder<OrderDetailController>(
                  builder: (controller) => ListView.builder(
                    // itemCount: controller.order.items!.length,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      // return PopularItemsCard(
                      //   dish: controller.listItem[index],
                      // );

                      return Container(
                          child: Column(
                        children: [
                          Text(controller.orderDetail.items!.first.id
                              .toString()),
                          Text(controller.orderDetail.items!.first.dishId
                              .toString()),
                          Text(controller.orderDetail.items!.first.dishName
                              .toString()),
                          Text(controller.orderDetail.items!.first.price
                              .toString()),
                        ],
                      ));
                    },
                    scrollDirection: Axis.horizontal,
                    // padding: EdgeInsets.only(left: 16),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
