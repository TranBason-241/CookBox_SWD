import 'dart:math';

import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;
  OrderItem(this.order);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expaned = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Tổng tiền ${widget.order.amout} vnđ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              DateFormat('dd-MM-yyyy').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expaned ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expaned = !_expaned;
                });
              },
            ),
          ),
          if (_expaned)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              height: min(widget.order.products.length * 20 + 70, 180),
              child: ListView(
                children: widget.order.products.map(
                  (product) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(
                        //   product.title,
                        //   style: TextStyle(
                        //     fontSize: 18,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        SizedBox(
                          width: 120.0,
                          child: Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                        Text(
                          '${product.quantity}x ${product.price}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  },
                ).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
