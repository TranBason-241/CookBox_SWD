import 'package:app/getx/controller/order_controller.dart';
import 'package:app/getx/controller/order_detail_controller.dart';
import 'package:app/screens/order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CompletedOrderScreen extends GetView<OrderController> {
  const CompletedOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.order.value == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: controller.order.value!.items!.length,
                itemBuilder: (context, index) {
                  return controller.order.value!.items![index].orderStatus!
                              .compareTo('Completed') ==
                          0
                      ? Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                  leading: const Icon(
                                    Icons.check_circle,
                                    color: Color(0xff0eb54c),
                                    size: 40,
                                  ),
                                  title: Text(
                                    'Đơn hàng ngày ' +
                                        DateFormat('dd-MM-yyyy').format(
                                            controller.order.value!
                                                .items![index].date!),
                                  ),
                                  // title: Text(
                                  //     'Đơn hàng ngày ${controller.order.value!.items![index].date}'),
                                  subtitle: Text(
                                    'Chi nhánh ${controller.order.value!.items![index].storeName}',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  trailing:
                                      //  GestureDetector(
                                      //     onTap: () {
                                      //       Get.to(OrderDetailScreen());
                                      //     },
                                      // child:

                                      IconButton(
                                    onPressed: () {
                                      Get.to(
                                        OrderDetailScreen(),
                                        binding: OrderDetailBinding(),
                                        arguments: {
                                          'orderId': controller
                                              .order.value!.items![index].id,
                                          'total': controller
                                              .order.value!.items![index].total!
                                              .toDouble(),
                                          'paymentName': controller.order.value!
                                              .items![index].paymentName,
                                          'storeName': controller.order.value!
                                              .items![index].storeName,
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.keyboard_arrow_right,
                                    ),
                                  )
                                  // child: const Icon(
                                  //   Icons.keyboard_arrow_right,
                                  // ),
                                  ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        '${controller.order.value!.items![index].total!}đ (${controller.order.value!.items![index].paymentName!})'),
                                    // const Icon(
                                    //   Icons.keyboard_arrow_right,
                                    // ),
                                    TextButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            side: const BorderSide(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        // controller.cancelOrder(controller
                                        //     .order.value!.items![index].id!);
                                      },
                                      child: const Text(
                                        "Đánh giá",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      : Container();
                },
              ),
      ),
    );
  }
}
