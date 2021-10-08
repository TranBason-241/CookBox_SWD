import 'package:app/providers/orders.dart' show Orders;
import 'package:app/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DangDen extends StatelessWidget {
  const DangDen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return ListView.builder(
      itemCount: orderData.orders.length,
      itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
    );
  }
}
