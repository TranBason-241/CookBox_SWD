import 'package:app/getx/controller/cart_controller.dart';
import 'package:app/getx/controller/dish_detail_controller.dart';
import 'package:app/getx/controller/user_controller.dart';
import 'package:app/models/detail_dish.dart';
import 'package:app/models/menu_detail.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class RequiredPhoneBumberScreen extends StatelessWidget {
  // const ProductDetailScreen({Key? key}) : super(key: key);

  // ProductDetailScreen({required this.dish});

  // CartController cartController = Get.find<CartController>();
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chuẩn bị để mua sắm!'),
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
              Get.to(CartScreen());
            },
          ),
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Text(
                'Cập nhật số điện thoại',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Center(
              child: Text(
                'Thông tin quan trọng này giúp bạn dễ dàng mua sắm',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 90, right: 90),
            child: Form(
                key: userController.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: TextFormField(
                    controller: userController.numberEditingController,
                    validator: (value) {
                      if (value!.toString().length != 10) {
                        return 'Vui lòng nhập số điện đúng';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      userController.numberEditingController.text = value!;
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'số điện thoại của bạn',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      filled: true,
                      fillColor: Colors.white,
                    ))),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // background
                  onPrimary: Colors.white, // foreground
                ),
                child: const Text('Cập nhật'),
                onPressed: () => {userController.updateUser('phone_required')}),
          )
        ],
      )),
    );
  }
}
