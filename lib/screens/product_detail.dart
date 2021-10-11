import 'package:app/models/menu_detail.dart';
import 'package:app/widgets/product_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProductDetailScreen extends StatelessWidget {
  // const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-detail';
  Item dish;
  ProductDetailScreen({required this.dish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
        backgroundColor: Color(0xfff32726),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Icon(Icons.share),
          IconButton(
            icon: Icon(Icons.local_mall_outlined),
            onPressed: () {
              // Navigator.of(context).pushReplacementNamed(CartScrren.routeName);
              // Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Expanded(  child:
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    color: const Color(0xffacfff),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                           dish.image))
                  ),
                ),
                // ),
                // const SizedBox(
                //   height: 5,
                // ),
                ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dish.name,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Icon(
                      //       Icons.local_mall_outlined,
                      //       color: Colors.grey,
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text('2.0k'),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Icon(
                      //       Icons.thumb_up_off_alt,
                      //       color: Colors.grey,
                      //     ),
                      //     SizedBox(
                      //       width: 10,
                      //     ),
                      //     Text('21'),
                      //     SizedBox(
                      //       width: 20,
                      //     ),
                      //     Image.asset("assets/images/star_filled.png"),
                      //     const SizedBox(
                      //       width: 1,
                      //     ),
                      //     const Text(
                      //       "4.9",
                      //       style: TextStyle(
                      //         color: Colors.orange,
                      //       ),
                      //     ),
                      //     SizedBox(width: 6),
                      //     Text('(124 đánh giá)')
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      Row(
                        children: [
                          Text(
                            '${dish.price}',
                            style: const TextStyle(
                              fontSize: 25,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          // const Text(
                          //   '/ 200Gr/Phần',
                          //   style: TextStyle(
                          //     fontSize: 18,
                          //     color: Colors.grey,
                          //     fontWeight: FontWeight.w400,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffe5),
                      border: Border.all(color: Color(0xfff1f6be)),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: [
                        proDes(
                          icon: const FittedBox(
                            child: Icon(
                              Icons.access_time,
                              color: Colors.black,
                            ),
                          ),
                          t1: 'Chế biến',
                          t2: '20 phút',
                        ),
                        proDes(
                          icon: FittedBox(
                            child: Icon(
                              Icons.wb_twilight_rounded,
                              color: Colors.black,
                            ),
                          ),
                          t1: 'Bảo quản',
                          t2: 'Tối đa 2 ngày',
                        ),
                        proDes(
                          icon: FittedBox(
                            child: Icon(
                              Icons.wb_twilight_rounded,
                              color: Colors.black,
                            ),
                          ),
                          t1: 'Dinh dưỡng',
                          t2: '2000 clories',
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [Text('Thành phần Nguyên Liệu')],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 250,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mô tả',
                        style: TextStyle(color: Colors.amber, fontSize: 20),
                      ),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 3),
                        child: Container(
                            width: 400.0,
                            height: 45.0,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.blue,
                                  side: const BorderSide(color: Colors.blue),
                                ),
                                child: const Text('Xem toàn bộ mô tả'),
                                onPressed: () => {
                                      // Navigator.pushReplacementNamed(context,
                                      //     Product_detail_page.routeName),
                                    },
                                onLongPress: () => {})),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(15.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         'Sản phẩm liên quan',
                //         style: TextStyle(
                //             fontSize: 18, fontWeight: FontWeight.bold),
                //       ),
                //       ProductGrid(),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 60,
                // ),
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
                  color: Colors.green,
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
      ),
    );
  }
}

class proDes extends StatelessWidget {
  Widget icon;
  String t1;
  String t2;

  proDes({required this.icon, required this.t1, required this.t2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          SizedBox(
            width: 5,
          ),
          Text(
            '$t1',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Spacer(),
          Text(
            '$t2',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
