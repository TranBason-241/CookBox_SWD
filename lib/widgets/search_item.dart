import 'package:app/providers/cart.dart';
import 'package:app/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchItem extends StatelessWidget {
  final String id;
  final double price;
  final String img;
  final String title;
  final String description;

  SearchItem(
      {required this.id,
      required this.price,
      required this.description,
      required this.img,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    void startAddNewTransaction(BuildContext ctx) {
      showModalBottomSheet(
          context: ctx,
          builder: (bCtx) {
            int itemCount = 0;
            return Stack(
              children: [
                Container(
                  // height: 400,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.clear),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3.8,
                          ),
                          Text(
                            'Tùy chọn ',
                            style: TextStyle(fontSize: 19),
                          ),
                        ],
                      ),
                      ListTile(
                        // on ListItem clicked
                        onTap: () {},

                        // Image of ListItem
                        leading: Container(
                          child: Image(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(
                                'https://cookbeo.com/media/2020/11/dau-que-xao-thit-bo/dau-que-xao-thit-bo-4x3.webp'),
                          ),
                        ),

                        // Lists of titles
                        title: Container(
                          margin: EdgeInsets.only(top: 10.0),
                          height: 80.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 2.0),
                                child: Text(
                                  "Item Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 3.0),
                                child: Text(
                                  "Item Cetegory",
                                  style: TextStyle(),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 3.0),
                                child: Text(
                                  "500 RS",
                                  style: TextStyle(color: Color(0xff374ABE)),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Item Add and Remove Container
                        // subtitle: Container(
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Text(context.watch<Products>().counter.toString()),
                            Spacer(),
                            Consumer<Products>(
                              builder: (context, value, child) {
                                return Text((value.count * 100).toString());
                              },
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey),
                              child: Wrap(
                                direction: Axis.horizontal,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      if (itemCount < 0) {
                                        itemCount = 0;
                                      } else {
                                        itemCount--;
                                      }
                                      itemCount =
                                          context.read<Products>().divCounter();
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      size: 19.0,
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(
                                          left: 10.0, top: 1.0, right: 10.0),
                                      child: Consumer<Products>(
                                        builder: (context, value, child) {
                                          return Text(value.count.toString());
                                        },
                                      )),

                                  // Add count button
                                  GestureDetector(
                                    onTap: () {
                                      itemCount =
                                          context.read<Products>().addCounter();
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: 19.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // trailing shows the widget on the right corner of the list item
                        // trailing: Icon(Icons.cancel),
                      ),
                    ],
                  ),
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
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: GestureDetector(
                            onTap: () {
                              // startAddNewTransaction(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.local_mall_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Thêm vào giỏ hàng',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          });
    }

    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed(
        //   ProductDetailScreen.routeName,
        //   arguments: product.id,
        // );
      },
      child: Card(
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
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    description,
                  ),
                  Text(price.toString()),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // cart.addItem(product.id, product.price, product.title);
                    // startAddNewTransaction(context);
                    // cart.addItem(id,img, price, title);
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
