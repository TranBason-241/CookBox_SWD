import 'package:app/getx/controller/user_controller.dart';
import 'package:app/screens/cart_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/widgets/custom_icon_button.dart';
import 'package:app/widgets/custom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InforScreen extends StatefulWidget {
  const InforScreen({Key? key}) : super(key: key);
  static const routeName = '/account';

  @override
  State<InforScreen> createState() => _InforScreenState();
}

class _InforScreenState extends State<InforScreen> {
  // static TextEditingController textEditingController = TextEditingController();
  UserController userController = Get.put(UserController());

  String phoneNumber = '';
  String userName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff32726),
        title: Text(
          'Thông tin cá nhân',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Divider(
                color: Color(0xffcccccb),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: InkWell(
                  onTap: () {
                    // Get.to()
                  },
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Obx(
                          () => Text(
                            '${userController.user.value.email}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Spacer(),
                        // Icon(
                        //   Icons.edit,
                        //   color: Color(0xffcccccb),
                        //   size: 15,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                color: Color(0xffcccccb),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: InkWell(
                  onTap: () {
                    // Get.to()
                  },
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Tên',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Obx(
                          () => Text(
                            '${userController.user.value.name}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Spacer(),
                        CustomIconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Color(0xffcccccb),
                              size: 15,
                            ),
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: EdgeInsets.only(top: 20),
                                    height: 600,
                                    // color: Colors.amber,
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text('Chỉnh sửa tên',
                                            style: TextStyle(fontSize: 25)),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child: Form(
                                              key: userController.formKey,
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              child: TextFormField(
                                                  controller: userController
                                                      .nameEditingController,
                                                  onSaved: (value) {
                                                    userController
                                                        .nameEditingController
                                                        .text = value!;
                                                  },
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Vui lòng nhập tên';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText: 'Nhập tên mới',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                  )),
                                            )),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary:
                                                  Colors.green, // background
                                              onPrimary:
                                                  Colors.white, // foreground
                                            ),
                                            child: const Text('Lưu'),
                                            onPressed: () => {
                                                  userController
                                                      .updateUser('name')
                                                })
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            margin: EdgeInsets.only())
                        // Icon(
                        //   Icons.edit,
                        //   color: Color(0xffcccccb),
                        //   size: 15,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),

              Divider(
                color: Color(0xffcccccb),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: InkWell(
                  onTap: () {
                    // Get.to()
                  },
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Số điện thoại',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Spacer(),
                        Obx(
                          () => Text(
                            '${userController.user.value.phone}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Spacer(),
                        CustomIconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Color(0xffcccccb),
                              size: 15,
                            ),
                            onPressed: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: EdgeInsets.only(top: 20),
                                    height: 400,
                                    // color: Colors.amber,
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text('Chỉnh sửa số điện thoại',
                                            style: TextStyle(fontSize: 25)),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10, top: 10),
                                          child: Form(
                                            key: userController.formKey,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            child: TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                controller: userController
                                                    .numberEditingController,
                                                textInputAction:
                                                    TextInputAction.search,
                                                validator: (value) {
                                                  if (value!
                                                          .toString()
                                                          .length !=
                                                      10) {
                                                    return 'Vui lòng nhập số điện đúng';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onSaved: (value) {
                                                  userController
                                                      .numberEditingController
                                                      .text = value!;
                                                },
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Nhập số điện thoại mới',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                )),
                                          ),
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary:
                                                  Colors.green, // background
                                              onPrimary:
                                                  Colors.white, // foreground
                                            ),
                                            child: const Text('Lưu'),
                                            onPressed: () {
                                              userController
                                                  .updateUser('phone');
                                              // Get.back();
                                            })
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            margin: EdgeInsets.only())
                        // Icon(
                        //   Icons.edit,
                        //   color: Color(0xffcccccb),
                        //   size: 15,
                        // ),
                      ],
                    ),
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
              //                 Icons.people_outline_sharp,
              //                 color: Colors.black,
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           'Về Cookbook App',
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
              //                 Icons.login_outlined,
              //                 color: Colors.black,
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           'Đăng xuất',
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
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   'Phiên bản 1.0.0',
              //   style: TextStyle(
              //     color: Color(0xffcccccb),
              //   ),
              // ),
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
