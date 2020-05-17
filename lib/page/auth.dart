import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email;
  String password;
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        body: Column(
            children: <Widget>[
              logo(),
              (
                  showLogin
                      ? Column(
                    children: <Widget>[
                      form('ВОЙТИ', buttonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                            child: Text('Нет аккаунта? Регистрируйся!',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                            onTap: () {
                              setState(() {
                                showLogin = false;
                              });
                            }
                        ),
                      )
                    ],
                  )
                  :Column(
                    children: <Widget>[
                      form('РЕГИСТРАЦИЯ', buttonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                            child: Text('У тебя есть логин? Заходи!',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                            onTap: () {
                              setState(() {
                                showLogin = true;
                              });
                            }
                        ),
                      )
                    ],
                  )
              ),
              bottomWave()
            ]
        )
    );
  }

  Widget bottomWave() {
    return Expanded(
      child: Align(
        child: ClipPath(
            child: Container(
              color: Colors.indigo,
              height: 300,
            ),
            clipper: BottomWaveClipper(),
        ),

      ),
    );
  }

  void buttonAction() {
    email = emailController.text;
    password = passwordController.text;

    emailController.clear();
    passwordController.clear();
  }

  Widget button(String text, void func()) {
    return RaisedButton(
      splashColor: Theme
          .of(context)
          .primaryColor,
      highlightColor: Theme
          .of(context)
          .primaryColor,
      color: Colors.white,
      child: Text(text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme
                  .of(context)
                  .primaryColor,
              fontSize: 20)),
      onPressed: () {
        func();
      },
    );
  }

  Widget logo() {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Align(
        child: Text('JAS ORDA',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
    );
  }

  Widget input(Icon icon, String hint, TextEditingController controller,
      bool obscure) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: TextStyle(fontSize: 20, color: Colors.white),
        decoration: InputDecoration(
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white30),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white54, width: 1)),
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: IconTheme(
                  data: IconThemeData(color: Colors.white), child: icon),
            )),
      ),
    );
  }

  Widget form(String label, void func()) {
    return Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 60),
              child: input(Icon(Icons.email), "EMAIL", emailController, false),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: input(
                  Icon(Icons.lock), "PASSWORD", passwordController, true),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 50,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: button(label, func),
              ),
            )
          ],
        ));
  }
}

class BottomWaveClipper extends CustomClipper <Path> {

  @override
  Path getClip(Size size){
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width,size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height+5);
    var secondControlPoint = Offset(size.width - (size.width-6),size.height);
    var secondEndPoint = Offset(size.width,0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
