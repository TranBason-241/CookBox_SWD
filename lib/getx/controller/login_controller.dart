import 'dart:developer';

import 'package:app/getx/controller/user_controller.dart';
import 'package:app/models/user.dart';
import 'package:app/screens/ggmap/ride_picker_page.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/login_screen.dart';
import 'package:app/screens/map_picker_screen.dart';
import 'package:app/screens/required_number_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  // Intilize the flutter app
  late FirebaseApp firebaseApp;
  late User firebaseUser;
  late FirebaseAuth firebaseAuth;

  Future<void> initlizeFirebaseApp() async {
    firebaseApp = await Firebase.initializeApp();
  }

  Future<Widget> checkUserLoggedIn() async {
    if (firebaseApp == null) {
      await initlizeFirebaseApp();
    }
    if (firebaseAuth == null) {
      firebaseAuth = FirebaseAuth.instance;
      update();
    }
    if (firebaseAuth.currentUser == null) {
      return LoginScreen();
    } else {
      firebaseUser = firebaseAuth.currentUser!;
      update();
      return Home();
    }
  }

  Future<void> login() async {
    var prefs = await SharedPreferences.getInstance();
    try {
      // Get.dialog(Center(child: LoadingWidget()), barrierDismissible: false);

      await initlizeFirebaseApp();

      firebaseAuth = FirebaseAuth.instance;

      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredentialData =
          await FirebaseAuth.instance.signInWithCredential(credential);
      firebaseUser = userCredentialData.user!;
      var idToken = await firebaseUser.getIdToken();
      prefs.setString('email', firebaseUser.email!);

      Map data = {'token': idToken};
      var body = json.encode(data);
      var response = await http.post(
          Uri.parse("http://54.255.129.30:8100/api/v1/login"),
          headers: {"Content-Type": "application/json"},
          body: body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        var token = responseData['token'];
        print('JWT: ${token}');
        prefs.setString('token', token);

        //call api lấy user về, xong check xem có sđt chưa  api get user by email
        UserController controller = Get.put(UserController());
        //call để nó có User Sẵn
        String email = firebaseUser.email!;
        final response2 = await http.get(
            Uri.parse(
                'http://54.255.129.30:8100/api/v1/user/accounts/${email}'),
            headers: {
              "Accept": "application/json",
              "content-type": "application/json",
              "Authorization": "Bearer ${token}"
            });
        if (response2.statusCode == 200) {
          // print("call api getUser");
          UserLogin userInfo = await userFromJson(response2.body);
          //save userID to local
          prefs.setInt('userID', userInfo.id!);
          prefs.setString('userName', userInfo.name!);
          if (userInfo.phone == null || userInfo.phone!.isEmpty) {
            // userInfo.phone == null || userInfo.phone!.isEmpty
            //  || userInfo.phone!.isEmpty
            update();
            Get.back();
            Get.to((RequiredPhoneBumberScreen()));
          } else {
            update();
            Get.back();
            // Get.off(Home());
            Get.off(RidePickerPage());
          }
        } else {
          throw Exception("fail to check phone number");
        }
        ;
      }

      //  var response2 = await http.get(
      // Uri.parse(
      //     "https://booking-yacht.azurewebsites.net/api/v1/agencies"),
      // headers: {"Content-Type": "application/json", "Authorization": "Bearer $token"},
      // );

    } catch (ex) {
      Get.back();
      Get.snackbar('Sign In Error', 'Error Signing in',
          duration: Duration(seconds: 5),
          backgroundColor: Colors.black,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ));
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // HomeController controller = Get.find<HomeController>();
    // controller.tabIndex = 0;

    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.to(LoginScreen());
  }
}
