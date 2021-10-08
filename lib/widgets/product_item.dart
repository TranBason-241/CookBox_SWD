import 'package:app/providers/cart.dart';
import 'package:app/providers/product.dart';
import 'package:app/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
      listen: false,
    );

    final cart = Provider.of<Cart>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: product.id,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                product.imageUrl,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  product.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: const TextStyle(
                    // color: Colors.grey,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Image.asset("assets/images/star_filled.png"),
                  const SizedBox(
                    width: 1,
                  ),
                  const Text(
                    "4.9",
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(width: 2),
                  Text('(124)')
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    product.price.toString() + ' vnđ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      wordSpacing: 0.2,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Icon(Icons.add_circle_outlined, size: 25, color: Colors.red),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(
                  //     Icons.add_circle_outline,
                  //     size: 15,
                  //     color: Colors.red,
                  //   ),
                  // )
                  SizedBox(
                    // height: 18.0,
                    width: 30,
                    child: IconButton(
                      icon: Icon(
                        Icons.add_circle,
                        size: 24,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        print(product.id);
                        cart.addItem(product.id, product.imageUrl,
                            product.price, product.title);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
