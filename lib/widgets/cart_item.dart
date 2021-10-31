
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String img;
  final String productID;

  CartItem(
      {required this.id,
      required this.productID,
      required this.img,
      required this.price,
      required this.quantity,
      required this.title});

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
    //   child: Padding(
    //     padding: EdgeInsets.all(8),
    //     child: ListTile(
    //       // leading: CircleAvatar(
    //       //   child: Padding(
    //       //       padding: const EdgeInsets.all(5),
    //       //       child: FittedBox(child: Text('\$${price.toStringAsFixed(3)}'))),
    //       // ),
    //       // leading: CircleAvatar(
    //       //   child: Padding(
    //       //       padding: const EdgeInsets.all(5),
    //       //       child: FittedBox(
    //       //           child: Column(
    //       //         children: [
    //       //           Image.network(img),
    //       //           // Text('\$${price.toStringAsFixed(3)}')
    //       //         ],
    //       //       ))),
    //       // ),
    //       leading: Image.network(img),
    //       title: Text(title),
    //       subtitle: Text('Total: ${(price * quantity)}đ'),
    //       trailing: Column(
    //         children: [
    //           Text('$quantity x '),
    //           TextButton(
    //             child: Icon(
    //               Icons.delete_forever,
    //             ),
    //             onPressed: () {
    //               Provider.of<Cart>(context, listen: false)
    //                   .removeItem(productID);
    //             },
    //           ),
    //         ],
    //       ),
    //       // trailing: TextButton(
    //       //   child: Icon(Icons.delete_forever),
    //       //   onPressed: () {
    //       //     Provider.of<Cart>(context, listen: false).removeItem(productID);
    //       //   },
    //       // ),

    //       // trailing: TextButton(
    //       //   child: Icon(Icons.delete_forever),
    //       //   onPressed: () {
    //       //     // Provider.of<Cart>(context, listen: false)
    //       //     //     .addItem(productID, price, title);
    //       //   },
    //       // ),
    //     ),
    //   ),
    // );
    ///
    return Card(
      child: Row(
        children: [
          Image.network(
            img,
            width: 100,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text('Giá: ' + price.toString() + 'đ'),
                Text('Tổng: ${(price * quantity)}đ')
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_circle),
              ),
              Text(quantity.toString()),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add_circle),
              ),
            ],
          ),
        ],
      ),
    );

    // return Container(
    //     child: Card(
    //   margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
    //   color: Color(0xffEEEEEE),
    //   child: ListTile(
    //     // on ListItem clicked
    //     onTap: () {},

    //     // Image of ListItem
    //     leading: Container(
    //       child: Image(
    //         fit: BoxFit.fitHeight,
    //         // image: AssetImage(imgSrc),
    //         image: NetworkImage(img),
    //       ),
    //     ),

    //     // Lists of titles
    //     title: Container(
    //       margin: EdgeInsets.only(top: 10.0),
    //       height: 80.0,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           Container(
    //             padding: EdgeInsets.only(bottom: 2.0),
    //             child: Text(
    //               "Item Name",
    //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.only(bottom: 3.0),
    //             child: Text(
    //               "Item Cetegory",
    //               style: TextStyle(),
    //             ),
    //           ),
    //           Container(
    //             padding: EdgeInsets.only(bottom: 3.0),
    //             child: Text(
    //               "500 RS",
    //               style: TextStyle(color: Color(0xff374ABE)),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),

    //     // trailing: Container(
    //     //   child: Icon(
    //     //     Icons.refresh,
    //     //     size: 30,
    //     //     color: Color(0xff374ABE),
    //     //   ),
    //     // ),
    //   ),
    // ));
  }
}
