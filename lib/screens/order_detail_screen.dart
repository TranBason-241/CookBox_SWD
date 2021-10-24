import 'package:app/getx/controller/order_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailScreen extends StatelessWidget {
  // OrderDetailController orderDetailController =
  //     Get.find<OrderDetailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Chi tiết đơn hàng'),
      ),
      body: Container(
        child: GetBuilder<OrderDetailController>(
          builder: (controller) => ListView.builder(
            itemCount: controller.orderDetail.items!.length,
            itemBuilder: (context, index) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                        leading: Text('STT: ${index + 1}'),
                        title: Text(
                            'Tên: ${controller.orderDetail.items![index].dishName}'),
                        subtitle: Text(
                            'Giá: ${controller.orderDetail.items![index].price}'),
                        trailing: Text(
                            'Số lượng: ${controller.orderDetail.items![index].quantity}')),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
