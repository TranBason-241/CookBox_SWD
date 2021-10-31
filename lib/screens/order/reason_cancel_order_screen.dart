import 'package:app/getx/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReasonCancelOrder extends GetView<OrderController> {
  TextEditingController inputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Hủy đơn hàng'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Nhập lý do bên dưới',
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              minLines: 4,
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              controller: inputController,
              // decoration: const InputDecoration(hintText: 'Nhập lý do'),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Thoát",
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    var data = Get.arguments;
                    int id = data[0];
                    controller.cancelOrder(id, inputController.text);
                    Get.back();
                  },
                  child: const Text(
                    "Xác nhận hủy",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
