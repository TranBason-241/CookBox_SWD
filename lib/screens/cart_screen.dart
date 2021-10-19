// import '/providers/orders.dart';
// import '/screens/payment_screen.dart';
import 'package:app/getx/controller/cart_controller.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:get/get.dart';

// import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<Cart>(context);
    CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xfff32726),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(HomeScreen());
            },
          ),
          title: Text("Giỏ hàng của bạn"),
          actions: [
            TextButton(
              onPressed: () {
                // Provider.of<Cart>(context, listen: false).removeAll();
              },
              child: Text(
                'Xóa giỏ hàng',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng Tiền',
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                      Chip(
                        label: Obx(
                          () => Text(
                            // '120,000 vnđ',
                            // '${cart.totalAmout}đ',
                            '${cartController.total.toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        backgroundColor: Color(0xfff32726),
                      ),
                      // Spacer(),
                      // TextButton(
                      //   onPressed: () {
                      //     Provider.of<Orders>(context, listen: false).addOrder(
                      //       cart.items.values.toList(),
                      //       cart.totalAmout,
                      //     );
                      //     cart.clear();
                      //   },
                      //   child: Text('Đặt hàng ngay'),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: cart.items.length,
                //     itemBuilder: (ctx, i) => CartItem(
                //         id: cart.items.values.toList()[i].id,
                //         img: cart.items.values.toList()[i].img,
                //         productID: cart.items.keys.toList()[i],
                //         title: cart.items.values.toList()[i].title,
                //         quantity: cart.items.values.toList()[i].quantity,
                //         price: cart.items.values.toList()[i].price),
                //   ),
                // ),
                Column(
                  children: [
                    cartController.cart.isEmpty
                        ? Text('Bạn chưa có sản phẩm nào trong giỏ hàng')
                        : Container(
                            // child: Text('${cartController.listItemInCart.isEmpty ? 'null' : cartController.listItemInCart[0].name }'),
                            // height: 500,
                            // width: 400,
                            child: GetBuilder<CartController>(
                              builder: (controller) => ListView.builder(
                                itemCount: controller.cart.values.length,

                                itemBuilder: (context, index) {
                                  int key =
                                      controller.cart.keys.elementAt(index);
                                  return Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                height: 130,
                                                width: 130,
                                                child: Image.network(
                                                  '${controller.cart[key]!.image}',
                                                  fit: BoxFit.cover,
                                                ))
                                          ],
                                        ),
                                        Container(
                                            padding: EdgeInsets.only(top: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${controller.cart[key]!.name}',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 115),
                                                      child: CustomIconButton(
                                                          backgroundColor:
                                                              Colors.white,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: Colors.red,
                                                            size: 15,
                                                          ),
                                                          onPressed: () {
                                                            // MyAlert();
                                                            cartController
                                                                .deleteDishInCart(
                                                                    controller
                                                                        .cart[
                                                                            key]!
                                                                        .id!);
                                                          },
                                                          margin: EdgeInsets
                                                              .only()),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  child: Text(
                                                    '${((controller.cart[key]!.price)! * (controller.cart[key]!.quantity)!)!.toStringAsFixed(2)}đ (${controller.cart[key]!.quantity})',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 15, left: 130),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        child: CustomIconButton(
                                                            backgroundColor:
                                                                Colors.green,
                                                            icon: Icon(
                                                              Icons.remove,
                                                              color:
                                                                  Colors.white,
                                                              size: 12,
                                                            ),
                                                            onPressed: () {
                                                              cartController
                                                                  .editQuantity(
                                                                      controller
                                                                          .cart[
                                                                              key]!
                                                                          .id!,
                                                                      'remove');
                                                            },
                                                            margin: EdgeInsets
                                                                .only()),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 10),
                                                        child: Text(
                                                          '${controller.cart[key]!.quantity}',
                                                          style: TextStyle(
                                                            fontSize: 20 * 0.8,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      Container(
                                                        child: CustomIconButton(
                                                            backgroundColor:
                                                                Colors.green,
                                                            icon: Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                              size: 12,
                                                            ),
                                                            onPressed: () {
                                                              cartController
                                                                  .editQuantity(
                                                                      controller
                                                                          .cart[
                                                                              key]!
                                                                          .id!,
                                                                      'add');
                                                            },
                                                            margin: EdgeInsets
                                                                .only()),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                  );
                                },
                                // scrollDirection: Axis.horizontal,
                                // padding: EdgeInsets.only(left: 16),
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                              ),
                            ),
                          ),
                  ],
                  // children: [

                  // ],
                )
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
                    // color: Colors.red,
                    color: Color(0xfff32726),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, PaymentScreen.routeName);
                            // startAddNewTransaction(context);
                          },
                          // child: Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: const [
                          //     Icon(
                          //       Icons.local_mall_outlined,
                          //       color: Colors.white,
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Text(
                          //       'Thanh toán',
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 15,
                          //       ),
                          //       textAlign: TextAlign.center,
                          //     ),
                          //   ],
                          // ),
                          child: cartController.cart.isEmpty
                              ? InkWell(
                                  onTap: () {
                                    Get.to(HomeScreen());
                                  },
                                  child: Text(
                                    'Mua ngay',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              : InkWell(
                                  // onTap: (){

                                  // },
                                  child: Text(
                                    'Đặt hàng',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class MyAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: RaisedButton(
        child: Text('Show alert'),
        onPressed: () {
          showAlertDialog(context);
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Simple Alert"),
    content: Text("This is an alert message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
