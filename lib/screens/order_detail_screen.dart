import 'package:app/getx/controller/order_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
class OrderDetailScreen extends GetView<OrderDetailController> {
  // OrderDetailController orderDetailController =
  //     Get.find<OrderDetailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Chi tiết đơn hàng'),
      ),
      body: Obx(
        () => controller.orderDetail.value == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.orderDetail.value!.items!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                  leading: Text('STT: ${index + 1}'),
                                  title: Text(
                                      'Tên: ${controller.orderDetail.value!.items![index].dishName}'),
                                  subtitle: Text(
                                      'Giá: ${controller.orderDetail.value!.items![index].price}'),
                                  trailing: Text(
                                      'Số lượng: ${controller.orderDetail.value!.items![index].quantity}')),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Tổng tiền: ' + controller.total.toString() + 'đ'),
                        Text('Tổng tiền: ' + controller.total.toString() + 'đ'),
                        Text('Tổng tiền: ' + controller.total.toString() + 'đ'),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
 
 

