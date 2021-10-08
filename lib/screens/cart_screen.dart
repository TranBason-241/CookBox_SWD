import 'package:app/providers/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
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
        body: Column(
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
                  // Chip(
                  //   label: Text(
                  //     // '120,000 vnđ',
                  //     '${cart.totalAmout}đ',
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   backgroundColor: Colors.red,
                  // ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      // Provider.of<Orders>(context, listen: false).addOrder(
                      //   cart.items.values.toList(),
                      //   cart.totalAmout,
                      // );
                      // // cart.clear();
                    },
                    child: Text('Đặt hàng ngay'),
                  ),
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
          ],
        ));
  }
}
