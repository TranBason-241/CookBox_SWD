import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/widgets/custom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const routeName = '/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        title: Text(
          'Tài khoản',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // SizedBox(
              //   height: 80,
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.pushNamed(context, LoginScreen.routeName);
              //     },
              //     child: Container(
              //       color: Color(0xfff0f0f0),
              //       child: Padding(
              //         padding: const EdgeInsets.all(20.0),
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: const [
              //             Icon(
              //               Icons.account_circle,
              //               color: Color(0xffcccccb),
              //               size: 50,
              //             ),
              //             SizedBox(
              //               width: 10,
              //             ),
              //             Text(
              //               'Đăng nhập',
              //               style: TextStyle(
              //                 fontSize: 20,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25),
              //   child: SizedBox(
              //     height: 50,
              //     child: Row(
              //       children: const [
              //         CircleAvatar(
              //           backgroundColor: Color(0xffcccccb),
              //           child: Padding(
              //             padding: const EdgeInsets.all(10),
              //             child: FittedBox(
              //               child: Icon(
              //                 Icons.panorama_horizontal,
              //                 color: Colors.black,
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           'Khuyến mãi',
              //           style: TextStyle(
              //             fontSize: 16,
              //           ),
              //         ),
              //         Spacer(),
              //         Icon(
              //           Icons.arrow_forward_ios_outlined,
              //           color: Color(0xffcccccb),
              //           size: 15,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Divider(
                color: Color(0xffcccccb),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Color(0xffcccccb),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: FittedBox(
                            child: Icon(
                              Icons.account_circle,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Thông tin cá nhân',
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
                  height: 50,
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
                        'Địa chỉ',
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
                  height: 50,
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Color(0xffcccccb),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: FittedBox(
                            child: Icon(
                              Icons.policy_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Chính sách người dùng',
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
              // Divider(
              //   color: Color(0xffcccccb),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25),
              //   child: SizedBox(
              //     height: 50,
              //     child: Row(
              //       children: const [
              //         CircleAvatar(
              //           backgroundColor: Color(0xffcccccb),
              //           child: Padding(
              //             padding: const EdgeInsets.all(10),
              //             child: FittedBox(
              //               child: Icon(
              //                 Icons.settings,
              //                 color: Colors.black,
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           'Cài đặt',
              //           style: TextStyle(
              //             fontSize: 16,
              //           ),
              //         ),
              //         Spacer(),
              //         Icon(
              //           Icons.arrow_forward_ios_outlined,
              //           color: Color(0xffcccccb),
              //           size: 15,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Divider(
                color: Color(0xffcccccb),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Color(0xffcccccb),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: FittedBox(
                            child: Icon(
                              Icons.people_outline_sharp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Về Cookbook App',
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
                  height: 50,
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Color(0xffcccccb),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: FittedBox(
                            child: Icon(
                              Icons.login_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Đăng xuất',
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
                height: 10,
              ),
              Text(
                'Phiên bản 1.0.0',
                style: TextStyle(
                  color: Color(0xffcccccb),
                ),
              ),
            ],
          ),
          // Positioned(
          //     bottom: 0,
          //     left: 0,
          //     child: CustomNavbar(
          //       account: true,
          //     )),
        ],
      ),
    );
  }
}
