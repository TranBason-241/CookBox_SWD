import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/singnup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 30.0),
              child: Text(
                "Đăng ký",
                style: TextStyle(fontSize: 30.0),
              ),
            ),

            // NameEdit text
            Container(
              margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Tên", // Set text upper animation
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                autofocus: false,
                keyboardType: TextInputType.text,
              ),
            ),

            // Email Edit text
            Container(
              margin: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Email", border: OutlineInputBorder()),
                minLines: 1,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
              ),
            ),

            // Password Edit text
            Container(
              margin: const EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Mật khẩu", // Set text upper animation
                  border: OutlineInputBorder(),
                ),
                minLines: 1,
                autofocus: false,
                keyboardType: TextInputType.text,
                obscureText: true, // Hiding words
              ),
            ),

            // Login Button
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 50.0),
                    child: RaisedButton(
                      onPressed:
                          () {}, // When Click on Button goto Login Screen

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 300.0,
                              minHeight:
                                  40.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: const Text(
                            'Đăng ký',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ))),

            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Đã có tài khoản "),
                        GestureDetector(
                          child: Text(
                            "  Đăng nhập",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
