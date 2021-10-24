import 'package:app/getx/controller/order_controller.dart';
import 'package:app/getx/controller/order_detail_controller.dart';
import 'package:app/screens/order/cancelled_order_screen.dart';
import 'package:app/screens/order/completed_order_screen.dart';
import 'package:app/screens/order/new_order_screen.dart';
import 'package:app/screens/order/processing_order_screen.dart';
import 'package:app/screens/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatelessWidget {
  // static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.red,
    //     title: const Text('Đơn hàng'),
    //   ),
    //   body: SafeArea(
    //     child: Column(
    //       children: [
    //         Container(

    //           child: GetBuilder<OrderController>(
    //             builder: (controller) => ListView.builder(
    //               itemCount: controller.order.items!.length,
    //               itemBuilder: (context, index) {
    //                 return Container(
    //                   child: Column(
    //                     children: [
    //                       Text(controller.order.items!.first.date.toString()),
    //                       Text(controller.order.items!.first.id.toString()),
    //                       Text(controller.order.items!.first.paymentName
    //                           .toString()),
    //                     ],
    //                   ),
    //                 );
    //               },
    //               scrollDirection: Axis.horizontal,
    //               // padding: EdgeInsets.only(left: 16),
    //               shrinkWrap: true,
    //               physics: BouncingScrollPhysics(),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.red,
    //     title: const Text('Đơn hàng'),
    //   ),
    //   body: GetBuilder<OrderController>(
    //     builder: (controller) => ListView.builder(
    //       itemCount: controller.order.items!.length,
    //       itemBuilder: (context, index) {
    //         return Card(
    //           clipBehavior: Clip.antiAlias,
    //           child: Column(
    //             children: [
    //               ListTile(
    //                   leading: const Icon(
    //                     Icons.check_circle,
    //                     color: Color(0xff0eb54c),
    //                     size: 40,
    //                   ),
    //                   title: Text(
    //                     'Đơn hàng ngày ' +
    //                         DateFormat('dd-MM-yyyy')
    //                             .format(controller.order.items![index].date!),
    //                   ),
    //                   // title: Text(
    //                   //     'Đơn hàng ngày ${controller.order.items![index].date}'),
    //                   subtitle: Text(
    //                     'Chi nhánh ${controller.order.items![index].storeName}',
    //                     style: TextStyle(color: Colors.black.withOpacity(0.6)),
    //                   ),
    //                   trailing:
    //                       //  GestureDetector(
    //                       //     onTap: () {
    //                       //       Get.to(OrderDetailScreen());
    //                       //     },
    //                       // child:

    //                       IconButton(
    //                     onPressed: () {
    //                       Get.to(OrderDetailScreen(),
    //                           binding: OrderDetailBinding(),
    //                           arguments: {
    //                             'orderId': controller.order.items![index].id
    //                           });
    //                       print('object');
    //                     },
    //                     icon: const Icon(
    //                       Icons.keyboard_arrow_right,
    //                     ),
    //                   )
    //                   // child: const Icon(
    //                   //   Icons.keyboard_arrow_right,
    //                   // ),
    //                   ),
    //               // ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 20,
    //                 ),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                         '${controller.order.items![index].total!}đ (${controller.order.items![index].paymentName!}) - 3 món'),
    //                     // const Icon(
    //                     //   Icons.keyboard_arrow_right,
    //                     // ),
    //                     TextButton(
    //                       style: ButtonStyle(
    //                         shape: MaterialStateProperty.all<
    //                             RoundedRectangleBorder>(
    //                           RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(10.0),
    //                             side: const BorderSide(
    //                               color: Colors.red,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       onPressed: () {
    //                         controller.cancelOrder(
    //                             controller.order.items![index].id!);
    //                       },
    //                       child: const Text(
    //                         "Đánh giá",
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 20,
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfff32726),
          title: const Text(
            'Đơn hàng',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: const [
            // Consumer<Cart>(
            //   builder: (_, cartData, ch) => Badge(
            //     child: ch as Widget,
            //     value: cartData.itemCount.toString(),
            //     color: Colors.red,
            //   ),
            //   child: IconButton(
            //     icon: Icon(Icons.local_mall_outlined),
            //     onPressed: () {
            //       Navigator.pushNamed(context, CartScreen.routeName);
            //     },
            //   ),
            // ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.redAccent,
            unselectedLabelColor: Colors.white.withOpacity(
              0.9,
            ),
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(fontSize: 13.5, color: Colors.white),
            tabs: const [
              Tab(
                text: 'Mới',
              ),
              Tab(
                text: 'Đang xử lý',
              ),
              Tab(
                text: 'Hoàn thành',
              ),
              Tab(
                text: 'Đã hủy',
              ),
            ],
          ),
        ),
        body: Stack(
          children: const [
            TabBarView(children: [
              NewOrderScreen(),
              ProccessingOrderScreen(),
              CompletedOrderScreen(),
              CancelledOrderScreen()
            ]),
          ],
        ),
      ),
    );
  }
}
