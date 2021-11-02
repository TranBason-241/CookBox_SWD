import 'package:app/getx/controller/cart_controller.dart';
import 'package:app/getx/controller/dish_detail_controller.dart';
import 'package:app/screens/product_detail.dart';
import 'package:app/models/menu_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularItemsCard extends StatelessWidget {
  final Item dish;
  PopularItemsCard({required this.dish});
  // PopularItems popularItems;
  // PopularItemsCard({required this.popularItems});
  // int type;
  // PopularItemsCard(this.type);

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(
    //   context,
    //   listen: false,
    // );
    // final cart = Provider.of<Cart>(context, listen: false);

    // final Cart1 _p = Get.find<Cart1>();
    //  var List<Dish> = [];
    final CartController cart = Get.put(CartController());
    final DishDetailController detailController =
        Get.find<DishDetailController>();
    // String imgUrl = dish.picture;
    return GestureDetector(
      onTap: () {
        detailController.fetchDishDetail(dish.id);
      },
      child: Container(
        padding: EdgeInsets.only(right: 7),
        height: 124,
        width: 170,
        child: Container(
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 150,
                width: 150,
                color: Colors.grey,
                child: Image.network(
                  dish.image,
                  fit: BoxFit.cover,
                ),

                //     decoration: BoxDecoration(
                //   image: const DecorationImage(
                //     image: NetworkImage(''),
                //     fit: BoxFit.cover,
                //   ),
                // )
                // color: Colors.red,
                // child: Image.network(
                //     'https://image-us.eva.vn/upload/2-2020/images/2020-04-07/5-cach-uop-ga-nuong-ngon-don-gian-voi-muoi-ot-mat-ong-1-1586255910-612-width512height341.jpg'),
                // height: 150,
                // width: 150,
              ),
              // ClipRRect(
              //   child: Image.network(
              //     // widget.popularItems.image,
              //     dish.picture,
              //     height: 120,
              //     width: 140,
              //     fit: BoxFit.cover,
              //   ),
              //   borderRadius: BorderRadius.circular(5),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   // widget.popularItems.text,
              //   'Lẩu Bao Tử Hầm Tiêussssss',
              //   // style: TextStyle(fontWeight: FontWeight.w600),
              // ),,
              Container(
                padding: EdgeInsets.only(left: 2),
                // color: Colors.grey,
                height: 26,
                child: Text(
                  dish.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                    // color: Colors.grey,
                    color: Color(0xff333333),
                    fontSize: 20,
                  ),
                ),
              ),

              Container(
                height: 35,
                // color: Colors.yellow,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // color: Colors.red,
                      padding: EdgeInsets.only(left: 3, right: 0),
                      child: Text(
                        '${dish.price}00 vnđ',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          wordSpacing: 0.2,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle,
                        size: 25,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        detailController.fetchDishDetail(dish.id);
                      },
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                  ),
                  Text(
                    '${dish.meal} (person)',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  // Text(
                  //   'nutri:${dish.nutrientDes}',
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ],
              ),
              // Row(
              //   children: const [
              //     Icon(
              //       Icons.star,
              //       size: 12,
              //       color: Colors.amber,
              //     ),
              //     Icon(
              //       Icons.star,
              //       size: 12,
              //       color: Colors.amber,
              //     ),
              //     Icon(
              //       Icons.star,
              //       size: 12,
              //       color: Colors.amber,
              //     ),
              //     Icon(
              //       Icons.star,
              //       size: 12,
              //       color: Colors.amber,
              //     ),
              //     Icon(
              //       Icons.star,
              //       size: 12,
              //       color: Colors.grey,
              //     ),
              //     SizedBox(
              //       width: 4,
              //     ),
              //     Text(
              //       "4.3 ",
              //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              //     ),
              //   ],
              // ),
              // Text(
              //   "(28 reviews)",
              //   style: TextStyle(fontSize: 12, color: Colors.grey),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
