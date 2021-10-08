import 'package:app/widgets/custom_navbar.dart';
import 'package:flutter/material.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({Key? key}) : super(key: key);
  static const routeName = '/noity';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        title: Text(
          'Thông báo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Color(0xffcccccb),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: FittedBox(
                            child: Icon(
                              Icons.monetization_on_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Khuyến mãi',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Color(0xffcccccb),
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Color(0xffcccccb),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Color(0xffcccccb),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: FittedBox(
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Tin tức',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Color(0xffcccccb),
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  child: Container(
                    color: Color(0xfff0f0f0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Cập nhật trạng thái đơn hàng',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Positioned(
          //     bottom: 0,
          //     left: 0,
          //     child: CustomNavbar(
          //       notify: true,
          //     )),
        ],
      ),
    );
  }
}
