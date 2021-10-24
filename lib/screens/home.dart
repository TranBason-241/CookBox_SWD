import 'package:app/getx/controller/home_controller.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/notify_screen.dart';
import 'package:app/screens/order/cancelled_order_screen.dart';
import 'package:app/screens/order/new_order_screen.dart';
import 'package:app/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomeScreen(),
              // DishTestScreen(),
              OrderScreen(),
              NotifyScreen(),
              CartScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              _bottomNavigationBarItem(
                icon: Icons.home,
                label: 'Trang chủ',
              ),
              _bottomNavigationBarItem(
                icon: Icons.local_mall_outlined,
                label: 'Đơn hàng',
              ),
              _bottomNavigationBarItem(
                icon: Icons.circle_notifications_rounded,
                label: 'Thông báo',
              ),
              _bottomNavigationBarItem(
                icon: Icons.perm_identity_outlined,
                label: 'Tài khoản',
              ),
            ],
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
