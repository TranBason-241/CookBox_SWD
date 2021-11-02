import 'package:app/getx/controller/cart_controller.dart';
import 'package:app/getx/controller/order_controller.dart';
import 'package:app/getx/controller/payment_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static const routeName = '/payment';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PaymentController controller = Get.put(PaymentController());
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        titleSpacing: 0,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Thanh toán'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: Colors.red,
                height: 230,
                width: 400,
                child: GetBuilder<PaymentController>(
                  builder: (controller) => ListView.builder(
                    itemCount: controller.listItem.length,
                    // itemCount: 2,

                    itemBuilder: (context, index) {
                      print(controller.listItem[index].name!);
                      // return Text(controller.listItem[index].name!);
                      return dummyDataOfListView(
                        controller.listItem[index].image!,
                        controller.listItem[index].name!,
                        controller.listItem[index].description!,
                        controller.listItem[index].price! *
                            controller.listItem[index].quantity!,
                        controller.listItem[index].quantity!,
                      );
                    },
                    scrollDirection: Axis.vertical,
                    // padding: EdgeInsets.only(left: 16),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    // Divider(
                    //   color: Color(0xffcccccb),
                    // ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 20.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Tạm tính: ",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${controller.total}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xffcccccb),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: Obx(
                            () => Text(
                              "Phí vận chuyển( ${controller.distance} km)",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          )),
                          Obx(
                            () => Text(
                              "${controller.distance * 8000}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xffcccccb),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          left: 30.0, right: 30.0, top: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              "Tổng cộng",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Obx(
                            () => Text(
                              "${controller.totalFinal}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xffcccccb),
                    ),
                    InkWell(
                      onTap: () {
                        // orderController.createOrder();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Thanh toán',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  // Image.network(
                                  //   'https://itviec.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBM0E3SHc9PSIsImV4cCI6bnVsbCwicHVyIjoiYmxvYl9pZCJ9fQ==--98ad6550665270931a546757db0e58f65b0505bc/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDVG9MWm05eWJXRjBTU0lJY0c1bkJqb0dSVlE2RkhKbGMybDZaVjkwYjE5c2FXMXBkRnNIYVFJc0FXa0NMQUU2RDJKaFkydG5jbTkxYm1SSklnd2pSa1pHUmtaR0Jqc0dWRG9MWlhoMFpXNTBTU0lNTXpBd2VETXdNQVk3QmxRPSIsImV4cCI6bnVsbCwicHVyIjoidmFyaWF0aW9uIn19--7d96359076aa1ae3adcce15831d4033d052b9214/MoMo%20Logo.png',
                                  //   width: 30,
                                  // ),
                                  Text(
                                    'Tiền mặt',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Color(0xffcccccb),
                    ),

                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            ],
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
                  color: Color(0xfff32726),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                        orderController.createOrder();
                      },
                      child: const Text(
                        'Thanh toán',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
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

  dummyDataOfListView(String imgSrc, String itemName, String itemDes,
      double itemPrice, int itemCount) {
    return Container(
        // height: 200,
        width: 400,
        child: Column(
          children: [
            Card(
              elevation: 2,
              // margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 5.0),
              // color: Color(0xffFFFFFF),
              child: ListTile(
                  // on ListItem clicked
                  onTap: () {},
                  // Image of ListItem
                  leading: Container(
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(imgSrc),
                      width: 70,
                      height: 70,
                    ),
                  ),
                  // Lists of titles
                  title: Container(
                    // color: Colors.red,
                    // margin: EdgeInsets.only(top: 10.0),
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 2.0),
                          child: Text(
                            '${itemName}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: Container(
                    width: 120,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.amber),
                          child: Text('${itemCount}'),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text('${itemPrice}'),
                      ],
                    ),
                  )),
            ),
            Divider(
              height: 5,
            )
          ],
        ));
  }
}
